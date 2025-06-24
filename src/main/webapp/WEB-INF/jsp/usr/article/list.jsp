<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jspf"%>
<link href="https://cdn.jsdelivr.net/gh/projectnoonnu/2411-3@1.0/index.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="en">
  <head>
    <style>
    body {
  font-family: 'Ownglyph_ParkDaHyun', sans-serif;
}
      /* 배경에 연한 하늘색 반투명 오버레이 */
      .overlay {
        background-color: rgba(247, 246, 245, 0.6); /* 연한 하늘색 */
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
      }

      /* 내용 컨테이너 */
      .content-container {
        position: relative;
        z-index: 1;
        width: 100%;
        height: 100%;
        overflow: auto;
        padding: 20px;
        display: flex;
        flex-direction: column;
      }

      /* 검색창 스타일 */
      .search_bar {
        margin-top: 50px; /* 위쪽에서 살짝 내려줌 */
        width: 30%; /* 화면의 30% 정도 */
        background-color: rgba(255, 255, 255, 0.7);
        border-radius: 10px;
        padding: 10px;
      }

      /* 테이블 스타일 */
      table {
        width: 100%;
        border-collapse: collapse;
        background-color: white;
        border-radius: 10px; /* 리스트 가장자리 라운드 */
        overflow: hidden; /* 라운드 유지 */
      }

      th, td {
        text-align: center;
        padding: 10px;
      }

      thead {
        background-color: #f7ecdc;
      }

      tbody tr:hover {
        background-color: #f7ecdc;
      }

      /* 페이지네이션 스타일 */
      .pagination a {
        margin: 0 5px;
        color: black;
      }
      .left-controls {
  justify-content: flex-start; /* 왼쪽 정렬 */
  color: black;
  font-weight: 600;
}

.btn-back {
  background: none;
  border: none;
  cursor: pointer;
  color: black;
  padding: 4px 10px;
  border-radius: 5px;
  background-color: #f7ecdc;
}

/* 뒤로가기 버튼에 마우스 올리면 테이블 행 호버 색과 같게 */
.btn-back:hover {
background-color: #f2d8b1;
}

    </style>
  </head>

  <body class="m-0" style="background-color: #f7f0e9;">
     <c:choose>
    <c:when test="${rq.loginedTeam == null}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg12.png'); position: relative; cursor: url('/images/cursor0.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '한화 이글스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg21.png'); cursor: url('/images/cursor2.png') 25 25, auto; position: relative;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '두산 베어스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg22.png') cursor: url('/images/cursor3.png') 25 25, auto; position: relative;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '롯데 자이언츠'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg23.png') cursor: url('/images/cursor4.png') 25 25, auto; position: relative;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'LG 트윈스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg24.png'); cursor: url('/images/cursor5.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '삼성 라이온즈'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg25.png'); cursor: url('/images/cursor6.png') 25 25, auto; position: relative;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '키움 히어로즈'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg26.png'); cursor: url('/images/cursor7.png') 25 25, auto; position: relative;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'SSG 랜더스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg27.png'); cursor: url('/images/cursor1.png') 25 25, auto; position: relative;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'NC 다이노스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
         style="background-image: url('/images/bg28.png'); cursor: url('/images/cursor8.png') 25 25, auto; position: relative;" >
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KT 위즈'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg29.png'); cursor: url('/images/cursor9.png') 25 25, auto; position: relative;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KIA 타이거즈'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-white"
                 style="background-image: url('/images/bg30.png'); cursor: url('/images/cursor10.png') 25 25, auto; position: relative;">
    </c:when>
</c:choose>
      
      <!-- 연한 하늘색 오버레이 -->
      <div class="overlay"></div>

      <!-- 메인 컨텐츠 -->
      <div class="content-container text-black">
<div style="width: 80%; margin: 20px 0 0 0;">
  <h2 style="font-size: 3em; font-weight: bold; color: black; text-align: left;">${board.name}</h2>
</div>
        <%-- 페이지 정보 --%>
        <%
          int pageLimit = (int) request.getAttribute("pageLimit");
          int cpage = (int) request.getAttribute("cpage");
          int totalPageNumber = (int) request.getAttribute("totalPageNumber");
        %>

        <!-- 검색창 -->
        <form class="search_bar flex gap-2 items-center" action="../article/search" name="search_bar">
          <select name="search" id="search" class="text-black flex-1">
            <option selected value="1">제목</option>
            <option value="2">내용</option>
            <option value="3">닉네임</option>
          </select>
          <input type="text" name="keyword" class="flex-1 text-black p-1" />
        </form>

        <!-- 게시글 개수 -->
        <div class="left-controls flex items-center gap-4 mt-4 mb-2">
  <div>${articlesCount}개</div>
</div>

        <!-- 게시글 목록 -->
        <table class="shadow-md">
          <thead>
            <tr>
              <th>ID</th>
              <th>Registration Date</th>
              <th>Title</th>
              <th>Writer</th>
              <th>View</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="article" items="${articles}">
              <tr>
                <td>${article.id}</td>
                <td>${article.regDate.substring(0,10)}</td>
                <td>
                  <a class="hover:underline text-black-600" href="detail?id=${article.id}">${article.title}</a>
                </td>
                <td>${article.extra__writer}</td>
                <td>${article.view}</td>
              </tr>
            </c:forEach>

            <c:if test="${empty articles}">
              <tr>
                <td colspan="5">게시글이 없습니다</td>
              </tr>
            </c:if>
          </tbody>
        </table>

        <!-- 페이지네이션 -->
        <div class="pagination mt-4 text-center">
          <% 
          if(totalPageNumber <= pageLimit){
            for(int i = 1; i <= totalPageNumber; i++){ %>
              <a class="hover:underline" href="../article/list?boardId=${board.id}&page=<%=i%>"><%=i%></a>
          <% }
          } else {
            if(cpage < 6){
              for(int i = 1; i <= pageLimit; i++){ %>
                <a class="hover:underline" href="../article/list?boardId=${board.id}&page=<%=i%>"><%=i%></a>	
              <% } %>
              <a class="hover:underline" href="../article/list?boardId=${board.id}&page=<%=totalPageNumber%>">마지막</a>
            <% } else { %>
              <a class="hover:underline" href="../article/list?boardId=${board.id}&page=1">처음</a>
              <% if(cpage < totalPageNumber-4){
                for(int i = cpage-4; i <= cpage+4; i++){ %>
                  <a class="hover:underline" href="../article/list?boardId=${board.id}&page=<%=i%>"><%=i%></a>	
                <% } %>
                <a class="hover:underline" href="../article/list?boardId=${board.id}&page=<%=totalPageNumber%>">마지막</a>
              <% } else {
                for(int i = totalPageNumber-7; i <= totalPageNumber; i++){ %>
                  <a class="hover:underline" href="../article/list?boardId=${board.id}&page=<%=i%>"><%=i%></a>	
                <% }
              }
            }
          } %>
          
        </div>
                 <div class="left-controls flex items-center gap-4 mt-2 mb-4" style="justify-content:flex-start; text-align:left;">
  <button class="btn-back btn btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
  <c:if test="${rq.isLogined()}">
          <a class="btn-back btn btn-ghost" href="../article/write">글쓰기</a>
        </c:if>
</div>
      </div>
      
    </section>
  </body>
</html>