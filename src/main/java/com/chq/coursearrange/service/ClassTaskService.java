package com.chq.coursearrange.service;

import com.chq.coursearrange.common.ServerResponse;
import com.chq.coursearrange.entity.ClassTask;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;

/**
 * @author CHQ
 */
public interface ClassTaskService extends IService<ClassTask> {

//    Boolean classScheduling(ClassTask classTask);
    ServerResponse classScheduling(@Param("semester") String semester);

}
