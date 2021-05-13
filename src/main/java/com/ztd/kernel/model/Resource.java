package com.ztd.kernel.model;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author lijike
 * @since 2017-07-26
 */
@TableName("sys_resource")
public class Resource extends Model<Resource> {

    private static final long serialVersionUID = 1L;

	@TableId(value="resource_id", type= IdType.AUTO)
	private Long resourceId;
	@TableField("resource_name")
	private String resourceName;
	@TableField("resource_type_code")
	private String resourceTypeCode;
	@TableField("resource_url")
	private String resourceUrl;
	@TableField("parent_id")
	private Long parentId;
	@TableField("parent_ids")
	private String parentIds;
	@TableField("resource_permission")
	private String resourcePermission;


	public Long getResourceId() {
		return resourceId;
	}

	public void setResourceId(Long resourceId) {
		this.resourceId = resourceId;
	}

	public String getResourceName() {
		return resourceName;
	}

	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}

	public String getResourceTypeCode() {
		return resourceTypeCode;
	}

	public void setResourceTypeCode(String resourceTypeCode) {
		this.resourceTypeCode = resourceTypeCode;
	}

	public String getResourceUrl() {
		return resourceUrl;
	}

	public void setResourceUrl(String resourceUrl) {
		this.resourceUrl = resourceUrl;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}

	public String getResourcePermission() {
		return resourcePermission;
	}

	public void setResourcePermission(String resourcePermission) {
		this.resourcePermission = resourcePermission;
	}

	@Override
	protected Serializable pkVal() {
		return this.resourceId;
	}

	@Override
	public String toString() {
		return "Resource{" +
			"resourceId=" + resourceId +
			", resourceName=" + resourceName +
			", resourceTypeCode=" + resourceTypeCode +
			", resourceUrl=" + resourceUrl +
			", parentId=" + parentId +
			", parentIds=" + parentIds +
			", resourcePermission=" + resourcePermission +
			"}";
	}
}
