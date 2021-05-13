package com.ztd.kernel.mapper;

import com.ztd.kernel.model.User;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author lijike
 * @since 2017-07-26
 */
public interface UserMapper extends BaseMapper<User> {

    User getUserByAccount(String account);
    List<String> getUserRolesByAccount(String account);
    List<String> getUserPermissionsByAccount(String account);

}