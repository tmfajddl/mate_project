package com.example.demo.service;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ChatRepository;
import com.example.demo.vo.ChatMessage;
import com.example.demo.vo.ChatRoom;
import com.example.demo.vo.Member;

@Service
public class ChatService {

    private final ChatRepository chatRepository;

    public ChatService(ChatRepository chatRepository) {
        this.chatRepository = chatRepository;
    }

    public ChatRoom createOrGetOneToOneRoom(int userId1, int userId2) {
        if (userId1 > userId2) {
            int tmp = userId1;
            userId1 = userId2;
            userId2 = tmp;
        }

        String roomName = userId1 + "_" + userId2;

        ChatRoom room = chatRepository.findByRoomName(roomName);
        if (room != null) {
            return room;
        }

        room = ChatRoom.builder()
                .roomName(roomName)
                .createdBy(userId1)
                .build();

        chatRepository.insertChatRoom(room);
        return room;
    }
    
    public ChatMessage sendMessage(int roomId, int senderId, String message) {
        ChatMessage chatMessage = new ChatMessage();
        chatMessage.setRoomId(roomId);
        chatMessage.setSenderId(senderId);
        chatMessage.setMessage(message);
        chatMessage.setSentDate(LocalDateTime.now());

        chatRepository.insertMessage(chatMessage);

        return chatMessage; // 저장한 메시지 객체 반환
    }

    public List<ChatMessage> getMessagesForRoom(int roomId) {
        return chatRepository.findMessagesByRoomId(roomId);
    }
    
    public List<ChatRoom> getChatRoomsByUserId(int userId) {
        return chatRepository.findChatRoomsByUserId(userId);
    }

    // 특정 채팅방의 메시지 목록 반환
    public List<ChatMessage> getMessagesByRoomId(int roomId) {
        return chatRepository.findMessagesByRoomId(roomId);
    }
    public String getOtherMemberNickname(int roomId, int loginUserId) {
        List<Member> participants = chatRepository.getParticipants(roomId);
        for (Member m : participants) {
            if (m.getId() != loginUserId) {
                return m.getNickname();
            }
        }
        return "알 수 없음";
    }
    
    public String getProfileImg(int roomId, int loginUserId) {
        List<Member> profileImgs = chatRepository.getProfileImg(roomId);
        for (Member m : profileImgs) {
            if (m.getId() != loginUserId) {
                return m.getProfileImg();
            }
        }
        return null;
    }
    public int countUnreadMessages(@Param("roomId") int roomId, @Param("memberId") int memberId) {
        return chatRepository.countUnreadMessages(roomId,memberId);
    }

	public void markMessagesAsRead(Integer roomId, int loginUserId) {
		chatRepository.markMessagesAsRead(roomId,loginUserId);
		
	}
    
    
}
