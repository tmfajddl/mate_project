<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/toastUiEditorLib.jspf"%>

<script type="text/javascript">
	function ArticleWrite__submit(form) {
		form.title.value = form.title.value.trim();

		if (form.title.value.length == 0) {
			alert('제목 써');
			return;
		}

		const editor = $(form).find('.toast-ui-editor').data(
				'data-toast-editor');
		const markdown = editor.getMarkdown().trim();

		if (markdown.length == 0) {
			alert('내용 써');
			return;
		}

		form.body.value = markdown;
		form.submit();
	}
</script>

<link href="https://cdn.jsdelivr.net/gh/projectnoonnu/2411-3@1.0/index.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="ko">
<head>
  <style>
  body {
  font-family: 'Ownglyph_ParkDaHyun', sans-serif;
}
    /* 연한 하늘색 오버레이 */
    .overlay {
      background-color: rgba(247, 246, 245, 0.6);
      position: absolute;
      top: 0; left: 0;
      width: 100%; height: 100%;
      z-index: 0;
    }

    /* 흰색 배경 박스, 둥근 모서리, 그림자, 앞으로 올라오기 */
    .content-box {
      position: relative;
      z-index: 1;
      width: 100%;
      margin: 0 auto 10% auto;
      padding: 20px;

      border-radius: 12px;
      box-shadow: 0 0 12px rgba(0,0,0,0.15);
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
      background-color: #f7f0e9;
      color: black;
      outline: none;
    }

    input.input:focus {
      border-color: #f2d8b1;
      background-color: #fff;
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

    .btn-back:hover {
      background-color: #f2d8b1;
    }

    /* 작성 버튼 오른쪽 정렬 */
    .submit-container {
      text-align: right;
      margin-top: 10px;
    }

    /* 뒤로가기 버튼 간격 */
    .btns {
      margin-top: 10px;
      text-align: left;
    }
  </style>
</head>

<body class="m-0" style="background-color: #f7f0e9;">
  
  <!-- 배경 이미지 및 팀별 배경 설정 -->
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

  <!-- 연한 하늘색 오버레이 -->
  <div class="overlay"></div>
 
    <div style="width: 80%; margin: 20px auto 0 auto;">
  <h2 style="font-size: 3em; font-weight: bold; color: black; text-align: center;">글쓰기</h2>
</div>
  <!-- 흰색 박스: 폼 + 뒤로가기 버튼 -->
  <div class="content-box">
    <form onsubmit="ArticleWrite__submit(this); return false;" action="../article/doWrite" method="POST">
			<input type="hidden" name="body" />
      <table>
        <tbody>
          <tr>
            <th>게시판</th>
            <td>
              <select name="boardId" required>
                <option value="" selected disabled>게시판을 선택해주세요</option>
                <option value="1">자유게시판</option>
                <option value="2">분실물</option>
              </select>
            </td>
          </tr>
          <tr>
            <th>제목</th>
            <td>
              <input class="input" required name="title" type="text" autocomplete="off" placeholder="제목" />
            </td>
          </tr>
          <tr>
  <th>내용</th>
  <td>
    <div class="toast-ui-editor">
      <script type="text/x-template">
        
      </script>
    </div>
  </td>
</tr>
        </tbody>
      </table>

      <div class="submit-container">
        <button class="btn-back btn btn-ghost btn-sm" type="submit">작성</button>
      </div>
    </form>

    <div class="btns mt-4">
      <button class="btn-back btn btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
    </div>
  </div>

  <%@ include file="../common/foot.jspf"%>
</body>
</html>