package com.example.demo.controller;

import com.example.demo.dto.PlaceRecommendationResponse;
import com.example.demo.service.OpenAiService;

import lombok.RequiredArgsConstructor;

import java.util.List;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/openai")
@RequiredArgsConstructor
public class OpenAiController {

    private final OpenAiService openAiService;

    @GetMapping("/recommend")
    public Object recommend(@RequestParam String prompt, @RequestParam String mode) {
        if ("맛집".equals(mode)) {
            return openAiService.getPlaceRecommendations(prompt);
        } else if ("굿즈".equals(mode)) {
            return openAiService.getGoodsRecommendations(prompt);
        }
        return null;
    }
}