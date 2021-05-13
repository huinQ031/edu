package com.ztd.kernel.mapper;

import com.ztd.kernel.model.Resource;
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
public interface ResourceMapper extends BaseMapper<Resource> {
    List<Resource> selectAll();

    List<Resource> getResourceByUserId(Long userId);
}