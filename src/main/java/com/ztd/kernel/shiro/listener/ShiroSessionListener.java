package com.ztd.kernel.shiro.listener;

import com.ztd.kernel.shiro.service.ShiroSessionService;
import com.ztd.kernel.shiro.session.ShiroSessionDao;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ShiroSessionListener implements SessionListener {

    private static final Logger logger = LoggerFactory.getLogger(ShiroSessionListener.class);

    private ShiroSessionService shiroSessionService;
    private ShiroSessionDao shiroSessionDao;

    @Override
    public void onStart(Session session) {
        // 会话创建时触发
        logger.debug("session {} onStart", session.getId());
    }

    @Override
    public void onStop(Session session) {
        shiroSessionDao.delete(session);
        shiroSessionService.sendUncacheSessionMessage(session.getId());
        logger.debug("session {} onStop", session.getId());
    }

    @Override
    public void onExpiration(Session session) {
        shiroSessionDao.delete(session);
        shiroSessionService.sendUncacheSessionMessage(session.getId());
        logger.debug("session {} onExpiration", session.getId());
    }

    public ShiroSessionService getShiroSessionService() {
        return shiroSessionService;
    }

    public void setShiroSessionService(ShiroSessionService shiroSessionService) {
        this.shiroSessionService = shiroSessionService;
    }

    public ShiroSessionDao getShiroSessionDao() {
        return shiroSessionDao;
    }

    public void setShiroSessionDao(ShiroSessionDao shiroSessionDao) {
        this.shiroSessionDao = shiroSessionDao;
    }
}
