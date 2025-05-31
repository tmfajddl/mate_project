<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jspf"%>
<!DOCTYPE html>
<html lang="en">
<style>
.main{
border-radius: 10px;
    width: 70%;
    height: 50%;
    background-color: rgba(74, 144, 226, 0.8);
  border: 10px solid white;
}

    .btn-back {
  background: none;
  border: none;
  cursor: pointer;
  color: inline-block;
  padding: 4px 10px;
  border-radius: 5px;
  background-color: #82c3f5;
}

/* 뒤로가기 버튼에 마우스 올리면 테이블 행 호버 색과 같게 */
.btn-back:hover {
background-color: #4a90e2;
}

</style>

  <body class="m-0 h-full font-sans">

    <!-- Hero Section (100% 화면 채움 + 배경 이미지) -->
    <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black" style="background-image: url('/images/bg.jpg');">
    <div class="main">
	</div>
	                     <div class="left-controls flex items-center gap-4 mt-2 mb-4" style="justify-content:flex-start; text-align:left;">
  <button class="btn-back btn btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
</div>
    </section>

  </body>
</html>