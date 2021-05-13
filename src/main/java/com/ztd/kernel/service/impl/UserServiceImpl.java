package com.ztd.kernel.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ztd.kernel.mapper.UserMapper;
import com.ztd.kernel.model.User;
import com.ztd.kernel.service.UserService;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author lijike
 * @since 2017-07-26
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

}
