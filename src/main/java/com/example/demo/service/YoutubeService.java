package com.example.demo.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class YoutubeService {

	private final String API_KEY = "AIzaSyBr7KQWVWGMjHlFECnsaG6Bjbzp3rf9bSQ";
    private final String PLAYLIST_ID = "PLuY-NTS_5IpwDchUv4a1Mpujz6pocE69Q";
    private final String PLAYLIST_ID2 = "PLuY-NTS_5IpxSLENcrLkC1_E7RuWldqXR";

    public List<String> getVideoTitles(String CHANNEL_ID,int maxResults) {
        List<String> titles = new ArrayList<>();
        try {
            String urlStr = "https://www.googleapis.com/youtube/v3/search"
                    + "?key=" + API_KEY
                    + "&channelId=" + CHANNEL_ID
                    + "&part=snippet"
                    + "&order=date"
                    + "&maxResults=" + maxResults;

            URL url = new URL(urlStr);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader br = new BufferedReader(
                    new InputStreamReader(conn.getInputStream())
            );

            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            br.close();

            JSONObject json = new JSONObject(sb.toString());
            JSONArray items = json.getJSONArray("items");

            for (int i = 0; i < items.length(); i++) {
                JSONObject snippet = items.getJSONObject(i).getJSONObject("snippet");
                String title = snippet.getString("title");
                titles.add(title);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return titles;
    }

    public List<String> getVideoIds(String CHANNEL_ID, int maxResults) {
        List<String> ids = new ArrayList<>();
        try {
            String urlStr = "https://www.googleapis.com/youtube/v3/search"
                    + "?key=" + API_KEY
                    + "&channelId=" + CHANNEL_ID
                    + "&part=snippet"
                    + "&order=date"
                    + "&maxResults=" + maxResults;

            URL url = new URL(urlStr);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader br = new BufferedReader(
                    new InputStreamReader(conn.getInputStream())
            );

            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            br.close();

            JSONObject json = new JSONObject(sb.toString());
            JSONArray items = json.getJSONArray("items");

            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i);
                // 영상 ID는 items[i].id.videoId 에 있음
                JSONObject idObj = item.getJSONObject("id");
                if (idObj.has("videoId")) {
                    ids.add(idObj.getString("videoId"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return ids;
    }
    public List<String> getPlaylistVideoIds() {
        List<String> videoIds = new ArrayList<>();
        try {
            String urlStr = "https://www.googleapis.com/youtube/v3/playlistItems"
                    + "?part=snippet"
                    + "&playlistId=" + PLAYLIST_ID
                    + "&maxResults=10"
                    + "&key=" + API_KEY;

            URL url = new URL(urlStr);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            br.close();

            JSONObject json = new JSONObject(sb.toString());
            JSONArray items = json.getJSONArray("items");

            for (int i = 0; i < items.length(); i++) {
                JSONObject snippet = items.getJSONObject(i).getJSONObject("snippet");

                // 삭제 또는 비공개 영상은 제외
                String title = snippet.optString("title", "");
                if ("Deleted video".equalsIgnoreCase(title) || "Private video".equalsIgnoreCase(title)) {
                    continue;
                }

                JSONObject resourceId = snippet.getJSONObject("resourceId");
                if (resourceId.has("videoId")) {
                    videoIds.add(resourceId.getString("videoId"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return videoIds;
    }
    
    
    public String getChannelIdByTeam(String loginedTeam) {
        if (loginedTeam == null) {
            // null일 경우 기본 채널 ID 반환
            return "UCfkQKgz0LMU2Yl5Mjiib2zQ"; 
        }
        switch (loginedTeam) {
            case "두산 베어스":
                return "UCqvZpDa6SGnV9xD6DEZd_lw";
            case "LG 트윈스":
                return "UC6a2aV6HrN9RmYeA4cU3OyQ";
            case "키움 히어로즈":
                return "UCxZLI9Fk-0XbtXlFfOZxewg";
            case "삼성 라이온즈":
                return "UC_XeSc3mV-KfGytlmZyEp5Q";
            case "한화 이글스":
                return "UCdq4Ji3772xudYRUatdzRrg";
            case "NC 다이노스":
                return "UC8_FRgynMX8wlGsU6Jh3zKg";
            case "롯데 자이언츠":
                return "UCBcNoFQF4uELiHaf9LRn6CQ";
            case "KIA 타이거즈":
                return "UClhH7jhO49n7cix5_w-5HjA";
            case "KT 위즈":
                return "UCr_vAP1K9QjmxlLmiybSjZg";
            case "SSG 랜더스":
                return "UChSmpTx60O7BfEz6sY7rTPQ";
            default:
                return "UCfkQKgz0LMU2Yl5Mjiib2zQ"; // 기본 채널 ID
        }
    }
    public List<Map<String, String>> getFilteredVideosByTeam(String loginedTeam) {
        List<Map<String, String>> videoList = new ArrayList<>();
        try {
            String urlStr = "https://www.googleapis.com/youtube/v3/playlistItems"
                    + "?part=snippet"
                    + "&playlistId=" + PLAYLIST_ID2
                    + "&maxResults=50"
                    + "&key=" + API_KEY;

            URL url = new URL(urlStr);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            br.close();

            JSONObject json = new JSONObject(sb.toString());
            JSONArray items = json.getJSONArray("items");

            String keyword = (loginedTeam != null) ? loginedTeam.split(" ")[0] : null;

            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i);
                JSONObject snippet = item.getJSONObject("snippet");
                JSONObject resourceId = snippet.getJSONObject("resourceId");

                if (!resourceId.has("videoId")) continue;  // 비디오 ID 없으면 스킵

                String videoId = resourceId.getString("videoId");
                String title = snippet.getString("title");

                if (keyword == null || title.contains(keyword)) {
                    Map<String, String> video = new HashMap<>();
                    video.put("id", videoId);
                    video.put("title", title);
                    video.put("url", "https://www.youtube.com/watch?v=" + videoId);
                    videoList.add(video);
                }
            }

            // 조건에 맞는 영상이 없을 경우, 앞에서 10개 추출
            if (videoList.isEmpty()) {
                for (int i = 0; i < items.length() && videoList.size() < 10; i++) {
                    JSONObject item = items.getJSONObject(i);
                    JSONObject snippet = item.getJSONObject("snippet");
                    JSONObject resourceId = snippet.getJSONObject("resourceId");

                    if (!resourceId.has("videoId")) continue;

                    String videoId = resourceId.getString("videoId");
                    String title = snippet.getString("title");

                    Map<String, String> video = new HashMap<>();
                    video.put("id", videoId);
                    video.put("title", title);
                    video.put("url", "https://www.youtube.com/watch?v=" + videoId);
                    videoList.add(video);
                }
            }

            // 최대 10개만 리턴
            if (videoList.size() > 10) {
                videoList = videoList.subList(0, 10);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return videoList;
    }
}

