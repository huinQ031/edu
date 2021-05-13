package com.ztd.kernel.shiro.realm;

import com.ztd.kernel.model.CustomToken;
import com.ztd.kernel.model.ShiroUser;
import com.ztd.kernel.model.User;
import com.ztd.kernel.service.SysService;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import java.util.List;

public class ShiroDbRealm extends AuthorizingRealm {

    private SysService sysService;

    public ShiroDbRealm() {
        super();
        setAuthenticationTokenClass(CustomToken.class);
    }

    /**
     * 认证回调函数,登录时调用.
     * AuthenticationInfo 中principal会设置到Session中并通过SessionDao保存起来
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) {
        CustomToken token = (CustomToken) authcToken;
        String loginName = token.getLoginName();
        String host = token.getHost();

        //访问数据库，通过用户名查找到对应的用户信息-->可以获取到用户的凭证信息
        User user = sysService.getUserByAccount(loginName);
        if(user == null){
            return null;
        }
        Boolean isAdmin = Boolean.FALSE;
        if("Administrator".equals(user.getAccountTypeCode())){
            isAdmin = Boolean.TRUE;
        }

        //如果在数据库查询不到改用户，return null
        //如果找到对应用户，取出用户的密码，让shiro进行凭证的匹配
        String password = user.getPassword();
        String salt = user.getSalt();

        // 创建principal身份
        ShiroUser su = new ShiroUser.Builder(user.getUserId().toString(), user.getAccount()).name(user.getName()).isAdmin(isAdmin).ip(host).builder();
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(su, password, ByteSource.Util.bytes(salt),getName());
        return info;
    }

    /**
     * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
     * 只会被缓存，不会被设置到Session中
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

        ShiroUser shiroUser = (ShiroUser) principals.getPrimaryPrincipal();
        //获取到认证成功以后的用户帐号
        String account = shiroUser.getLoginName();

        // 根据身份信息从数据库中查询权限数据
        // 权限信息的对象
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        //将角色信息设置到AuthorizationInfo
        List<String> roles = sysService.getUserRolesByAccount(account);
        info.addRoles(roles);

        //将权限信息封封装到AuthorizationInfo
        List<String> permissions = sysService.getUserPermissionsByAccount(account);
        //注意：加入的权限字符串不能为空值
        info.addStringPermissions(permissions);
        return info;
    }

    public SysService getSysService() {
        return sysService;
    }

    public void setSysService(SysService sysService) {
        this.sysService = sysService;
    }
}