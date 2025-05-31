<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jspf"%>
<!DOCTYPE html>
<html lang="en">
<style>
.menu2{
 display: flex;
    flex-direction: row;
    justify-content: end;
    width: 70%;
    height: 80px;
    margin:0;
    padding: 0;
}
.menu2 > :nth-child(2){
    width: 20%;
    height: 100%;
    border: 2px solid #4a90e2;
    border-bottom:none;
    border-radius: 10px 10px 0 0;
}
.menu2 >div{
    width: 20%;
    height: 100%;
    border: 2px solid #4a90e2;
    border-radius: 10px 10px 0 0;
}
.body{
border-radius: 10px 0 10px 10px;
    width: 70%;
    height: 50%;

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

.menu2 > div a {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  font-size: 1.25rem;
  text-decoration: none;
  color: inherit;
}
</style>

  <body class="m-0 h-full font-sans">

    <!-- Hero Section (100% 화면 채움 + 배경 이미지) -->
    <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black" style="background-image: url('/images/bg.jpg');">
    <div class="menu2">
      <div style="background-color: rgba(242, 247, 247,0.8);"><a href="../project/information">날씨/준비물</a></div>
      <div style="background-color: rgba(242, 247, 247,0.8);"><a href="../project/information2">최근경기순위</a></div>
      <div style="background-color: rgba(242, 247, 247,0.8);"><a href="../project/information3">주변 맛집</a></div>
    </div>
    <div class="body" style="background-color: rgba(242, 247, 247,0.8);">
	</div>
	                     <div class="left-controls flex items-center gap-4 mt-2 mb-4" style="justify-content:flex-start; text-align:left;">
  <button class="btn-back btn btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
</div>
    </section>

  </body>
</html>



