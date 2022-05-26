package com.chq.coursearrange.entity.response;

import com.chq.coursearrange.entity.ClassInfo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author CHQ
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ClassInfoVO extends ClassInfo {

    // 班主任姓名
    private String realname;

    private String gradeName;
}
