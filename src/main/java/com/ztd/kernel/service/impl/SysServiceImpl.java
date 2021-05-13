package com.ztd.kernel.service.impl;

import com.ztd.kernel.mapper.ResourceMapper;
import com.ztd.kernel.mapper.UserMapper;
import com.ztd.kernel.model.Resource;
import com.ztd.kernel.model.User;
import com.ztd.kernel.service.SysService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lijike 2017/3/28.
 */
@Service
public class SysServiceImpl implements SysService{

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ResourceMapper resourceMapper;

    /**
     * 通过账号获取用户的信息
     * @param account
     */
    public User getUserByAccount(String account){
        return userMapper.getUserByAccount(account);
    }
    

    /**
     * 通过账号获取用户的角色信息
     *
     * @param account
     * @return
     */
    public List<String> getUserRolesByAccount(String account) {
        return userMapper.getUserRolesByAccount(account);
    }

    /**
     * 通过账号获取用户的权限信息
     *
     * @param account
     * @return
     */
    public List<String> getUserPermissionsByAccount(String account) {
        return  userMapper.getUserPermissionsByAccount(account);
    }

    /**
     * 通过用户的id查找用户所拥有的资源
     * @param userId
     * @return
     */
    public List<Resource> getResourceByUserId(Long userId) {
        return  resourceMapper.getResourceByUserId(userId);
    }
}
