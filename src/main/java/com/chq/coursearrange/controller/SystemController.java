package com.chq.coursearrange.controller;

import com.chq.coursearrange.common.ServerResponse;
import com.chq.coursearrange.dao.TeacherDao;
import com.chq.coursearrange.service.*;
import com.chq.coursearrange.dao.StudentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author: CHQ
 * @Date: 2022/5/20
 * @Descripe: 获取系统相关的数据
 */
@RestController
public class SystemController {

    @Autowired
    private TeacherService teacherService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private CourseInfoService courseInfoService;
    @Autowired
    private ClassInfoService classInfoService;
    @Autowired
    private ClassTaskService classTaskService;
    @Autowired
    private TeachbuildInfoService teachbuildInfoService;
    @Autowired
    private DocService docService;
    @Autowired
    private ClassroomService classroomService;
    @Autowired
    private StudentDao studentDao;
    @Autowired
    private  OnlineCourseService onlineCourseService;
    @Autowired
    private TeacherDao teacherDao;


    @GetMapping("/systemdata")
    public ServerResponse systemData() {
        Map<String, Object> map = new HashMap<>();
        int taacherSize = teacherService.getSize();
        int courseSize = courseInfoService.getSize();
        int classeSize = classInfoService.getSize();
        int teachbuilds = teachbuildInfoService.count();
        int classrooms = classroomService.count();
        int classtasks = classTaskService.count();
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE,-1);
        Date d = cal.getTime();
        SimpleDateFormat sp = new SimpleDateFormat("yyyy-MM-dd");
        String yesday = sp.format(d);
        int teacherReg = teacherDao.teacherReg(yesday);
        map.put("teachers", taacherSize);
        map.put("courses", courseSize);
        map.put("classes", classeSize);
        map.put("teachbuilds", teachbuilds);
        map.put("classtasks", classtasks);
        map.put("classrooms", classrooms);
        map.put("teacherReg", teacherReg);
        return ServerResponse.ofSuccess(map);
    }

}
