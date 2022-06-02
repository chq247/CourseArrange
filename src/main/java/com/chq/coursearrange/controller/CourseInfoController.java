package com.chq.coursearrange.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chq.coursearrange.common.ServerResponse;
import com.chq.coursearrange.entity.CourseInfo;
import com.chq.coursearrange.service.CourseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

/**
 * @author CHQ
 */
@RestController
@RequestMapping("/courseinfo")
public class CourseInfoController {

    @Autowired
    private CourseInfoService cis;

    /**
     * 查询所有课程，带分页
     * @return
     */
    @GetMapping("/selectCourse/{page}")
    public ServerResponse selectCourse(@PathVariable("page")Integer page,
                                       @RequestParam(defaultValue = "10")Integer limit){
        Page<CourseInfo> pages = new Page<>(page, limit);
        QueryWrapper<CourseInfo> wrapper = new QueryWrapper<CourseInfo>();
        IPage<CourseInfo> ipage = cis.page(pages, wrapper);
        return ServerResponse.ofSuccess(ipage);
    }

    @GetMapping("/getCourse")
    public ServerResponse getCourse(){
        List<CourseInfo> courseInfoList = cis.selectCourse();
        return ServerResponse.ofSuccess(courseInfoList);
    }

    /**
     * 根据课程名查询课程编号
     * @return
     */
    @PostMapping("/selectByCourseName")
    public ServerResponse selectByCourseName(@RequestBody String courseName) throws UnsupportedEncodingException {
        String decode = URLDecoder.decode(courseName,"UTF-8");
        String substring = decode.substring(0, decode.length() - 1);
        CourseInfo courseInfo = cis.selectByName(substring);
        if (courseInfo!=null){
            return ServerResponse.ofSuccess(courseInfo);
        }
        return ServerResponse.ofError("查询失败");
    }

    /**
     * 获取添加课程的课程编号
     * @return
     */
    @GetMapping("/get-no")
    public ServerResponse getNo() {
        QueryWrapper<CourseInfo> wrapper = new QueryWrapper<CourseInfo>().select("course_no").orderByDesc("course_no");
        List<CourseInfo> list = cis.list(wrapper);
        String no = String.valueOf(Integer.parseInt(list.get(0).getCourseNo()) + 1);
        return ServerResponse.ofSuccess(no);
    }
}

