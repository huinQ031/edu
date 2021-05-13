package com.ztd.kernel.service;

import com.ztd.kernel.model.Resource;
import com.ztd.kernel.model.User;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * Created by lijike 2017/3/28.
 */
@Service
public interface SysService {


    /**
     * 通过账号获取用户的信息
     *
     * @param account
     */
    User getUserByAccount(String account);


    /**
     * 通过账号获取用户的角色信息
     *
     * @param account
     * @return
     */
    List<String> getUserRolesByAccount(String account);

    /**
     * 通过账号获取用户的权限信息
     *
     * @param account
     * @return
     */
    List<String> getUserPermissionsByAccount(String account);

    /**
     * 通过用户的id查找用户所拥有的资源
     *
     * @param userId
     * @return
     */
    List<Resource> getResourceByUserId(Long userId);
}
