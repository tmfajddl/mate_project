package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.KboCrawlerService;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/kbo")
public class KboCrawlerController {

    private final KboCrawlerService kboCrawlerService;

    public KboCrawlerController(KboCrawlerService kboCrawlerService) {
        this.kboCrawlerService = kboCrawlerService;
    }

    // 1) 팀 순위
    @GetMapping("/team-rankings")
    public List<List<String>> getTeamRankings() throws IOException {
        return kboCrawlerService.getTeamRankings();
    }

    // 2) 최신 뉴스 (이미지 포함)
    @GetMapping("/news")
    public List<HashMap<String, String>> getBreakingNews() throws IOException {
        return kboCrawlerService.getBreakingNews();
    }

    // 3) 네이버 야구 검색 스케줄
    @GetMapping("/schedule")
    public List<HashMap<String, String>> getNaverBaseballSchedule() throws IOException {
        return kboCrawlerService.getNaverBaseballSchedule();
    }
    
 // 등록 선수 조회
    @GetMapping("/registered-players")
    public List<List<String>> getRegisteredPlayers() throws IOException {
        return kboCrawlerService.getRegisteredPlayers();
    }

    // 말소 선수 조회
    @GetMapping("/canceled-players")
    public List<List<String>> getCanceledPlayers() throws IOException {
        return kboCrawlerService.getCanceledPlayers();
    }
}