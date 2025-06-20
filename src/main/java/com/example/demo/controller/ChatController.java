package com.example.demo.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ChatService;
import com.example.demo.vo.ChatMessage;
import com.example.demo.vo.ChatRoom;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ChatController {

    private final ChatService chatService;
    private final SimpMessagingTemplate messagingTemplate;


    public ChatController(ChatService chatService, SimpMessagingTemplate messagingTemplate) {
        this.chatService = chatService;
        this.messagingTemplate = messagingTemplate;
    }

    @GetMapping("/usr/project/chat/start")
    public String startChat(HttpServletRequest req, @RequestParam("otherId") int otherId) {
    	Rq rq = (Rq) req.getAttribute("rq");
        int loginUserId = rq.getLoginedMemberId();

        // 1:1 채팅방 생성 또는 조회
        ChatRoom room = chatService.createOrGetOneToOneRoom(loginUserId, otherId);

        // 채팅방 아이디로 채팅 페이지로 리다이렉트
        return "redirect:/usr/project/chat/room?roomId=" + room.getId();
    }

    @GetMapping("/usr/project/chat/room")
    public String chatRoomPage(@RequestParam(value = "roomId", required = false) Integer roomId, Model model, HttpServletRequest req) {
        Rq rq = (Rq) req.getAttribute("rq");
        int loginUserId = rq.getLoginedMemberId();

        List<ChatRoom> chatRooms = chatService.getChatRoomsByUserId(loginUserId);

        for (ChatRoom room : chatRooms) {
            String otherNickname = chatService.getOtherMemberNickname(room.getId(), loginUserId);
            String profileImg = chatService.getProfileImg(room.getId(), loginUserId);
            int unreadCount = chatService.countUnreadMessages(room.getId(), loginUserId);
            room.setOtherMemberNickname(otherNickname);
            room.setOtherProfileImg(profileImg);
            room.setUnreadCount(unreadCount);  // ChatRoom에 필드 추가 필요
        }

        model.addAttribute("chatRooms", chatRooms);

        if (chatRooms.isEmpty()) {
            model.addAttribute("chatRooms", chatRooms); 
            model.addAttribute("messages", List.of());
            model.addAttribute("selectedRoomId", null);
            model.addAttribute("LoginedMemberId", loginUserId);
            return "/usr/project/chat";
        }

        if (roomId == null) {
            roomId = chatRooms.get(0).getId();
            return "redirect:/usr/project/chat/room?roomId=" + roomId;
        }

        // --- 여기서 읽음 처리 추가 ---
        chatService.markMessagesAsRead(roomId, loginUserId);

        List<ChatMessage> messages = chatService.getMessagesByRoomId(roomId);

        model.addAttribute("chatRooms", chatRooms);
        model.addAttribute("messages", messages);
        model.addAttribute("selectedRoomId", roomId);
        model.addAttribute("LoginedMemberId", loginUserId);

        return "/usr/project/chat";
    }
    
    @PostMapping("/usr/project/chat/send")
    @ResponseBody
    public ResponseEntity<ChatMessage> sendMessageAjax(@RequestParam int roomId, 
                                                       @RequestParam int senderId,
                                                       @RequestParam String message) {
        ChatMessage savedMessage = chatService.sendMessage(roomId, senderId, message);

        // 메시지 저장 후 구독자에게 실시간 전송
        messagingTemplate.convertAndSend("/topic/chat/" + roomId, savedMessage);

        return ResponseEntity.ok(savedMessage);
    }
    @PostMapping("/send")
    public ResponseEntity<?> sendMessage(@RequestParam int roomId, 
                                         @RequestParam int senderId,
                                         @RequestParam String message) {
        chatService.sendMessage(roomId, senderId, message);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/messages")
    public List<ChatMessage> getMessages(@RequestParam int roomId) {
        return chatService.getMessagesByRoomId(roomId);
    }
    @PostMapping("/usr/project/chat/markAsRead")
    @ResponseBody
    public ResponseEntity<?> markMessagesAsRead(@RequestParam int roomId, @RequestParam int memberId) {
        // 메시지 읽음 처리 로직
        chatService.markMessagesAsRead(roomId, memberId);
        return ResponseEntity.ok().build();
    }
    
}