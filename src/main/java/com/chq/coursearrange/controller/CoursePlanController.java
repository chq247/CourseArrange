package com.chq.coursearrange.controller;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chq.coursearrange.service.CourseInfoService;
import com.chq.coursearrange.common.ServerResponse;
import com.chq.coursearrange.entity.CourseInfo;
import com.chq.coursearrange.entity.CoursePlan;
import com.chq.coursearrange.entity.Teacher;
import com.chq.coursearrange.entity.response.CoursePlanVo;
import com.chq.coursearrange.service.CoursePlanService;
import com.chq.coursearrange.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.LinkedList;
import java.util.List;

/**
 * @author CHQ
 */
@RestController
public class CoursePlanController {

    @Autowired
    private CourseInfoService courseInfoService;
    @Autowired
    private CoursePlanService coursePlanService;
    @Autowired
    private TeacherService teacherService;

    /**
     * 根据班级查询课程表
     * @param classNo
     * @return
     */
    @GetMapping("/courseplan/{classno}")
    public ServerResponse queryCoursePlanByClassNo(@PathVariable("classno") String classNo) {
        QueryWrapper<CoursePlan> wrapper = new QueryWrapper<CoursePlan>().eq("class_no", classNo).orderByAsc("class_time");
        List<CoursePlan> coursePlanList = coursePlanService.list(wrapper);
        List<CoursePlanVo> coursePlanVos = new LinkedList<>();
        coursePlanList.forEach(v->{
            CoursePlanVo coursePlanVo = JSON.parseObject(JSON.toJSONString(v), CoursePlanVo.class);
            coursePlanVo.setCourseInfo(courseInfoService.getOne(new QueryWrapper<CourseInfo>().eq("course_no",v.getCourseNo())));
            coursePlanVo.setTeacher(teacherService.getOne(new QueryWrapper<Teacher>().eq("teacher_no",v.getTeacherNo())));
            coursePlanVos.add(coursePlanVo);
        });
        return ServerResponse.ofSuccess(coursePlanVos);
    }

}

