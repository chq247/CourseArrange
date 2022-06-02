package com.chq.coursearrange.controller;

import com.chq.coursearrange.common.ServerResponse;
import com.chq.coursearrange.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author CHQ
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
    private ClassroomService classroomService;


    @GetMapping("/systemdata")
    public ServerResponse systemData() {
        Map<String, Object> map = new HashMap<>();
        int taacherSize = teacherService.getSize();
        int courseSize = courseInfoService.getSize();
        int classeSize = classInfoService.getSize();
        int teachbuilds = teachbuildInfoService.count();
        int classrooms = classroomService.count();
        int classtasks = classTaskService.count();
        int studentSize = studentService.getSize();
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE,-1);
        Date d = cal.getTime();
        SimpleDateFormat sp = new SimpleDateFormat("yyyy-MM-dd");
        String yesday = sp.format(d);
        int teacherReg = teacherService.getTeacherReg(yesday);
        int studentReg = studentService.getStudentReg(yesday);
        map.put("teachers", taacherSize);
        map.put("students", studentSize);
        map.put("classes", classeSize);
        map.put("classrooms", classrooms);
        map.put("teachbuilds", teachbuilds);
        map.put("courses", courseSize);
        map.put("classtasks", classtasks);
        map.put("teacherReg", teacherReg);
        map.put("studentReg", studentReg);
        return ServerResponse.ofSuccess(map);
    }

}
