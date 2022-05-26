package com.chq.coursearrange.service;

import com.chq.coursearrange.entity.Student;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author CHQ
 */
public interface StudentService extends IService<Student> {

    Student studentLogin(String username, String password);

    int getSize();

    int getStudentReg(String yesday);
}
