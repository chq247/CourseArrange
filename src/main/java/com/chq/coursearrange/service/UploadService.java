package com.chq.coursearrange.service;

import com.chq.coursearrange.common.ServerResponse;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author CHQ
 */
public interface UploadService {

    ServerResponse upload(MultipartFile file);

}
