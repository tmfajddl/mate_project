package com.example.demo.controller;

import org.springframework.messaging.handler.annotation.*;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.example.demo.service.ChatService;
import com.example.demo.vo.ChatMessage;

@Controller
public class WebSocketChatController {

    private final SimpMessagingTemplate messagingTemplate;
    private final ChatService chatService;

    public WebSocketChatController(SimpMessagingTemplate messagingTemplate, ChatService chatService) {
        this.messagingTemplate = messagingTemplate;
        this.chatService = chatService;
    }

    @MessageMapping("/chat.sendMessage") 
    public void sendMessage(ChatMessage chatMessage) {
        // 메시지 저장
        ChatMessage saved = chatService.sendMessage(
            chatMessage.getRoomId(),
            chatMessage.getSenderId(),
            chatMessage.getMessage());

        // 해당 방 구독자에게 메시지 전송
        messagingTemplate.convertAndSend(
            "/topic/chat/" + chatMessage.getRoomId(),
            saved
        );
    }
}
