package com.example.demo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.GoodsRecommendationResponse;
import com.example.demo.dto.PlaceRecommendationResponse;
import com.example.demo.service.KboCrawlerService;
import com.example.demo.service.NaverSearchService;
import com.example.demo.service.OpenAiService;
import com.example.demo.vo.Rq;

@Controller
public class UsrHomeController {
	
	@Autowired
	private Rq rq;
	
	@Autowired
	private KboCrawlerService kboCrawlerService;
	
	@Autowired
	private OpenAiService openAiService;
	
	@RequestMapping("/usr/home/main")
	public String showMain() {
		return "/usr/home/main";
	}

	@RequestMapping("/")
	public String showMain2() {
		return "redirect:/usr/home/main";
	}

	
	@RequestMapping("/usr/project/information")
	public String showMain4() {
		return "/usr/project/information";
	}
	@RequestMapping("/usr/project/information2")
	public String showMain5(Model model) throws IOException {
		 List<List<String>> rankings = kboCrawlerService.getTeamRankings();
		    model.addAttribute("rankings", rankings);
		    
		 List<HashMap<String, String>> breakingNews = kboCrawlerService.getBreakingNews();
		 model.addAttribute("breakingNews", breakingNews);
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