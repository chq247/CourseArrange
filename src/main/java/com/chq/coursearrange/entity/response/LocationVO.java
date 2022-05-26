package com.chq.coursearrange.entity.response;

import com.chq.coursearrange.entity.LocationInfo;
import lombok.Data;

/**
 * @author CHQ
 */
@Data
public class LocationVO extends LocationInfo {

    private String teachBuildName;

    private String gradeName;
}
