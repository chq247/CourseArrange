package com.chq.coursearrange.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chq.coursearrange.entity.ClassInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.chq.coursearrange.entity.response.ClassInfoVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author lequal
 * @since 2020-03-06
 */
@Mapper
public interface ClassInfoDao extends BaseMapper<ClassInfo> {

    // 获得班级的人数
    @Select("select num from tb_class_info where class_no = #{classNo}")
    int selectStuNum(@Param("classNo") String classNo);

    @Select("SELECT tci.id,tgi.grade_name,tci.class_no,tci.class_name,t.realname,tci.num FROM tb_class_info tci join tb_teacher t on tci.teacher = t.id join tb_grade_info tgi on tci.remark = tgi.grade_no where tgi.grade_no = ${gradeNo} limit ${page}, ${limit}")
    List<ClassInfoVO> queryClassInfo(Integer page, Integer limit, String gradeNo);

    @Select("SELECT tci.id,tgi.grade_name,tci.class_no,tci.class_name,t.realname,tci.num FROM tb_class_info tci join tb_teacher t on tci.teacher = t.id join tb_grade_info tgi on tci.remark = tgi.grade_no limit ${page}, ${limit}")
    List<ClassInfoVO> queryClassInfos(Integer page, Integer limit);

    @Select("SELECT count(tci.id) FROM tb_class_info tci join tb_teacher t on tci.teacher = t.id join tb_grade_info tgi on tci.remark = tgi.grade_no where tgi.grade_no = ${gradeNo}")
    int count1(String gradeNo);

    @Select("SELECT count(tci.id) FROM tb_class_info tci join tb_teacher t on tci.teacher = t.id join tb_grade_info tgi on tci.remark = tgi.grade_no")
    int count2();

    @Select("select tci.*, tgi.grade_name, tt.realname from tb_class_info tci left JOIN tb_grade_info tgi on tci.remark = tgi.grade_no LEFT JOIN tb_teacher tt on tt.id = tci.teacher where tci.remark = #{gradeNo}")
    IPage<ClassInfoVO> selectClassAndTeacher(Page<ClassInfoVO> pg, @Param("gradeNo") String gradeNo);

    @Select("select tci.*, tgi.grade_name, tt.realname from tb_class_info tci left JOIN tb_grade_info tgi on tci.remark = tgi.grade_no LEFT JOIN tb_teacher tt on tt.id = tci.teacher")
    IPage<ClassInfoVO> selectClassAndTeacherAll(Page<ClassInfoVO> pg);

    @Select("select count(*) from tb_class_info")
    int getSize();

    @Select("select * from tb_class_info where class_no = #{classNo}")
    ClassInfo selectByClassNo(@Param("classNo") String classNo);
}
