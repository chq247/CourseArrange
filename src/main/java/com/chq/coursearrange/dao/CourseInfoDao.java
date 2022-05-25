package com.chq.coursearrange.dao;

import com.chq.coursearrange.entity.CourseInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author lequal
 * @since 2020-04-03
 */
@Mapper
public interface CourseInfoDao extends BaseMapper<CourseInfo> {

    @Select("select count(*) from tb_course_info")
    int getSize();
}
