package com.chq.coursearrange.service.impl;

import com.chq.coursearrange.dao.TeachBuildInfoDao;
import com.chq.coursearrange.entity.TeachbuildInfo;
import com.chq.coursearrange.service.TeachbuildInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author CHQ
 */
@Service
public class TeachbuildInfoServiceImpl extends ServiceImpl<TeachBuildInfoDao, TeachbuildInfo> implements TeachbuildInfoService {

    @Override
    public int getSize() {

        return 0;
    }
}
