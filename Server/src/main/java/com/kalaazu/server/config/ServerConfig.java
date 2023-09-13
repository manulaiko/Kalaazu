package com.kalaazu.server.config;

import io.netty.channel.nio.NioEventLoopGroup;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;

import java.util.concurrent.ThreadPoolExecutor;

/**
 * Server config.
 * ==============
 * <p>
 * Configuration beams for the game socket server.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Configuration
public class ServerConfig {
    @Bean
    public ThreadPoolTaskScheduler taskScheduler() {
        var scheduler = new ThreadPoolTaskScheduler() {
            private static final long serialVersionUID = -1L;

            @Override
            public void destroy() {
                this.getScheduledThreadPoolExecutor().setExecuteExistingDelayedTasksAfterShutdownPolicy(false);
                super.destroy();
            }
        };

        scheduler.setPoolSize(5);
        scheduler.setThreadNamePrefix("task");
        scheduler.setWaitForTasksToCompleteOnShutdown(true);
        scheduler.setAwaitTerminationSeconds(1);
        scheduler.setRejectedExecutionHandler(new ThreadPoolExecutor.AbortPolicy());

        return scheduler;
    }

    @Bean
    public NioEventLoopGroup bossGroup() {
        return new NioEventLoopGroup();
    }

    @Bean
    public NioEventLoopGroup workerGroup() {
        return new NioEventLoopGroup();
    }
}
