package com.example.demo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.GoodsRecommendationResponse;
import com.example.demo.dto.PlaceRecommendationResponse;
import com.example.demo.service.ChatService;
import com.example.demo.service.KboCrawlerService;
import com.example.demo.service.NaverSearchService;
import com.example.demo.service.OpenAiService;
import com.example.demo.vo.ChatMessage;
import com.example.demo.vo.ChatRoom;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrHomeController {
	
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private Rq rq;
	
	@Autowired
	private KboCrawlerService kboCrawlerService;
	
	@Autowired
	private OpenAiService openAiService;
	
	@RequestMapping("/usr/home/main")
	public String showMain(Model model) throws IOException {
		List<HashMap<String, String>> breakingNews = kboCrawlerService.getBreakingNews();
		 model.addAttribute("breakingNews", breakingNews);
		 
		 List<Map<String, String>> registeredPlayers = kboCrawlerService.getRegisteredPlayers();
		 model.addAttribute("registeredPlayers", registeredPlayers);
		 
		 List<Map<String, String>> canceledPlayers = kboCrawlerService.getCanceledPlayers();
		 model.addAttribute("canceledPlayers", canceledPlayers);
		 
		 List<HashMap<String, String>> naverBaseballSchedule = kboCrawlerService.getBaseballSchedule();
		 model.addAttribute("naverBaseballSchedule", naverBaseballSchedule);
		return "/usr/home/main";
	}
	
	@RequestMapping("/usr/home/test")
	  public String showSchedule(@RequestParam(value = "roomId", required = false) Integer roomId, Model model, HttpServletRequest req) {
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
		return "/usr/home/test";
	}

	@RequestMapping("/")
	public String showMain2() {
		return "redirect:/usr/home/main";
	}

	
	@RequestMapping("/usr/project/information")
	public String showMain4(Model model) throws IOException {
		 List<HashMap<String, String>> naverBaseballSchedules = kboCrawlerService.getBaseballSchedule();
		 model.addAttribute("scheduleList", naverBaseballSchedules);
		return "/usr/project/information";
	}
	@RequestMapping("/usr/project/information2")
	public String showMain5(Model model,
	                        @RequestParam(value = "page", defaultValue = "1") int page,
	                        @RequestParam(value = "team", defaultValue = "전체") String team) throws IOException {

	    // 팀 순위 정보
	    List<List<String>> rankings = kboCrawlerService.getTeamRankings();
	    model.addAttribute("rankings", rankings);

	    // 전체 뉴스 데이터
	    List<HashMap<String, String>> allNews = kboCrawlerService.getBreakingNews();

	    // 팀 필터링
	    if (!team.equals("전체")) {
	        allNews = allNews.stream()
	                .filter(news -> news.get("title").contains(team))
	                .collect(Collectors.toList());
	    }

	    // 페이징 처리
	    int itemsPerPage = 10;
	    int totalItems = allNews.size();
	    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

	    int start = (page - 1) * itemsPerPage;
	    int end = Math.min(start + itemsPerPage, totalItems);
	    List<HashMap<String, String>> pagedNews = allNews.subList(start, end);

	    // 페이지 블럭 계산
	    int pageBlockSize = 10;
	    int startPage = ((page - 1) / pageBlockSize) * pageBlockSize + 1;
	    int endPage = Math.min(startPage + pageBlockSize - 1, totalPages);

	    // 모델에 추가
	    model.addAttribute("breakingNews", pagedNews);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);
	    model.addAttribute("selectedTeam", team);

	    return "/usr/project/information2";
	}
	@RequestMapping("/usr/project/information3")
	public String showMain6(Model model) {
	    // 데이터를 가져오지 않고, 뷰만 반환
	    return "/usr/project/information3";
	}

	// 데이터를 AJAX로 받아오는 새로운 API 엔드포인트
	@ResponseBody
	@RequestMapping("/usr/project/getPlaceRecommendations")
	public List<PlaceRecommendationResponse> getPlaceRecommendations() throws IOException {
	    List<PlaceRecommendationResponse> places;
	    
	    if(rq.getLoginedMember() == null) {
	        places = openAiService.getPlaceRecommendations("야구 선수들이 자주가는 맛집 추천해줘");
	    } else {
	        places = openAiService.getPlaceRecommendations(rq.getLoginedMember().getTeam() + "야구 선수들이 자주가는 맛집 추천해줘");
	    }
	    System.out.println(places);

	    return places;
	}
	@RequestMapping("/usr/project/goods")
	public String showMain8(Model model) throws IOException {
		
		return "/usr/project/goods";
	}
	
	// 데이터를 AJAX로 받아오는 새로운 API 엔드포인트
	@ResponseBody
	@RequestMapping("/usr/project/getGoodsRecommendations")
	public List<GoodsRecommendationResponse> getGoodsRecommendations() throws IOException {
		List<GoodsRecommendationResponse> goods;
		
		if(rq.getLoginedMember() == null) {
			goods = openAiService.getGoodsRecommendations("야구 직관 갈 때 좋은 굿즈들 좀 추천해줘");
		}
		else {
			goods = openAiService.getGoodsRecommendations(rq.getLoginedMember().getTeam() +"야구 직관 갈 때 좋은 굿즈들 좀 추천해줘");
		}
	    System.out.println(goods);

	    return goods;
	}
	
	@RequestMapping("/usr/project/chat")
	public String showMain9() {
		return "/usr/project/chat";
	}
}