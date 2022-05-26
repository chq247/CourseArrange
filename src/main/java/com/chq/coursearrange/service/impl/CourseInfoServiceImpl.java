package com.chq.coursearrange.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chq.coursearrange.dao.CourseInfoDao;
import com.chq.coursearrange.service.CourseInfoService;
import com.chq.coursearrange.entity.CourseInfo;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author CHQ
 */
@Service
public class CourseInfoServiceImpl extends ServiceImpl<CourseInfoDao, CourseInfo> implements CourseInfoService {

    @Autowired
    CourseInfoDao courseInfoDao;

    @Override
    public List<CourseInfo> selectCourse() {
        List<CourseInfo> courseInfos = courseInfoDao.selectList(null);
        return courseInfos;
    }

    @Override
    public CourseInfo selectByName(String courseName) {
        QueryWrapper<CourseInfo> qw = new QueryWrapper<>();
        qw.eq("course_name",courseName);
        CourseInfo courseInfo = courseInfoDao.selectOne(qw);
        System.out.println(courseInfo);
        return courseInfo;
    }

    @Override
    public int getSize() {
        int courseSize = courseInfoDao.getSize();
        return courseSize;
    }
}
