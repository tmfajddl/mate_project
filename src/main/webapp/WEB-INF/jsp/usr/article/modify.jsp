<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="https://cdn.jsdelivr.net/gh/projectnoonnu/2411-3@1.0/index.css" rel="stylesheet">
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/toastUiEditorLib.jspf"%>

<style>
body {
  font-family: 'Ownglyph_ParkDaHyun', sans-serif;
}
        /* 배경 흐림 오버레이 */
        section {
            min-height: 100vh;
            position: relative;
            z-index: 0;
        }
        .section-overlay {
            position: absolute;
            inset: 0;
            background-color: rgba(255, 255, 255, 0.4);
            z-index: 1;
        }
        section > *:not(.section-overlay) {
            position: relative;
            z-index: 2;
        }

  /* 내용 컨테이너 */
  .content-container {
    position: relative;
    z-index: 1;
    width: 100%;
    max-width: 100%;
    padding: 20px;
    margin: 0 auto 10% auto;
    overflow-y: auto;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
  }

  /* 테이블 스타일 */
  table {
    width: 100%;
    border-collapse: collapse;
    border-radius: 10px;
    overflow: hidden;
  }

  th, td {
    text-align: center;
    padding: 10px;
  }

  th {
    background-color: #f7ecdc;
  }

  /* input 통일 스타일 */
  input.input {
    width: 90%;
    box-sizing: border-box;
    padding: 6px 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #f7f0e9; /* 배경색 통일 */
    color: black; /* 글자색 통일 */
    outline: none;
  }

  input.input:focus {
    border-color: #f2d8b1; /* 포커스 시 테두리 색상 */
    background-color: #fff; /* 포커스 시 배경색 살짝 밝게 */
  }

  /* 버튼 스타일 */
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
                 style="background-image: url('/images/bg24.png'); cursor: url('/images/cursor5.png') 25 25, auto; position: relative;">
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
         style="background-image: url('/images/bg28.png'); cursor: url('/images/cursor8.png') 25 25, auto; position: relative;">
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

    <!-- 오버레이: 모든 배경 위에 고정 -->
    <div class="section-overlay"></div>
    
        <div style="width: 80%; margin: 20px auto 0 auto;">
  <h2 style="font-size: 3em; font-weight: bold; color: black; text-align: center;">${article.title} 게시글 수정하기</h2>
</div>

    <!-- 내용 컨테이너 -->
    <div class="content-container">
      <form action="../article/doModify" method="POST">
        <input type="hidden" name="id" value="${article.id}" />
        <table>
          <tbody>
            <tr>
              <th>ID</th>
              <td>${article.id}</td>
            </tr>
            <tr>
              <th>Registration Date</th>
              <td>${article.regDate}</td>
            </tr>
            <tr>
              <th>Update Date</th>
              <td>${article.updateDate}</td>
            </tr>
            <tr>
              <th>Writer</th>
              <td>${article.extra__writer}</td>
            </tr>
            <tr>
              <th>Title</th>
              <td>
                <input class="input" required="required" name="title" value="${article.title}" type="text" autocomplete="off" placeholder="새 제목" />
              </td>
            </tr>
            <tr>
  <th>Body</th>
  <td>
    <textarea id="body" name="body" style="display:none;">${article.body}</textarea>
    <div id="editor"></div>
  </td>
</tr>

<script>
  const editor = new toastui.Editor({
    el: document.querySelector('#editor'),
    height: '400px',
    initialEditType: 'markdown',
    previewStyle: 'vertical',
    initialValue: `${article.body}`
  });

  document.querySelector('form').addEventListener('submit', function(e) {
    document.querySelector('#body').value = editor.getMarkdown();
  });
</script>
          </tbody>
        </table>
        <div style="text-align: right; margin-top: 8px;">
          <button class="btn-back" type="submit">수정</button>
        </div>
      </form>

      <div class="btns mt-4" style="margin-top: 10px;">
        <button class="btn-back" type="button" onclick="history.back();">뒤로가기</button>
        <c:if test="${article.userCanDelete}">
          <a class="btn-back" href="../article/doDelete?id=${article.id}">삭제</a>
        </c:if>
      </div>
    </div>

  </section>

</body>