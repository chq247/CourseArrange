package com.chq.coursearrange.entity.request;

import lombok.Data;

/**
 * @author CHQ
 */
@Data
public class UserLoginRequest {

    private String username;

    private String password;

    /**
     * 1管理员，2讲师
     */
    private Integer type;

}
