package com.chq.coursearrange.service;

import com.chq.coursearrange.entity.Teacher;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author lequal
 * @since 2020-03-13
 */
public interface TeacherService extends IService<Teacher> {



    Teacher teacherLogin(String username, String password);

    List<Teacher> selectTeacherAll();

    Teacher selectByRealName(String substring);

    int getSize();

    int getTeacherReg(String yesday);
}
