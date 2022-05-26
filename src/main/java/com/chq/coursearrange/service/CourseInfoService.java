package com.chq.coursearrange.service;

import com.chq.coursearrange.entity.CourseInfo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author CHQ
 */
public interface CourseInfoService extends IService<CourseInfo> {
    List<CourseInfo> selectCourse ();


    CourseInfo selectByName(String courseName);

    int getSize();
}
