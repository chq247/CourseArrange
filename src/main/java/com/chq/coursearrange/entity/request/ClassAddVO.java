package com.chq.coursearrange.entity.request;

import lombok.Data;

/**
 * @author CHQ
 */
@Data
public class ClassAddVO {

    // 讲师id
    private Integer id;

    private String gradeNo;

    private String classNo;

    private String className;

    private Integer num;

    private String realname;
}
