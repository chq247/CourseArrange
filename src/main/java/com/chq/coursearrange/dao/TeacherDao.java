package com.chq.coursearrange.dao;

import com.chq.coursearrange.entity.Teacher;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * @author CHQ
 */
@Mapper
public interface TeacherDao extends BaseMapper<Teacher> {

    @Select("SELECT * FROM tb_teacher WHERE teacher_no=#{account} AND password=#{password}" +
            "        UNION" +
            "        SELECT * FROM tb_teacher WHERE username=#{account} AND password=#{password}" +
            "        UNION" +
            "        SELECT * FROM tb_teacher WHERE realname=#{account} AND password=#{password}")
    Teacher teacherLogin(@Param("account") String account, @Param("password") String password);

    @Select("select count(*) from tb_teacher where date(create_time) = #{yesday}")
    int teacherReg(@Param("yesday") String yesday);

    @Select("select count(*) from tb_teacher")
    int getSize();
}
