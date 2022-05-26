package com.chq.coursearrange.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chq.coursearrange.dao.AdminDao;
import com.chq.coursearrange.entity.Admin;
import com.chq.coursearrange.service.AdminService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author CHQ
 */
@Service
public class AdminServiceImpl extends ServiceImpl<AdminDao, Admin> implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public Admin adminLogin(String username, String password) {
        QueryWrapper<Admin> wrapper = new QueryWrapper<>();
        wrapper.eq("admin_no", username);
        wrapper.eq("password", password);
        return adminDao.selectOne(wrapper);
    }
}
