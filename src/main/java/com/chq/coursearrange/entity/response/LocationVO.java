package com.chq.coursearrange.entity.response;

import com.chq.coursearrange.entity.LocationInfo;
import lombok.Data;

/**
 * @author: 15760
 * @Date: 2020/5/20
 * @Descripe:
 */
@Data
public class LocationVO extends LocationInfo {

    private String teachBuildName;

    private String gradeName;
}
