package com.ztd.kernel.controller;
import com.ztd.kernel.model.ShiroUser;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by lijike 2017/3/30.
 */
@Controller  
public class LoginController {
    /**
     * 跳转到登录页面
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login(){
        //判断用户是否已经登录
        //如果用户已经是登录状态：直接跳转到我们的index主页    
        return "login";
    }


    /**
     * 跳转到无权限页面
     * @return
     */
    @RequestMapping(value = "/noauth",method = RequestMethod.GET)
    public String noauth(){
        return "noauth";
    }

    /**
     * 用户提交认证信息认证未通时过调用下面的请求
     * 注意：如果认证通过，shiro框架会请求应用的根目录 "/"
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String fail(Model model, HttpServletRequest request)
            throws Exception {
        // shiro在认证过程中出现错误后将异常类路径通过request返回
        String exceptionClassName = (String) request.getAttribute("shiroLoginFailure");
        if(StringUtils.isNotEmpty(exceptionClassName)){
            model.addAttribute("error","用户名或密码错误");
        }
        //认证未通过，返回登录页面
        return "login";
    }

    /**
     * 登录成功以后的跳转页面
     * @return
     */
    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String index(){
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        return "education/teacher/index";
    }
}
