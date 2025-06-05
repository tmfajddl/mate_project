<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jspf"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
  .menu2 {
    display: flex;
    flex-direction: row;
    justify-content: end;
    width: 70%;
    height: 80px;
    margin: 0;
    padding: 0;
  }
  .menu2 > :nth-child(2) {
    width: 20%;
    height: 100%;
    border: 2px solid #f2d8b1;
    border-bottom: none;
    border-radius: 10px 10px 0 0;
  }
  .menu2 > div {
    width: 20%;
    height: 100%;
    border: 2px solid #f2d8b1;
    border-radius: 10px 10px 0 0;
  }
  .body {
    border-radius: 10px 0 10px 10px;
    width: 70%;
    height: 60%;
    display: flex;
    gap: 20px;
  }

  .btn-back {
    background: none;
    border: none;
    cursor: pointer;
    color: inline-block;
    padding: 4px 10px;
    border-radius: 5px;
    background-color: #f7ecdc;
  }
  .btn-back:hover {
    background-color: #f2d8b1;
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
  .news-list {
    width: 70%;
    max-height: 80%; /* 스크롤 가능 */
    overflow-y: auto;
    padding-right: 10px; /* 스크롤바 겹침 방지 */
  }
  .news-item {
    border-bottom: 1px solid #f7ecdc;
    padding: 5px 0;
  }
  .news-title {
    font-size: 0.85rem;
    margin: 0;
    color: #000;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  .news-body {
    font-size: 0.75rem;
    margin: 0;
    color: #333;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
</style>
</head>

<body class="m-0 h-full font-sans" style="background-color: #f7f0e9;">
 <c:choose>
    <c:when test="${rq.loginedTeam == null}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg12.png') 25 25;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '한화 이글스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg21.png'); cursor: url('/images/cursor2.png') 25 25, auto;">
    </c:when>
    <c:when test="${rq.loginedTeam eq '두산 베어스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg22.png') cursor: url('/images/cursor3.png') 25 25, auto;;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '롯데 자이언츠'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg23.png') cursor: url('/images/cursor4.png') 25 25, auto;;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'LG 트윈스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg24.png'); cursor: url('/images/cursor5.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '삼성 라이온즈'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg25.png'); cursor: url('/images/cursor6.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq '키움 히어로즈'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg26.png'); cursor: url('/images/cursor7.png') , auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'SSG 랜더스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg27.png'); cursor: url('/images/cursor1.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'NC 다이노스'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
         style="background-image: url('/images/bg28.png'); cursor: url('/images/cursor8.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KT 위즈'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black"
                 style="background-image: url('/images/bg29.png'); cursor: url('/images/cursor9.png') 25 25, auto;">
    </c:when>
        <c:when test="${rq.loginedTeam eq 'KIA 타이거즈'}">
        <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-white"
                 style="background-image: url('/images/bg30.png'); cursor: url('/images/cursor10.png') 25 25, auto;">
    </c:when>
</c:choose>

  <div class="menu2">
    <div style="background-color: rgb(242, 247, 247);"><a href="../project/information">날씨/준비물</a></div>
    <div style="background-color: rgb(242, 247, 247);"><a href="../project/information2">최근경기순위</a></div>
    <div style="background-color: rgb(242, 247, 247);"><a href="../project/information3">주변 맛집</a></div>
  </div>

  <div class="body" style="background-color: rgb(242, 247, 247); padding: 20px;">
    <!-- 왼쪽: 팀 순위 -->
    <div style="flex: 1;">
      <h2 style="margin-bottom: 1rem;">팀 순위</h2>
      <table style="border-collapse: collapse; width: auto;">
        <tbody>
          <c:forEach var="row" items="${rankings}">
            <tr style="
                display: flex;
                align-items: center;
                border-bottom: 2px solid #f2d8b1;
                width: 100%;
                margin-bottom: 5px;">
              <td style="flex: 0 0 auto;">
                <div style="
                    display: inline-flex;
                    justify-content: center;
                    align-items: center;
                    width: 30px;
                    height: 30px;
                    border-radius: 50%;
                    background-color: #f2d8b1;
                    font-size: 0.85rem;
                    color: #000;
                    overflow: hidden;
                    text-align: center;">
                  ${row[0]}
                </div>
              </td>
              <td style="
                  flex: 1;
                  padding-left: 10px;
                  font-size: 0.9rem;
                  text-align: left;
                  white-space: nowrap;
                  overflow: hidden;
                  text-overflow: ellipsis;">
                ${row[1]}
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>

    <!-- 오른쪽: 속보 뉴스 (이미지 없이, 스크롤 가능) -->
    <div style="flex: 1;">
      <h2 style="margin-bottom: 1rem;">KBO 속보 뉴스</h2>
      <div class="news-list">
        <c:forEach var="news" items="${breakingNews}">
          <div class="news-item" style="border-bottom: 1px solid #f2d8b1; padding: 5px 0;">
            <a href="${news.linkUrl}" target="_blank" style="
                font-size: 0.85rem;
                margin: 0;
                color: #000;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                text-decoration: none;
                display: block;">
              ${news.title}
            </a>
            <p class="news-body" style="
                font-size: 0.75rem;
                margin: 0;
                color: #333;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                width: 100%;
                box-sizing: border-box;">
              ${news.body}
            </p>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>

  <div class="left-controls flex items-center gap-4 mt-2 mb-4" style="justify-content:flex-start; text-align:left;">
    <button class="btn-back btn btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
  </div>
</section>
</body>
</html>



