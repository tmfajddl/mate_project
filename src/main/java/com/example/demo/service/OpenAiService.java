package com.example.demo.service;

import com.example.demo.dto.PlaceRecommendationResponse;
import com.example.demo.dto.GoodsRecommendationResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.*;

@Service
@RequiredArgsConstructor
public class OpenAiService {

    @Value("${openai.api.key}")
    private String apiKey;

    private final NaverSearchService naverSearchService;
    private final RestTemplate restTemplate = new RestTemplate();

    public List<PlaceRecommendationResponse> getPlaceRecommendations(String prompt) {
        String content = callChatGPT(prompt, "맛집");

        String[] blocks = content.split("\\n\\n+");
        List<PlaceRecommendationResponse> list = new ArrayList<>();

        for (String block : blocks) {
            String[] lines = block.split("\n");
            if (lines.length < 4) continue;

            String name = extractAfterColon(lines[0]);
            String menu = extractAfterColon(lines[1]);
            String reason = extractAfterColon(lines[2]);
            String address = extractAfterColon(lines[3]);

            String query = name + " " + menu;
            String imageUrl = naverSearchService.searchImage(query);

            list.add(new PlaceRecommendationResponse(name, menu, reason, address, imageUrl));
        }
        return list;
    }

    public List<GoodsRecommendationResponse> getGoodsRecommendations(String prompt) {
        String content = callChatGPT(prompt, "굿즈");

        String[] blocks = content.split("\\n\\n+");
        List<GoodsRecommendationResponse> list = new ArrayList<>();

        for (String block : blocks) {
            String[] lines = block.split("\n");
            if (lines.length < 3) continue;

            String name = extractAfterColon(lines[0]);
            String price = extractAfterColon(lines[1]);
            String reason = extractAfterColon(lines[2]);

            String query = name;
            String imageUrl = naverSearchService.searchImage(query);
            System.out.println(name);
            System.out.println(imageUrl);

            list.add(new GoodsRecommendationResponse(name, price, reason, imageUrl));
        }
        return list;
    }

    private String extractAfterColon(String line) {
        return line.contains(":") ? line.split(":", 2)[1].trim() : "";
    }

    private String callChatGPT(String userPrompt, String mode) {
        String systemPrompt = "";

        if ("맛집".equals(mode)) {
            systemPrompt = "다음 질문에 대해 총 5개의 맛집 이름, 대표 메뉴, 선정 이유, 주소를 각각 한 줄로 명확히 답변해줘. 선정이유는 야구선수 누가 방문했는지 알아야해. 포맷은 다음과 같아:\n" +
                    "이름: XXX\n메뉴: XXX\n선정이유: XXX\n주소: XXX";
        } else if ("굿즈".equals(mode)) {
            systemPrompt = "다음 질문에 대해 그 팀에 해당하는 총 5개의 굿즈 이름, 가격, 선정 이유를 각각 한 줄로 명확히 답변해줘. 선정이유는 해당 팀과 관련이 있어야해. 포맷은 다음과 같아:\n" +
                    "이름: XXX\n가격: XXX\n선정이유: XXX";
        }

        Map<String, Object> request = new HashMap<>();
        request.put("model", "gpt-3.5-turbo");
        request.put("messages", List.of(
                Map.of("role", "system", "content", systemPrompt),
                Map.of("role", "user", "content", userPrompt)
        ));

        Map<String, Object> response = restTemplate.postForObject(
                "https://api.openai.com/v1/chat/completions",
                new org.springframework.http.HttpEntity<>(request, buildHeaders()),
                Map.class
        );

        List<Map<String, Object>> choices = (List<Map<String, Object>>) response.get("choices");
        Map<String, Object> message = (Map<String, Object>) choices.get(0).get("message");
        return (String) message.get("content");
    }

    private org.springframework.http.HttpHeaders buildHeaders() {
        org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
        headers.set("Authorization", "Bearer " + apiKey);
        headers.set("Content-Type", "application/json");
        return headers;
    }
}