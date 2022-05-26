package com.chq.coursearrange.service;

import com.chq.coursearrange.common.ServerResponse;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author CHQ
 */
public interface OSSService {

    // 上传头像
    ServerResponse uploadAvatar(MultipartFile file, Integer id, Integer type);

    // 上传视频
    ServerResponse uploadVideo(MultipartFile file, Integer id, Integer type);
}
