package com.example.kerp.modules.system.ws;

/*
 *@title ScanSocket
 *@description
 *@author echoes
 *@version 1.0
 *@create 2025/12/31 16:33
 */

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import jakarta.websocket.*;
import jakarta.websocket.server.PathParam;
import jakarta.websocket.server.ServerEndpoint;
import java.util.concurrent.ConcurrentHashMap;

/**
 * WebSocket 服务端
 * URL格式: ws://localhost:8080/ws/scan/{uuid}
 * uuid 是本次会话的唯一标识，由电脑生成
 */
@Slf4j
@Component
@ServerEndpoint("/ws/scan/{uuid}")
public class ScanSocket {

    // 存连接：Key是UUID，Value是电脑端的Session
    private static ConcurrentHashMap<String, Session> pcSessions = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(Session session, @PathParam("uuid") String uuid) {
        // 电脑连上来了，登记在册
        pcSessions.put(uuid, session);
        log.info("💻 PC端连接成功，会话ID: {}", uuid);
    }

    @OnClose
    public void onClose(@PathParam("uuid") String uuid) {
        pcSessions.remove(uuid);
        log.info("💻 PC端断开连接: {}", uuid);
    }

    @OnMessage
    public void onMessage(String message, @PathParam("uuid") String uuid) {
        // 这里的 message 是手机发过来的 SN 码
        log.info("📱 收到手机扫码数据: [{}] -> 转发给PC [{}]", message, uuid);

        Session pcSession = pcSessions.get(uuid);
        if (pcSession != null && pcSession.isOpen()) {
            try {
                // 直接转发给电脑
                pcSession.getBasicRemote().sendText(message);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @OnError
    public void onError(Session session, Throwable error) {
        error.printStackTrace();
    }
}
