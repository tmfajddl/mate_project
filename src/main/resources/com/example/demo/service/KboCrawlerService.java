package com.example.demo.service;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class KboCrawlerService {

    private WebDriver getDriver() {
        WebDriverManager.chromedriver().setup();
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless");
        options.addArguments("--no-sandbox");
        options.addArguments("--disable-dev-shm-usage");
        return new ChromeDriver(options);
    }

    public List<List<String>> getTeamRankings() {
        WebDriver driver = getDriver();
        List<List<String>> datas = new ArrayList<>();
        try {
            driver.get("https://www.koreabaseball.com/Record/TeamRank/TeamRankDaily.aspx");
            WebElement table = driver.findElement(By.cssSelector("#cphContents_cphContents_cphContents_udpRecord > table > tbody"));
            List<WebElement> rows = table.findElements(By.tagName("tr"));
            for (WebElement row : rows) {
                List<String> rowData = new ArrayList<>();
                for (WebElement cell : row.findElements(By.tagName("td"))) {
                    rowData.add(cell.getText().trim());
                }
                datas.add(rowData);
            }
        } finally {
            driver.quit();
        }
        return datas;
    }

    public List<HashMap<String, String>> getBreakingNews() {
        WebDriver driver = getDriver();
        List<HashMap<String, String>> datas = new ArrayList<>();
        try {
            driver.get("https://www.koreabaseball.com/MediaNews/News/BreakingNews/List.aspx");
            WebElement ul = driver.findElement(By.cssSelector("#contents > div.sub-content > div.board > ul"));
            List<WebElement> lis = ul.findElements(By.tagName("li"));
            String baseUrl = "https://www.koreabaseball.com";

            for (WebElement li : lis) {
                String title = li.findElement(By.cssSelector("div > strong > a")).getText().trim();
                String body = li.findElement(By.cssSelector("div > p")).getText().trim();
                String pictureUrl = null;
                List<WebElement> imgTags = li.findElements(By.cssSelector("span > a > img"));
                if (!imgTags.isEmpty()) {
                    pictureUrl = baseUrl + imgTags.get(0).getAttribute("src");
                }

                HashMap<String, String> map = new HashMap<>();
                map.put("title", title);
                map.put("body", body);
                map.put("pictureUrl", pictureUrl);
                datas.add(map);
            }
        } finally {
            driver.quit();
        }
        return datas;
    }

    public List<HashMap<String, String>> getNaverBaseballSchedule() {
        WebDriver driver = getDriver();
        List<HashMap<String, String>> datas = new ArrayList<>();
        try {
            driver.get("https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=야구");
            WebElement table = driver.findElement(By.cssSelector("#myschedule_1 > table"));

            List<WebElement> ths = table.findElements(By.cssSelector("thead tr th"));
            List<String> columns = new ArrayList<>();
            for (int i = 0; i < Math.min(3, ths.size()); i++) {
                columns.add(ths.get(i).getText().trim());
            }
            if (columns.isEmpty()) {
                columns.add("컬럼1");
                columns.add("컬럼2");
                columns.add("컬럼3");
            }

            List<WebElement> trs = table.findElements(By.cssSelector("tbody tr"));
            for (WebElement tr : trs) {
                List<WebElement> tds = tr.findElements(By.tagName("td"));
                HashMap<String, String> row = new HashMap<>();
                for (int i = 0; i < Math.min(3, tds.size()); i++) {
                    row.put(columns.get(i), tds.get(i).getText().trim());
                }
                datas.add(row);
            }
        } finally {
            driver.quit();
        }
        return datas;
    }

    public List<List<String>> getRegisteredPlayers() {
        WebDriver driver = getDriver();
        List<List<String>> datas = new ArrayList<>();
        try {
            driver.get("https://www.koreabaseball.com/Player/RegisterAll.aspx");
            WebElement table = driver.findElement(By.cssSelector("#cphContents_cphContents_cphContents_udpRecord > div > div.fistStatus > table > tbody"));
            List<WebElement> rows = table.findElements(By.tagName("tr"));
            for (WebElement row : rows) {
                List<String> rowData = new ArrayList<>();
                for (WebElement cell : row.findElements(By.tagName("td"))) {
                    rowData.add(cell.getText().trim());
                }
                datas.add(rowData);
            }
        } finally {
            driver.quit();
        }
        return datas;
    }

    public List<List<String>> getCanceledPlayers() {
        WebDriver driver = getDriver();
        List<List<String>> datas = new ArrayList<>();
        try {
            driver.get("https://www.koreabaseball.com/Player/RegisterAll.aspx");
            WebElement table = driver.findElement(By.cssSelector("#cphContents_cphContents_cphContents_udpRecord > div > div.fistCancelStatus > table > tbody"));
            List<WebElement> rows = table.findElements(By.tagName("tr"));
            for (WebElement row : rows) {
                List<String> rowData = new ArrayList<>();
                for (WebElement cell : row.findElements(By.tagName("td"))) {
                    rowData.add(cell.getText().trim());
                }
                datas.add(rowData);
            }
        } finally {
            driver.quit();
        }
        return datas;
    }
}