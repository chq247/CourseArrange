package com.chq.coursearrange.common;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @author CHQ
 */
@Component
public class TimerTask {

    /**
     * 每3小时执行一次
     */
    @Scheduled(cron = "0 0 0-3 * * ? ")
    public void task() {

    }
}
