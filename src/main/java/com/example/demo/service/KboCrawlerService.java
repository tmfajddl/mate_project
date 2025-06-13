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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
	            String winner = tds.get(6).text().trim(); // 팀명 (두번째 컬럼)
	            datas.add(Arrays.asList(rank, teamName, winner));
	        }
	    }
	    return datas;
	}

	public List<HashMap<String, String>> getBreakingNews() throws IOException {
	    List<HashMap<String, String>> allNews = new ArrayList<>();
	    int maxPages = 10; // 전체 몇 페이지까지 가져올지 설정 (원하면 늘릴 수 있음)

	    for (int page = 1; page <= maxPages; page++) {
	        String url = "https://www.koreabaseball.com/MediaNews/News/BreakingNews/List.aspx?page=" + page;
	        Document doc = Jsoup.connect(url).get();

	        Element ul = doc.selectFirst("#contents > div.sub-content > div.board > ul");
	        if (ul == null) continue; // 예외처리

	        Elements lis = ul.select("li");
	        String baseUrl = "https://www.koreabaseball.com/MediaNews/News/BreakingNews";

	        for (Element li : lis) {
	            String title = li.selectFirst("div > strong > a").text().trim();
	            String body = li.selectFirst("div > p").text().trim();

	            // 링크
	            Element linkTag = li.selectFirst("div > strong > a");
	            String linkUrl = null;
	            if (linkTag != null) {
	                String href = linkTag.attr("href");
	                if (!href.startsWith("/")) href = "/" + href;
	                linkUrl = baseUrl + href;
	            }

	            // 이미지
	            Element imgTag = li.selectFirst("span > a > img");
	            String imgUrl = null;
	            if (imgTag != null) {
	                String src = imgTag.attr("src");
	                if (src.startsWith("//")) {
	                    imgUrl = "https:" + src;
	                } else if (!src.startsWith("http")) {
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

	            allNews.add(map);
	        }
	    }

	    return allNews;
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
    
 // 4) TOP5 선수 정보 크롤링
    public List<Map<String, String>> getTOP5Players() throws IOException {
        String url = "https://www.koreabaseball.com/Record/Ranking/Top5.aspx";
        Document doc = Jsoup.connect(url).get();

        Element table = doc.selectFirst("#contents > div.sub-content");
        Elements rows = table.select("ol.rankList");

        List<Map<String, String>> players = new ArrayList<>();
        
        

        for (Element row : rows) {
            Elements tds = row.select("li");

            if (tds.size() >= 5) {
                String first = tds.get(0).text().trim();
                String second = tds.get(1).text().trim();
                String third = tds.get(2).text().trim();
                String fourth = tds.get(3).text().trim();
                String fifth = tds.get(4).text().trim();

                Map<String, String> playerData = new HashMap<>();
                playerData.put("first", first);
                playerData.put("second", second);
                playerData.put("third",third);
                playerData.put("fourth", fourth);
                playerData.put("fifth", fifth);

                players.add(playerData);
            }
        }

        return players;
    }

    
    public List<HashMap<String, String>> getBaseballSchedule() throws IOException {
        String url = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=야구";
        Document doc = Jsoup.connect(url).get();

        Element table = doc.selectFirst("#myschedule_1 > table");
        List<HashMap<String, String>> datas = new ArrayList<>();

        if (table == null) {
            return datas; // 빈 리스트 반환
        }

        // 팀명 리스트 (필요에 따라 조절)
        List<String> teamNames = Arrays.asList("두산", "한화", "LG", "삼성", "롯데", "키움", "KT", "NC", "SSG", "KIA");

        // 헤더
        Elements ths = table.select("thead tr th");
        List<String> columns = new ArrayList<>();
        for (int i = 0; i < Math.min(3, ths.size()); i++) {
            columns.add(ths.get(i).text().trim());
        }
        if (columns.isEmpty()) {
            columns.add("시간");
            columns.add("경기정보");
            columns.add("구장");
        }

        // 바디
        Elements trs = table.select("tbody tr");
        for (Element tr : trs) {
            Elements tds = tr.select("td");
            if (tds.size() < 3) continue; // 3개 칸이 안되면 스킵

            HashMap<String, String> row = new HashMap<>();

            // 시간 (첫번째 칸)
            row.put("시간", tds.get(0).text().trim());

            // 경기정보 (두번째 칸) 예: "두산잭로그패 2 : 3 한화승주현상"
            String gameInfo = tds.get(1).text().trim();

            // 점수 추출
            Pattern scorePattern = Pattern.compile("(\\d+)\\s*:\\s*(\\d+)");
            Matcher m = scorePattern.matcher(gameInfo);

            if (m.find()) {
                int start = m.start();
                int end = m.end();

                String leftPart = gameInfo.substring(0, start).trim();   // 왼쪽 팀 + 상태+투수
                String rightPart = gameInfo.substring(end).trim();        // 오른쪽 팀 + 상태+투수
                String score = gameInfo.substring(start, end).trim();     // 점수 (ex: 2 : 3)

             // 왼쪽 팀명 분리
                String leftTeam = "";
                String leftStatusPitcher = "";
                for (String team : teamNames) {
                    if (leftPart.startsWith(team)) {
                        leftTeam = team;
                        leftStatusPitcher = leftPart.substring(team.length());
                        break;
                    }
                }
                // 왼쪽 선발 선수 마지막 글자 제거
                if (leftStatusPitcher.length() > 0) {
                    leftStatusPitcher = leftStatusPitcher.substring(0, leftStatusPitcher.length() - 1);
                }

                // 오른쪽 팀명 분리
                String rightTeam = "";
                String rightStatusPitcher = "";
                for (String team : teamNames) {
                    if (rightPart.startsWith(team)) {
                        rightTeam = team;
                        rightStatusPitcher = rightPart.substring(team.length());
                        break;
                    }
                }
                // 오른쪽 선발 선수 첫 글자 제거
                if (rightStatusPitcher.length() > 0) {
                    rightStatusPitcher = rightStatusPitcher.substring(1);
                }

                // 결과를 별도로 저장
                row.put("왼쪽팀명", leftTeam);
                row.put("왼쪽상태및투수", leftStatusPitcher);
                row.put("스코어", score);
                row.put("오른쪽팀명", rightTeam);
                row.put("오른쪽상태및투수", rightStatusPitcher);
            } else {
                // 점수 패턴 못찾으면 그냥 원본 경기정보 저장
                row.put("경기정보", gameInfo);
            }

            // 구장 (세번째 칸)
            row.put("구장", tds.get(2).text().trim());

            datas.add(row);
        }

        return datas;
    }
}



