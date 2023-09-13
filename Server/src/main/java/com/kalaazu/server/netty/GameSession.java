package com.kalaazu.server.netty;

import com.kalaazu.persistence.entity.AccountsConfigurationsEntity;
import com.kalaazu.persistence.entity.AccountsEntity;
import com.kalaazu.persistence.entity.AccountsHangarsEntity;
import com.kalaazu.persistence.entity.AccountsShipsEntity;
import com.kalaazu.persistence.service.MapsService;
import com.kalaazu.server.entities.Player;
import com.kalaazu.server.service.MapService;
import io.netty.channel.ChannelId;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.beans.factory.support.DefaultListableBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.annotation.ScheduledAnnotationBeanPostProcessor;
import org.springframework.stereotype.Component;

/**
 * Game Session.
 * =============
 *
 * Represents an active player.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@RequiredArgsConstructor
@Data
@Component
@Scope("prototype")
public class GameSession implements DisposableBean {
    private final ApplicationContext ctx;

    private ChannelId channelId;

    private AccountsEntity account;
    private AccountsShipsEntity ship;
    private AccountsConfigurationsEntity configuration;
    private AccountsHangarsEntity hangar;
    private Byte mapId;
    private Player player;

    @Override
    public void destroy() {
        var postProcessor = ctx.getBean(ScheduledAnnotationBeanPostProcessor.class);
        postProcessor.postProcessBeforeDestruction(player, "");

        player = null;
    }
}
