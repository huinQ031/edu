package com.ztd.kernel.service.impl;

import com.ztd.kernel.model.Resource;
import com.ztd.kernel.mapper.ResourceMapper;
import com.ztd.kernel.service.ResourceService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
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
public class ResourceServiceImpl extends ServiceImpl<ResourceMapper, Resource> implements ResourceService {
	
}
