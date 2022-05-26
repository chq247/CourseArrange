package com.chq.coursearrange.entity.request;

import lombok.Data;

/**
 * @author CHQ
 */
@Data
public class UserInfoVO {

    // 课程的id
    private Integer courseId;

    private Integer UserType;

    // 操作者的id
    private Integer id;

    private String realname;

    // 设置视频的编号，比如3-1
    private String videoNo;

    private String videoName;

    private String videoUrl;

    /**
     * 视频封面
     */
    private String cover;

}
