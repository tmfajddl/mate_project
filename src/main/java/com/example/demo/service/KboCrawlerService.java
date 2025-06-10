package com.example.demo.service;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class KboCrawlerService {

    // 1) KBO 팀 순위 크롤링
	public List<List<String>> getTeamRankings() throws IOException {
	    String url = "https://www.koreabaseball.com/Record/TeamRank/TeamRankDaily.aspx";
	    Document doc = Jsoup.connect(url).get();

	    Element table = doc.selectFirst("#cphContents_cphContents_cphContents_udpRecord > table");
	    Elements rows = table.select("tbody tr");

	    List<List<String>> datas = new ArrayList<>();

	    for (Element row : rows) {
	        Elements tds = row.select("td");
	        if (tds.size() > 1) {
	            String rank = tds.get(0).text().trim();    // 순위 (첫번째 컬럼)
	            String teamName = tds.get(1).text().trim(); // 팀명 (두번째 컬럼)
	            datas.add(Arrays.asList(rank, teamName));
	        }
	    }
	    return datas;
	}

	public List<HashMap<String, String>> getBreakingNews() throws IOException {
	    String url = "https://www.koreabaseball.com/MediaNews/News/BreakingNews/List.aspx";
	    Document doc = Jsoup.connect(url).get();

	    Element ul = doc.selectFirst("#contents > div.sub-content > div.board > ul");
	    Elements lis = ul.select("li");
	    String baseUrl = "https://www.koreabaseball.com/MediaNews/News/BreakingNews";

	    List<HashMap<String, String>> datas = new ArrayList<>();

	    for (Element li : lis) {
	        String title = li.selectFirst("div > strong > a").text().trim();
	        String body = li.selectFirst("div > p").text().trim();

	        // 상세페이지 링크 가져오기
	        Element linkTag = li.selectFirst("div > strong > a");
	        String linkUrl = null;
	        if (linkTag != null) {
	            String href = linkTag.attr("href");
	            if (!href.startsWith("/")) {
	                href = "/" + href;
	            }
	            linkUrl = baseUrl + href;
	        }

	        // 이미지 크롤링
	        Element imgTag = li.selectFirst("span > a > img");
	        String imgUrl = null;
	        if (imgTag != null) {
	            String src = imgTag.attr("src");

	            if (src.startsWith("//")) {
	                // // 로 시작하면 https: 붙이기
	                imgUrl = "https:" + src;
	            } else if (!src.startsWith("http")) {
	                // 상대경로이면 도메인 붙이기
	                imgUrl = "https://www.koreabaseball.com" + (src.startsWith("/") ? "" : "/") + src;
	            } else {
	                imgUrl = src;
	            }
	        }

	        HashMap<String, String> map = new HashMap<>();
	        map.put("title", title);
	        map.put("body", body);
	        map.put("linkUrl", linkUrl);
	        map.put("imgUrl", imgUrl);

	        datas.add(map);
	    }

	    return datas;
	}

    // 3) 네이버 야구 검색 결과 크롤링 (최대 3개 컬럼)
    public List<HashMap<String, String>> getNaverBaseballSchedule() throws IOException {
        String url = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=야구";
        Document doc = Jsoup.connect(url).get();

        Element table = doc.selectFirst("#myschedule_1 > table");
        List<HashMap<String, String>> datas = new ArrayList<>();

        if (table == null) {
            return datas; // 빈 리스트 반환
        }

        // 헤더
        Elements ths = table.select("thead tr th");
        List<String> columns = new ArrayList<>();
        for (int i = 0; i < Math.min(3, ths.size()); i++) {
            columns.add(ths.get(i).text().trim());
        }
        if (columns.isEmpty()) {
            columns.add("컬럼1");
            columns.add("컬럼2");
            columns.add("컬럼3");
        }

        // 바디
        Elements trs = table.select("tbody tr");
        for (Element tr : trs) {
            Elements tds = tr.select("td");
            HashMap<String, String> row = new HashMap<>();

            for (int i = 0; i < Math.min(3, tds.size()); i++) {
                row.put(columns.get(i), tds.get(i).text().trim());
            }
            datas.add(row);
        }

        return datas;
    }
    // 4) KBO 등록 선수 정보 크롤링
    public List<Map<String, String>> getRegisteredPlayers() throws IOException {
        String url = "https://www.koreabaseball.com/Player/RegisterAll.aspx";
        Document doc = Jsoup.connect(url).get();

        Element table = doc.selectFirst("#cphContents_cphContents_cphContents_udpRecord > div > div.fistStatus > table");
        Elements rows = table.select("tbody tr");

        List<Map<String, String>> players = new ArrayList<>();
        
        

        for (Element row : rows) {
            Elements tds = row.select("td");

            if (tds.size() >= 3) {
                String name = tds.get(0).text().trim();
                String position = tds.get(1).text().trim();
                String team = tds.get(2).text().trim();

                Map<String, String> playerData = new HashMap<>();
                playerData.put("name", name);
                playerData.put("position", position);
                playerData.put("team", team);

                players.add(playerData);
            }
        }

        return players;
    }

    // 5) KBO 말소 선수 정보 크롤링
    public List<Map<String, String>> getCanceledPlayers() throws IOException {
        String url = "https://www.koreabaseball.com/Player/RegisterAll.aspx";
        Document doc = Jsoup.connect(url).get();

        Element table = doc.selectFirst("#cphContents_cphContents_cphContents_udpRecord > div > div.fistCancelStatus > table");
        Elements rows = table.select("tbody tr");

        List<Map<String, String>> datas = new ArrayList<>();
        

        for (Element row : rows) {
            Elements tds = row.select("td");
            
            if (tds.size() >= 3) {

            // 예: 선수명(1번째 td), 포지션(3번째 td), 팀(5번째 td) - 실제 인덱스는 크롤링 페이지 구조 확인 필요 (0부터 시작)
            String name = tds.get(0).text().trim();
            String position = tds.get(1).text().trim();
            String team = tds.get(2).text().trim();

            Map<String, String> playerData = new HashMap<>();
            playerData.put("name", name);
            playerData.put("position", position);
            playerData.put("team", team);

            datas.add(playerData);
            }
        }

        return datas;
    }
}
