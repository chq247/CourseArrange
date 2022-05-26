package com.chq.coursearrange.entity.request;

import lombok.Data;

/**
 * @author CHQ
 */
@Data
public class PasswordVO {

    private Integer id;

    private String oldPass;

    private String newPass;

    private String rePass;
}
