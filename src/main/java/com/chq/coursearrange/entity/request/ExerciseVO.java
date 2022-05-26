package com.chq.coursearrange.entity.request;

import lombok.Data;

/**
 * @author CHQ
 */
@Data
public class ExerciseVO {

    private Integer categoryId;

    private String classNo;

    private String exerciseTitle;

    private Integer multiselect;

    private String answer;

    private String optionA;

    private String optionB;

    private String optionC;

    private String optionD;

    private String optionE;

    private String optionF;

    private Integer fraction;

}
