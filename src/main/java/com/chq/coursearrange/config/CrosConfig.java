package com.chq.coursearrange.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author CHQ
 */
@Configuration
public class CrosConfig {
    @Bean
    public WebMvcConfigurer crosConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            // 重写父类提供的跨域请求处理的接口，解决跨域问题
            public void addCorsMappings(CorsRegistry registry) {
                // 添加映射路径
                registry.addMapping("/**")
                        // 放行哪些原始域
                        .allowedOrigins("*")
                        // 是否发送Cookie信息
                        .allowCredentials(true)
                        // 放行哪些原始域(请求方式)
                        .allowedMethods("GET", "POST", "PUT", "DELETE")
                        // 放行哪些原始域(头部信息)
                        .allowedHeaders("*")
                        // 暴露哪些头部信息（因为跨域访问默认不能获取全部头部信息）
                        .exposedHeaders("Header1", "Header2");
            }
        };
    }
}
