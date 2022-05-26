package com.chq.coursearrange.service.impl;

import com.chq.coursearrange.common.ServerResponse;
import com.chq.coursearrange.service.OSSService;
import com.chq.coursearrange.util.AliyunUtil;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.util.Map;

/**
 * @author CHQ
 */
@Service
public class OSSServiceImpl implements OSSService {

    @Override
    public ServerResponse uploadAvatar(MultipartFile file, Integer id, Integer type) {
        String directory = "avatar/";
        // 调用上传
        Map map = AliyunUtil.upload(file, "");
        return ServerResponse.ofSuccess(map);
    }

    @Override
    public ServerResponse uploadVideo(MultipartFile file, Integer id, Integer type) {
        return null;
    }
}
