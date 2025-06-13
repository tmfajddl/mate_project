package com.example.demo.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/youtube")
public class YoutubeController {

	 public static String getPlaylists(String channelId, String apiKey) {
	        StringBuilder result = new StringBuilder();
	        try {
	            String apiUrl = "https://www.googleapis.com/youtube/v3/playlists"
	                          + "?part=snippet"
	                          + "&channelId=" + channelId
	                          + "&maxResults=10"
	                          + "&key=" + apiKey;

	            URL url = new URL(apiUrl);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("GET");

	            BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line;
	            while ((line = rd.readLine()) != null) {
	                result.append(line);
	            }
	            rd.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return result.toString(); // JSON 문자열 반환
	    }
}
