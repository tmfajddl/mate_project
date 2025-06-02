package com.example.demo.dto;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class GoodsRecommendationResponse {
    private String name;
    private String price;
    private String reason;
    private String imageUrl;
}
