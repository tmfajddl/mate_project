package com.example.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PlaceRecommendationResponse {
    private String name;
    private String menu;
    private String reason;
    private String address;    // 새로 추가
    private String imageUrl;
}