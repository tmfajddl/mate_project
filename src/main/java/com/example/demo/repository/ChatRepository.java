package com.example.demo.repository;

import com.example.demo.vo.ChatMessage;
import com.example.demo.vo.ChatRoom;
import com.example.demo.vo.Member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ChatRepository {
	
	public ChatRoom findByRoomName(@Param("roomName") String roomName);
    
	public int insertChatRoom(ChatRoom chatRoom);
    
	public void insertMessage(ChatMessage message);
	
	List<ChatRoom> findChatRoomsByUserId(int userId);

    List<ChatMessage> findMessagesByRoomId(int roomId);

	public List<Member> getParticipants(int roomId);

	public List<Member> getProfileImg(int roomId);

	public int countUnreadMessages(int roomId, int memberId);

	public void markMessagesAsRead(Integer roomId, int memberId);
}