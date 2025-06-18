package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChatRoom {
    private int id;
    private LocalDateTime createdDate;
    private LocalDateTime updateDate;
    private String roomName;  // ex: "1_2"
    private int createdBy;    // member.id
    private String otherMemberNickname;
    private String otherProfileImg;
    private int unreadCount;
}
