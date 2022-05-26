package com.chq.coursearrange.service;

import com.chq.coursearrange.entity.Teacher;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author CHQ
 */
public interface TeacherService extends IService<Teacher> {



    Teacher teacherLogin(String username, String password);

    List<Teacher> selectTeacherAll();

    Teacher selectByRealName(String substring);

    int getSize();

    int getTeacherReg(String yesday);
}
