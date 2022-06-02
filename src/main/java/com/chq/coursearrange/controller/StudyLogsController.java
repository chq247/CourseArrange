package com.chq.coursearrange.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chq.coursearrange.common.ServerResponse;
import com.chq.coursearrange.entity.StudyLogs;
import com.chq.coursearrange.service.StudyLogsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author CHQ
 */
@RestController
@RequestMapping("/studylogs")
public class StudyLogsController {

    @Autowired
    private StudyLogsService sls;

    /**
     * 添加或更新学习进度
     * @param s
     * @return
     */
    @PostMapping("/add")
    public ServerResponse addLogs(@RequestBody StudyLogs s) {
        boolean b = sls.saveOrUpdate(s);
        if (b) {
            return ServerResponse.ofSuccess();
        }
        return ServerResponse.ofError();
    }

    /**
     * 根据学生id获取学习记录，上次看到哪个视频了
     */
    @GetMapping("/get/{id}")
    public ServerResponse getLog(@PathVariable("id") Integer id) {
        List<StudyLogs> list = sls.list(new QueryWrapper<StudyLogs>().eq("student_id", id));
        return ServerResponse.ofSuccess(list);
    }

}

