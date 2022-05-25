package com.chq.coursearrange.dao;

import com.chq.coursearrange.entity.Student;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author lequal
 * @since 2020-03-13
 */
public interface StudentDao extends BaseMapper<Student> {

    @Select("SELECT * FROM tb_student WHERE student_no=#{account} AND password=#{password}" +
            "        UNION" +
            "        SELECT * FROM tb_student WHERE username=#{account} AND password=#{password}" +
            "        UNION" +
            "        SELECT * FROM tb_student WHERE realname=#{account} AND password=#{password}")
    Student studentLogin(@Param("account") String username, @Param("password") String password);

    @Select("select count(*) from tb_student where date(create_time) = #{yesday}")
    int studentReg(@Param("yesday") String yesday);

}
