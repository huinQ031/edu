package com.ztd.kernel.shiro.session;

import com.ztd.kernel.shiro.service.ShiroSessionRepository;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.ValidatingSession;
import org.apache.shiro.session.mgt.eis.CachingSessionDAO;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

public class ShiroSessionDao extends CachingSessionDAO {

    private static final Logger logger = LoggerFactory.getLogger(ShiroSessionDao.class);

    private ShiroSessionRepository shiroSessionRepository;
    /**
     * 重写CachingSessionDAO中readSession方法，如果Session中没有登陆信息就调用doReadSession方法从Redis中重读
     * session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY) == null 代表没有登录，登录后Shiro会放入该值
     */
    @Override
    public Session readSession(Serializable sessionId) throws UnknownSessionException {
        Session session = getCachedSession(sessionId);
        if (session == null || session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY) == null) {
            session = this.doReadSession(sessionId);
            if (session == null) {
                throw new UnknownSessionException("There is no session with id [" + sessionId + "]");
            } else {
                // 缓存
                cache(session, session.getId());
            }
        }
        return session;
    }

    /**
     * 根据会话ID获取会话
     *
     * @param sessionId 会话ID
     * @return ShiroSession
     */
    @Override
    protected Session doReadSession(Serializable sessionId) {
        logger.debug("begin doReadSession {} ", sessionId);
        Session session = null;
        try {
            session = shiroSessionRepository.getSession(sessionId);
            if (session!=null) {
                // 重置Redis中缓存过期时间
                shiroSessionRepository.refreshSession(sessionId);
                logger.info("sessionId {} name {} 被读取", sessionId, session.getClass().getName());
            }
        } catch (Exception e) {
            logger.warn("读取Session失败", e);
        }
        return session;
    }

    public Session doReadSessionWithoutExpire(Serializable sessionId) {
        Session session = null;
        try {
            session = shiroSessionRepository.getSession(sessionId);
        } catch (Exception e) {
            logger.warn("读取Session失败", e);
        }
        return session;
    }

    /**
     * 如DefaultSessionManager在创建完session后会调用该方法；
     * 如保存到关系数据库/文件系统/NoSQL数据库；即可以实现会话的持久化；
     * 返回会话ID；主要此处返回的ID.equals(session.getId())；
     */
    @Override
    protected Serializable doCreate(Session session) {
        // 创建一个Id并设置给Session
        Serializable sessionId = this.generateSessionId(session);
        assignSessionId(session, sessionId);
        try {
            shiroSessionRepository.saveSession(session);
            logger.info("sessionId {} name {} 被创建", sessionId, session.getClass().getName());
        } catch (Exception e) {
            logger.warn("创建Session失败", e);
        }
        return sessionId;
    }

    /**
     * 更新会话；如更新会话最后访问时间/停止会话/设置超时时间/设置移除属性等会调用
     */
    @Override
    protected void doUpdate(Session session) {
        //如果会话过期/停止 没必要再更新了
        try {
            if (session instanceof ValidatingSession && !((ValidatingSession) session).isValid()) {
                return;
            }
        } catch (Exception e) {
            logger.error("ValidatingSession error");
        }
        try {
            if (session instanceof ShiroSession) {
                // 如果没有主要字段(除lastAccessTime以外其他字段)发生改变
                ShiroSession ss = (ShiroSession) session;
                if (!ss.isChanged()) {
                    return;
                }
                ss.setChanged(false);
                ss.setLastAccessTime(new Date());
                shiroSessionRepository.updateSession(session);
//                jedisCluster.setex(keySerializer.serialize((prefix + session.getId())), seconds
//                        , valueSerializer.serialize(ss));

                //发送广播
//                jedisUtil.publish("shiro.session.uncache", session.getId());
                logger.debug("sessionId {} name {} 被更新", session.getId(), session.getClass().getName());
            } else {
                logger.debug("sessionId {} name {} 更新失败", session.getId(), session.getClass().getName());
            }
        } catch (Exception e) {
            logger.warn("更新Session失败", e);
        }
    }

    /**
     * 删除会话；当会话过期/会话停止（如用户退出时）会调用
     */
    @Override
    public void doDelete(Session session) {
        logger.debug("begin doDelete {} ", session);
        try {
            shiroSessionRepository.deleteSession(session.getId());
            this.uncache(session.getId());
            logger.debug("shiro session id {} 被删除", session.getId());
        } catch (Exception e) {
            logger.warn("删除Session失败", e);
        }
    }

    /**
     * 删除本地cache中缓存的Session
     */
    public void uncache(Serializable sessionId) {
        try {
            Session session = super.getCachedSession(sessionId);
            super.uncache(session);
            logger.debug("删除本地 cache中缓存的Session id {} 的缓存失效", sessionId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取当前所有活跃用户，如果用户量多此方法影响性能
     */
    @Override
    public Collection<Session> getActiveSessions() {
        return null;
    }

    /**
     * 返回本机Ehcache中Session
     */
    public Collection<Session> getEhCacheActiveSessions() {
        return super.getActiveSessions();
    }


    public ShiroSessionRepository getShiroSessionRepository() {
        return shiroSessionRepository;
    }

    public void setShiroSessionRepository(ShiroSessionRepository shiroSessionRepository) {
        this.shiroSessionRepository = shiroSessionRepository;
    }
}
