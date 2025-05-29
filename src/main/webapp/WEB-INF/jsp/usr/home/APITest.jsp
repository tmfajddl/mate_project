<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jspf" %>
<c:set var="pageTitle" value="위치기반 날씨보기" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>위치 기반 날씨 보기</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    const API_KEY = "a742b907a44edf2cb751b547e466583e";

    function onGeoOk(position) {
      const latitude = position.coords.latitude;
      const longitude = position.coords.longitude;

      console.log("현재 위도:",latitude);
      console.log("현재 경도:",longitude);

      const url = "https://api.openweathermap.org/data/2.5/weather?lat=" + latitude +
      "&lon=" + longitude +
      "&appid=" + API_KEY +
      "&units=metric&lang=kr";
      
      console.error(url);

      fetch(url)
        .then(response => {
          if (!response.ok) throw new Error("날씨 API 호출 실패");
          return response.json();
        })
        .then(data => {
        	console.log("받아온 날씨 데이터:", data);
        	const temperature = data.main.temp;
        	const weatherMain = data.weather[0].main;
        	const weatherDescription = data.weather[0].description;
        	
        	console.log("받아온 날씨 온도:", temperature);
        	console.log("받아온 날씨:", weatherMain);
        	console.log("받아온 날씨2:", weatherDescription);
        	

        })
        .catch(error => {
          console.error("에러 발생:", error);
        });
    }

    function onGeoError() {
      alert("위치 정보를 가져올 수 없습니다.");
    }

    navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError);
  </script>
</head>
<body>
  <h1>📍 현재 위치 기반 날씨 보기</h1>
</body>
</html>

<%@ include file="../common/foot.jspf" %>