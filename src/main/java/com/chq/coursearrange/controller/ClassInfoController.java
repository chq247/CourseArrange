package com.chq.coursearrange.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chq.coursearrange.common.ServerResponse;
import com.chq.coursearrange.entity.ClassInfo;
import com.chq.coursearrange.entity.Student;
import com.chq.coursearrange.entity.response.ClassInfoVO;
import com.chq.coursearrange.service.ClassInfoService;
import com.chq.coursearrange.service.StudentService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

/**
 * @author CHQ
 */
@RestController
public class ClassInfoController {

    @Autowired
    private ClassInfoService classInfoService;
    @Autowired
    private StudentService studentService;


    /**
     * 根据年级查询所有班级
     * @param grade
     * @return
     */
    @GetMapping("/class-grade/{grade}")
    public ServerResponse queryClass(@PathVariable("grade") String grade) {
        System.out.println("33333");
        System.out.println(grade);
        QueryWrapper<ClassInfo> wrapper = new QueryWrapper<ClassInfo>().eq("remark", grade);
        List<ClassInfo> classInfoList = classInfoService.list(wrapper);

        return ServerResponse.ofSuccess(classInfoList);
    }

    /**
     * 根据教师名称查询教师编号
     * @return
     */
    @PostMapping("/classInfo/selectByClassName")
    public ServerResponse selectClassNo(@RequestBody String className) throws UnsupportedEncodingException {
        String decode = URLDecoder.decode(className,"UTF-8");
        String substring = decode.substring(0, decode.length() - 1);
        ClassInfo classInfo = classInfoService.selectByClassNo(substring);
        if (classInfo!=null){
            return ServerResponse.ofSuccess(classInfo);
        }
        return ServerResponse.ofError("查询失败");
    }

    /**
     * 根据班级查询学生
     * @param page
     * @param classNo
     * @param limit
     * @return
     */
    @GetMapping("/student-class/{page}/{classNo}")
    public ServerResponse queryStudentByClass(@PathVariable("page") Integer page,
                                              @PathVariable("classNo") String classNo,
                                              @RequestParam(defaultValue = "10") Integer limit) {
        QueryWrapper<Student> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("student_no");
        wrapper.like(!StringUtils.isEmpty(classNo), "class_no", classNo);
        Page<Student> pages = new Page<>(page, limit);
        IPage<Student> iPage = studentService.page(pages, wrapper);
        return ServerResponse.ofSuccess(iPage);
    }


    @GetMapping("/queryclassinfo/{page}")
    public ServerResponse queryClassInfos(@PathVariable("page") Integer page,
                                          @RequestParam(defaultValue = "10") Integer limit,
                                          @RequestParam(defaultValue = "") String gradeNo) {
        Integer pageNo = page;
        Integer size = limit;
        Page<ClassInfoVO> pg = new Page<>(pageNo, size);
        IPage<ClassInfoVO> list = null;
        if (gradeNo.isEmpty()){
            list = classInfoService.selectClassAndTeacherAll(pg);
            return ServerResponse.ofSuccess(list);
        }
        list = classInfoService.selectClassAndTeacher(pg, gradeNo);
        return ServerResponse.ofSuccess(list);
    }


    @PostMapping("/addclassinfo")
    public ServerResponse addClass(@RequestBody ClassInfo classInfo) {
        System.out.println(classInfo);
        if (classInfo != null){
            boolean isSave = classInfoService.save(classInfo);
            if (isSave){
                return ServerResponse.ofSuccess("添加班级成功");
            }
            return ServerResponse.ofError("添加班级失败");
        }
        return ServerResponse.ofError("添加班级失败");
    }

    @PostMapping("/updateClassinfo")
    public ServerResponse updateClass(@RequestBody ClassInfo classInfo) {
        if (classInfo != null){
            boolean isSave = classInfoService.updateById(classInfo);
            if (isSave){
                return ServerResponse.ofSuccess("编辑班级成功");
            }
            return ServerResponse.ofError("编辑班级失败");
        }
        return ServerResponse.ofError("编辑班级失败");
    }

    @DeleteMapping("/classInfo/delete/{id}")
    public ServerResponse delete(@PathVariable("id") Integer id) {
        if (id != null){
            boolean isSave = classInfoService.removeById(id);
            if (isSave){
                return ServerResponse.ofSuccess("添加班级成功");
            }
            return ServerResponse.ofError("添加班级失败");
        }
        return ServerResponse.ofError("添加班级失败");
    }

}

