package com.chq.coursearrange.service;

import com.chq.coursearrange.entity.Admin;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author CHQ
 */
public interface AdminService extends IService<Admin> {

    Admin adminLogin(String username, String password);

}
