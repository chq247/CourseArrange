package com.chq.coursearrange.controller;

import com.chq.coursearrange.dao.AdminDao;
import com.chq.coursearrange.entity.Admin;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDateTime;

/**
 * @author CHQ
 */
public class AdminTest {

    @Autowired
    private AdminDao adminDao;

    @Test
    public void testAdd() {
        Admin admin = new Admin();
        admin.setId(1);
        admin.setAdminNo("10011");
        admin.setUsername("admin");
        admin.setPassword("123");
        admin.setRealname("梁主任");
        admin.setJobtitle("教务处主任");
        admin.setDescription("认真对待工作");
        admin.setRemark("务实");
        admin.setStatus(0);
        admin.setCreateTime(LocalDateTime.now());
        admin.setUpdateTime(LocalDateTime.now());
        adminDao.insert(admin);
    }
}
