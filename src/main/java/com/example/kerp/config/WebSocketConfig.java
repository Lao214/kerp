package com.example.kerp.config;
/*
 *@title WebSocketConfig
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/31 16:32
 */

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

@Configuration
public class WebSocketConfig {
    @Bean
    public ServerEndpointExporter serverEndpointExporter() {
        return new ServerEndpointExporter();
    }
}
