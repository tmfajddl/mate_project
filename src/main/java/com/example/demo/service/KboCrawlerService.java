package com.example.demo.service;

import org.jsoup.Jsoup;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.springframework.stereotype.Service;

import io.github.bonigarcia.wdm.WebDriverManager;

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
    public List<HashMap<String, String>> getBaseballScheduleWithSelenium() {
        WebDriverManager.chromedriver().setup(); 
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless"); // 브라우저 안 뜨게 설정
        options.addArguments("--disable-gpu"); // GPU 비활성화 (Windows 안정성)
        options.addArguments("--no-sandbox");  // 리눅스 권한 문제 해결용
        options.addArguments("--disable-dev-shm-usage"); // 메모리 문제 방지

        WebDriver driver = new ChromeDriver(options); // 옵션 적용

        List<HashMap<String, String>> datas = new ArrayList<>();

        try {
            driver.get("https://www.koreabaseball.com/Default.aspx?vote=true");
            Thread.sleep(3000); // 페이지 로딩 대기

            List<WebElement> gameElements = driver.findElements(By.cssSelector("ul.game-list-n > li.game-cont"));
            System.out.println("게임 요소 개수: " + gameElements.size());

            for (WebElement game : gameElements) {
                HashMap<String, String> row = new HashMap<>();

                // 시간, 구장
                List<WebElement> topLis = game.findElements(By.cssSelector("div.top > ul > li"));
                row.put("시간", topLis.size() > 2 ? topLis.get(2).getText().trim() : "");
                row.put("구장", topLis.size() > 0 ? topLis.get(0).getText().trim() : "");

                // 원정팀
                WebElement awayTeam = game.findElement(By.cssSelector("div.team.away"));
                String awayTeamName = awayTeam.findElement(By.tagName("img")).getAttribute("alt").trim();
                String awayPitcher = awayTeam.findElement(By.cssSelector("div.today-pitcher > p")).getText().trim();

                // 홈팀
                WebElement homeTeam = game.findElement(By.cssSelector("div.team.home"));
                String homeTeamName = homeTeam.findElement(By.tagName("img")).getAttribute("alt").trim();
                String homePitcher = homeTeam.findElement(By.cssSelector("div.today-pitcher > p")).getText().trim();

                if (awayPitcher.startsWith("선")) {
                    awayPitcher = awayPitcher.substring(1).trim();
                }
                if (homePitcher.startsWith("선")) {
                    homePitcher = homePitcher.substring(1).trim();
                }
                
                // 스코어 정보는 없기 때문에 빈값 또는 "-"
                row.put("왼쪽팀명", awayTeamName);
                row.put("왼쪽상태및투수", awayPitcher);
                row.put("스코어", "-");
                row.put("오른쪽팀명", homeTeamName);
                row.put("오른쪽상태및투수", homePitcher);

                datas.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }

        return datas;
    }

}



