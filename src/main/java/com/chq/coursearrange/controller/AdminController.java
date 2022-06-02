package com.chq.coursearrange.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chq.coursearrange.common.ServerResponse;
import com.chq.coursearrange.entity.Admin;
import com.chq.coursearrange.entity.request.PasswordVO;
import com.chq.coursearrange.entity.request.UserLoginRequest;
import com.chq.coursearrange.service.AdminService;
import com.chq.coursearrange.service.TeacherService;
import com.chq.coursearrange.service.impl.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * @author CHQ
 */
@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;
    @Autowired
    private TokenService tokenService;


    /**
     * 管理员登录
     * @param adminLoginRequest
     * @return
     */
    @PostMapping("/login")
    public ServerResponse adminLogin(@RequestBody UserLoginRequest adminLoginRequest) {
        Map<String, Object> map = new HashMap();
        Admin admin = adminService.adminLogin(adminLoginRequest.getUsername(), adminLoginRequest.getPassword());
        if (admin != null){
            String token = tokenService.getToken(admin);
            map.put("admin", admin);
            map.put("token", token);
            return ServerResponse.ofSuccess(map);
        }
        return ServerResponse.ofError("用户名或密码错误!");
    }

    /**
     * 管理员更新个人资料
     * @return
     */
    @PostMapping("/modify")
    public ServerResponse modifyAdmin(@RequestBody Admin admin) {
        return adminService.updateById(admin) ? ServerResponse.ofSuccess("更新成功！") : ServerResponse.ofError("更新失败！");
    }

    /**
     * 根据ID查询管理员信息
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public ServerResponse queryAdmin(@PathVariable("id") Integer id) {
        return ServerResponse.ofSuccess(adminService.getById(id));
    }

    /**
     * 管理员修改密码
     * @param passwordVO
     * @return
     */
    @PostMapping("/password")
    public ServerResponse updatePass(@RequestBody PasswordVO passwordVO) {
        System.out.println(passwordVO + "======");
        QueryWrapper<Admin> wrapper = new QueryWrapper();
        wrapper.eq("id", passwordVO.getId());
        wrapper.eq("password", passwordVO.getOldPass());
        Admin admin = adminService.getOne(wrapper);
        if (admin == null) {
            return ServerResponse.ofError("旧密码错误");
        }
        // 否则进入修改密码流程
        admin.setPassword(passwordVO.getNewPass());
        boolean b = adminService.updateById(admin);
        if (b) {
            return ServerResponse.ofSuccess("密码修改成功");
        }
        return ServerResponse.ofError("密码更新失败");
    }


}

