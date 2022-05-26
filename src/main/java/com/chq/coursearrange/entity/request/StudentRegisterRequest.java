package com.chq.coursearrange.entity.request;

import lombok.Data;

/**
 * @author CHQ
 */
@Data
public class StudentRegisterRequest {

    // 学号由系统给学生生成，学生通过完善个人信息进行填写其它字段
    private String studentNo;

    private String username;

    private String password;

    private String realname;

    /**
     * 年级
     */
    private String grade;

    private String address;

    private String telephone;

    private String email;

}
