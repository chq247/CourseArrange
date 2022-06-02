package com.chq.coursearrange.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chq.coursearrange.common.ServerResponse;
import com.chq.coursearrange.entity.ClassTask;
import com.chq.coursearrange.service.ClassTaskService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.*;

/**
 * @author CHQ
 */
@RestController
public class ClassTaskController {

    @Autowired
    private ClassTaskService classTaskService;

    /**
     * 查询开课任务
     */
    @GetMapping("/classtask/{page}/{semester}")
    public ServerResponse queryClassTask(@PathVariable("page") Integer page,
                                         @PathVariable("semester") String semester,
                                         @RequestParam(defaultValue = "10") Integer limit) {
        Page<ClassTask> pages = new Page<>(page, limit);
        IPage<ClassTask> ipage;
        if (semester != null && !semester.equals("0")){
            QueryWrapper<ClassTask> wrapper = new QueryWrapper<ClassTask>().eq("semester", semester);
            ipage = classTaskService.page(pages, wrapper);
        }else {
            ipage = classTaskService.page(pages);
        }
        if (ipage != null) {
            return ServerResponse.ofSuccess(ipage);
        }
        return ServerResponse.ofError("查询开课任务失败！");
    }

    /**
     * 手动添加课程任务
     * @param classTask
     * @return
     */
    @PostMapping("/addclasstask")
    public ServerResponse addClassTask(@RequestBody ClassTask classTask) {
        classTask.setDeleted(false);
        boolean b = classTaskService.save(classTask);
        if (b) {
            return ServerResponse.ofSuccess("添加课程任务成功");
        }
        return ServerResponse.ofError("添加课程任务失败");
    }

    /**
     * 修改课程任务
     * @param classTask
     * @return
     */
    @PostMapping("/updateClasstask")
    public ServerResponse updateClassTask(@RequestBody ClassTask classTask) {
        boolean b = classTaskService.updateById(classTask);
        if (b) {
            return ServerResponse.ofSuccess("修改课程任务成功");
        }
        return ServerResponse.ofError("修改课程任务失败");
    }

    /**
     * 删除开课任务
     * @param id
     * @return
     */
    @DeleteMapping("/deleteclasstask/{id}")
    public ServerResponse deleteClassTask(@PathVariable("id") Integer id) {

        boolean b = classTaskService.removeById(id);
        if (b) {
            return ServerResponse.ofSuccess("删除成功");
        }
        return ServerResponse.ofError("删除失败");
    }

    /**
     * 获得学期集合
     * @return
     */
    @GetMapping("/semester")
    public ServerResponse queryAllSemester() {
        QueryWrapper wrapper = new QueryWrapper<>();
        wrapper.select("semester");
        wrapper.groupBy("semester");
        List<ClassTask> list = classTaskService.list(wrapper);
        Set set = new HashSet();

        for (ClassTask c : list) {
            set.add(c.getSemester());
        }

        return ServerResponse.ofSuccess(set);
    }

    /**
     * 排课算法接口，传入学期开始去查对应学期的开课任务，进行排课，排完课程后添加到course_plan表
     * @param semester
     * @return
     */
    @PostMapping("/arrange/{semester}")
    public ServerResponse arrange(@PathVariable("semester") String semester) {
        return classTaskService.classScheduling(semester);
    }
}

