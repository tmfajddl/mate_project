package com.example.demo.controller;

import com.example.demo.dto.RecommendationResponse;
import com.example.demo.service.OpenAiService;

import java.util.List;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/openai")
public class OpenAiController {

    private final OpenAiService openAiService;

    public OpenAiController(OpenAiService openAiService) {
        this.openAiService = openAiService;
    }

    @GetMapping("/recommend")
    public List<RecommendationResponse> recommend(@RequestParam String prompt) {
        return openAiService.getRecommendations(prompt);
    }
}
