package com.example.demo.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.http.ResponseEntity;
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

    public ChatController(ChatService chatService) {
        this.chatService = chatService;
    }

    @GetMapping("/usr/project/chat/start")
    public String startChat(HttpServletRequest req, @RequestParam("otherId") int otherId) {
        // 로그인한 회원 아이디 조회 (예: 세션에서 꺼내거나 principal에서)
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
            room.setOtherMemberNickname(otherNickname);
            room.setOtherProfileImg(profileImg);
        }

        model.addAttribute("chatRooms", chatRooms);

        if (chatRooms.isEmpty()) {
            // 참여중인 채팅방이 없으면 빈 화면 처리
            model.addAttribute("chatRooms", chatRooms); 
            model.addAttribute("messages", List.of());
            model.addAttribute("selectedRoomId", null);
            model.addAttribute("LoginedMemberId", loginUserId);
            return "/usr/project/chat";
        }

        if (roomId == null) {
            // roomId가 없으면 첫번째 채팅방으로 자동 리다이렉트
            roomId = chatRooms.get(0).getId();
            return "redirect:/usr/project/chat/room?roomId=" + roomId;
        }

        List<ChatMessage> messages = chatService.getMessagesByRoomId(roomId);

        model.addAttribute("chatRooms", chatRooms);
        model.addAttribute("messages", messages);
        model.addAttribute("selectedRoomId", roomId);
        model.addAttribute("LoginedMemberId", loginUserId);

        return "/usr/project/chat";
    }
    
    @PostMapping("/usr/project/chat/send")
    public String sendMessage(@RequestParam("roomId") int roomId,
                               @RequestParam("message") String message,
                               HttpServletRequest req) {
    	
    	Rq rq = (Rq) req.getAttribute("rq");
        int loginUserId = rq.getLoginedMemberId();
        chatService.sendMessage(roomId, loginUserId, message);
        return "redirect:/usr/project/chat/room?roomId=" + roomId;
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
}
