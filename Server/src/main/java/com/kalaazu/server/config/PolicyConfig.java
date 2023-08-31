package com.kalaazu.server.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.integration.annotation.ServiceActivator;
import org.springframework.integration.channel.DirectChannel;
import org.springframework.integration.ip.tcp.TcpInboundGateway;
import org.springframework.integration.ip.tcp.connection.AbstractServerConnectionFactory;
import org.springframework.integration.ip.tcp.connection.TcpNioServerConnectionFactory;
import org.springframework.messaging.MessageChannel;

/**
 * Policy config.
 * ==============
 *
 * Configuration beams for the policy socket server.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Configuration
public class PolicyConfig {
    public static final String policyResponse = "<?xml version=\"1.0\"?><cross-domain-policy xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:noNamespaceSchemaLocation=\"http://www.adobe.com/xml/schemas/PolicyFileSocket.xsd\"><allow-access-from domain=\"*\" to-ports=\"*\" secure=\"false\" /><site-control permitted-cross-domain-policies=\"master-only\" /></cross-domain-policy>";

    @Value("${app.port.policy}")
    private int serverPort;

    @Bean
    public AbstractServerConnectionFactory policyServerConnectionFactory() {
        var serverConnectionFactory = new TcpNioServerConnectionFactory(serverPort);
        serverConnectionFactory.setUsingDirectBuffers(true);

        return serverConnectionFactory;
    }

    @Bean
    public MessageChannel policyServerChannel() {
        return new DirectChannel();
    }

    @Bean
    public TcpInboundGateway policyServerGateway(AbstractServerConnectionFactory policyServerConnectionFactory,
                                            MessageChannel policyServerChannel) {
        var tcpInboundGateway = new TcpInboundGateway();
        tcpInboundGateway.setConnectionFactory(policyServerConnectionFactory);
        tcpInboundGateway.setRequestChannel(policyServerChannel);

        return tcpInboundGateway;
    }

    @ServiceActivator(inputChannel = "policyServerChannel")
    public byte[] processPolicyRequest(byte[] message) {
        return policyResponse.getBytes();
    }
}
