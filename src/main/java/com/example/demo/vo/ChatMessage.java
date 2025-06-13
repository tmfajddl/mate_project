package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChatMessage {
    private int id;
    private int roomId;    // chat_room.id
    private int senderId;  // member.id
    private String message;
    private LocalDateTime sentDate;
    private String senderName;
    private String senderProfileImg;
}
