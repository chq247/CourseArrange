package com.chq.coursearrange.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chq.coursearrange.dao.StudentDao;
import com.chq.coursearrange.entity.Student;
import com.chq.coursearrange.service.StudentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author CHQ
 */
@Service
public class StudentServiceImpl extends ServiceImpl<StudentDao, Student> implements StudentService {

    @Autowired
    private StudentDao studentDao;

    @Override
    public Student studentLogin(String username, String password) {
        QueryWrapper<Student> wrapper = new QueryWrapper<>();
        wrapper.eq("student_no", username).eq("password", password);
        // 查询数据库是否有该学生
        return studentDao.selectOne(wrapper);
    }

    @Override
    public int getSize() {
        int studentSize = studentDao.getSize();
        return studentSize;
    }

    @Override
    public int getStudentReg(String yesday) {
        int studentReg = studentDao.studentReg(yesday);
        return studentReg;
    }

}
