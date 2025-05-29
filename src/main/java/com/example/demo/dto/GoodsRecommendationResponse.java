package com.example.demo.dto;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class GoodsRecommendationResponse {
    private String name;
    private String menu;
    private String goods;
    private String imageUrl;
}
