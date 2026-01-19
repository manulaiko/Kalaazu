package com.kalaazu.cms;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication(scanBasePackages = {})
@ComponentScan(
        basePackages = {
                "com.kalaazu.cms.config",
                "com.kalaazu.cms.controller",
                "com.kalaazu.cms.service",
                "com.kalaazu.persistence.service",
                "com.kalaazu.service"
        },
        excludeFilters = @ComponentScan.Filter(type = FilterType.ASSIGNABLE_TYPE, classes = CMS.class)
)
@EntityScan(basePackages = "com.kalaazu.persistence.entity")
@EnableJpaRepositories(basePackages = "com.kalaazu.persistence.repository")
public class CmsServer {
}