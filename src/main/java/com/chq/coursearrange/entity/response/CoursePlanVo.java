package com.chq.coursearrange.entity.response;

import com.chq.coursearrange.entity.CourseInfo;
import com.chq.coursearrange.entity.CoursePlan;
import com.chq.coursearrange.entity.Teacher;
import lombok.Data;

/**
 * @author CHQ
 */
@Data
public class CoursePlanVo extends CoursePlan {

    private Teacher teacher;

    private CourseInfo courseInfo;
}
