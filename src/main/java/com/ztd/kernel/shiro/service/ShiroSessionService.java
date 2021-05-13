package com.ztd.kernel.shiro.service;

import com.ztd.kernel.shiro.session.ShiroSession;
import com.ztd.kernel.shiro.session.ShiroSessionDao;
import org.apache.commons.collections.CollectionUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.core.RedisTemplate;

import java.io.Serializable;
import java.lang.management.ManagementFactory;
import java.util.*;

/**
 * 直接操作Session属性，不会被保存
 * 封装Session属性相关操作 Session属性发生改变时保存到Redis中并通知其它节点清空本地EhCache缓存
 */
public class ShiroSessionService extends ShiroSessionMessageListener {

    private Logger logger = LoggerFactory.getLogger(ShiroSessionService.class);

    private ShiroSessionDao shiroSessionDao;
    private RedisTemplate<String, Serializable> redisTemplate;
    private String uncacheChannel = "shiro.session.uncache";

    public void sendUncacheSessionMessage(Serializable sessionId) {
        String nodeId = ManagementFactory.getRuntimeMXBean().getName();
        ShiroSessionMessage.MessageBody messageBody = new ShiroSessionMessage.MessageBody(sessionId, nodeId);
        redisTemplate.convertAndSend(uncacheChannel, messageBody);
    }


    public ShiroSession getSession() {
        return (ShiroSession) this.shiroSessionDao.doReadSessionWithoutExpire(SecurityUtils.getSubject()
                .getSession().getId());
    }


    public void setId(Serializable id) {
        ShiroSession session = this.getSession();
        session.setId(id);
        this.shiroSessionDao.update(session);
        // 通过发布消息通知其他节点取消本地对session的缓存
        sendUncacheSessionMessage(session.getId());
    }

    public void setStopTimestamp(Date stopTimestamp) {
        ShiroSession session = this.getSession();
        session.setStopTimestamp(stopTimestamp);
        this.shiroSessionDao.update(session);
        // 通过发布消息通知其他节点取消本地对session的缓存
        sendUncacheSessionMessage(session.getId());
    }

    public void setExpired(boolean expired) {
        ShiroSession session = this.getSession();
        session.setExpired(expired);
        this.shiroSessionDao.update(session);
        // 通过发布消息通知其他节点取消本地对session的缓存
        sendUncacheSessionMessage(session.getId());
    }

    public void setTimeout(long timeout) {
        ShiroSession session = this.getSession();
        session.setTimeout(timeout);
        this.shiroSessionDao.update(session);
        // 通过发布消息通知其他节点取消本地对session的缓存
        sendUncacheSessionMessage(session.getId());
    }

    public void setHost(String host) {
        ShiroSession session = this.getSession();
        session.setHost(host);
        this.shiroSessionDao.update(session);
        // 通过发布消息通知其他节点取消本地对session的缓存
        sendUncacheSessionMessage(session.getId());
    }

    public void setAttributes(Map<Object, Object> attributes) {
        ShiroSession session = this.getSession();
        session.setAttributes(attributes);
        this.shiroSessionDao.update(session);
        // 通过发布消息通知其他节点取消本地对session的缓存
        sendUncacheSessionMessage(session.getId());
    }

    public Map<Object, Object> getAttributes() {
        return this.getSession().getAttributes();
    }

    public void setAttribute(Object key, Object value) {
        ShiroSession session = this.getSession();
        session.setAttribute(key, value);
        this.shiroSessionDao.update(session);
        // 通过发布消息通知其他节点取消本地对session的缓存
        sendUncacheSessionMessage(session.getId());
    }

    public Object getAttribute(Object key) {
        return this.getSession().getAttribute(key);
    }

    public Collection<Object> getAttributeKeys() {
        return this.getSession().getAttributeKeys();
    }

    public Object removeAttribute(Object key) {
        ShiroSession session = this.getSession();
        Object res = session.removeAttribute(key);
        this.shiroSessionDao.update(session);
        // 通过发布消息通知其他节点取消本地对session的缓存
        sendUncacheSessionMessage(session.getId());
        return res;
    }



    public void flushRedis() {
        Collection<Session> activeSession = shiroSessionDao.getActiveSessions();
        if (activeSession != null) {
            for (Session session : activeSession) {
                try {
                    shiroSessionDao.doDelete(session);
                } catch (Exception e) {

                }
            }
        }
    }

    public void flushEhCache() {
        Set<Session> sessions = new HashSet<>();
        Collection<Session> ehCacheActiveSession = shiroSessionDao.getEhCacheActiveSessions();
        Collection<Session> activeSession = shiroSessionDao.getActiveSessions();
        if (CollectionUtils.isNotEmpty(ehCacheActiveSession)) {
            sessions.addAll(ehCacheActiveSession);
        }
        if (CollectionUtils.isNotEmpty(activeSession)) {
            sessions.addAll(activeSession);
        }
        for (Session session : sessions) {
            try {
                shiroSessionDao.uncache(session.getId());
            } catch (Exception e) {
            }
        }
        logger.info("flushEhCache Project EhCacheActiveSessions {} ", shiroSessionDao.getEhCacheActiveSessions().size());
    }

    public void flushAll() {
        Collection<Session> activeSession = shiroSessionDao.getActiveSessions();
        if (activeSession != null) {
            for (Session session : activeSession) {
                try {
                    shiroSessionDao.delete(session);
                } catch (Exception e) {
                }
            }
        }
    }

    @Override
    public void onMessage(ShiroSessionMessage message) {
        logger.debug("channel {} , message {} ", message.getChannel(), message.msgBody);
        shiroSessionDao.uncache(message.msgBody.sessionId);
    }

    public ShiroSessionDao getShiroSessionDao() {
        return shiroSessionDao;
    }

    public void setShiroSessionDao(ShiroSessionDao shiroSessionDao) {
        this.shiroSessionDao = shiroSessionDao;
    }

    public RedisTemplate<String, Serializable> getRedisTemplate() {
        return redisTemplate;
    }

    public void setRedisTemplate(RedisTemplate<String, Serializable> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }
}