package com.example.demo.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;

@Service
public class NaverSearchService {

    @Value("${naver.client-id}")
    private String clientId;

    @Value("${naver.client-secret}")
    private String clientSecret;

    private final RestTemplate restTemplate = new RestTemplate();

    public String searchImage(String query) {
        try {
            String encodedQuery = URLEncoder.encode(query, StandardCharsets.UTF_8.toString());
            String url = "https://openapi.naver.com/v1/search/image?query=" + encodedQuery + "&sort=sim&filter=medium&display=10";

            HttpHeaders headers = new HttpHeaders();
            headers.set("X-Naver-Client-Id", clientId);
            headers.set("X-Naver-Client-Secret", clientSecret);

            HttpEntity<String> entity = new HttpEntity<>(headers);
            ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.GET, entity, Map.class);

            List<Map<String, Object>> items = (List<Map<String, Object>>) response.getBody().get("items");

            if (items != null && !items.isEmpty()) {
                for (Map<String, Object> item : items) {
                    String title = (String) item.get("title");
                    String link = (String) item.get("link");

                    // 간단한 필터링: 제목에 음식 키워드 포함된 경우
                    if (title != null && (
                            title.contains("음식") || title.contains("요리") || title.contains("식당") ||
                            title.contains("맛집") || title.contains("메뉴") || title.contains("사진"))
                    ) {
                        return link;
                    }
                }
                // 필터링된 게 없으면 첫 번째 링크 반환
                return items.get(0).get("link").toString();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "";
    }
}