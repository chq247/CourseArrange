package com.chq.coursearrange.service;

import com.chq.coursearrange.entity.Student;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author lequal
 * @since 2020-03-13
 */
public interface StudentService extends IService<Student> {

    Student studentLogin(String username, String password);
}
