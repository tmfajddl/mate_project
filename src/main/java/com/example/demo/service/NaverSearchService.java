package com.example.demo.service;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;  // 추가
import org.springframework.stereotype.Service;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@Service
public class NaverSearchService {

    public String searchImage(String query) {
        String imageUrl = "";
        WebDriver driver = null;

        try {
            System.setProperty("webdriver.chrome.driver", "C:\\chromedriver\\chromedriver.exe");

            // headless 옵션 추가
            ChromeOptions options = new ChromeOptions();
            options.addArguments("--headless");  // 브라우저 UI 없이 실행
            options.addArguments("--disable-gpu"); // GPU 사용 안함 (일부 환경에서 필요)
            options.addArguments("--no-sandbox"); // 보안 옵션 비활성화 (리눅스 등에서 필요)
            options.addArguments("--disable-dev-shm-usage"); // 메모리 제한 해결

            driver = new ChromeDriver(options);

            String encodedQuery = URLEncoder.encode(query, StandardCharsets.UTF_8.toString());
            String searchUrl = "https://search.naver.com/search.naver?where=image&sm=tab_jum&query=" + encodedQuery;

            driver.get(searchUrl);

            // 이미지가 로딩될 시간을 줌
            Thread.sleep(2000);

            // 이미지 태그 찾기
            List<WebElement> imageElements = driver.findElements(By.cssSelector("img._fe_image_tab_content_thumbnail_image"));

            for (WebElement imageElement : imageElements) {
                String src = imageElement.getAttribute("src");
                if (src != null && !src.isEmpty()) {
                    src = src.replace("&amp;", "&");
                    String alt = imageElement.getAttribute("alt");
                    System.out.println("alt: " + alt);
                    System.out.println("src: " + src);

                    if (alt == null || (!alt.contains("로고") && !alt.contains("스티커"))) {
                        imageUrl = src;
                        break;
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (driver != null) {
                driver.quit();
            }
        }

        return imageUrl;
    }
}