<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/head.jspf"%>

<style>
  /* 배경에 연한 하늘색 반투명 오버레이 */
  .overlay {
    background-color: rgba(173, 216, 230, 0.6); /* 연한 하늘색 */
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 0;
  }

  /* 내용 컨테이너 */
  .content-container {
    position: relative;
    z-index: 1;
    width: 100%;
    max-width: 800px;
    padding: 20px;
    margin: 10% auto;
    overflow-y: auto;
    background-color: white;
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
    background-color: #d0e7f9;
  }

  /* input 스타일 */
  input.input {
    width: 90%;
    padding: 6px 8px;
    border-radius: 6px;
    border: 1px solid #bbb;
  }

  /* 버튼 스타일 */
    .btn-back {
  background: none;
  border: none;
  cursor: pointer;
  color: black;
  padding: 4px 10px;
  border-radius: 5px;
  background-color: #82c3f5;
}

/* 뒤로가기 버튼에 마우스 올리면 테이블 행 호버 색과 같게 */
.btn-back:hover {
background-color: #4a90e2;
}
</style>

<body style="margin:0; height:100vh; background-image: url('/images/bg.jpg'); background-size: cover; background-position: center; position: relative;">

  <!-- 연한 하늘색 오버레이 -->
  <div class="overlay"></div>

  <section class="content-container text-black">
    <div>
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
                <input class="input input-info input-sm" required="required" name="title" value="${article.title}" type="text" autocomplete="off" placeholder="새 제목" />
              </td>
            </tr>
            <tr>
              <th>Body</th>
              <td>
                <input class="input input-info input-sm" required="required" name="body" value="${article.body}" type="text" autocomplete="off" placeholder="새 내용" />
              </td>
            </tr>
          </tbody>
        </table>
        <div style="text-align: right; margin-top: 8px;">
  <button class="btn-back btn btn-ghost" type="submit">수정</button>
</div>
      </form>

      <div class="btns mt-4">
        <button class="btn-back btn btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
        <c:if test="${article.userCanDelete}">
          <a class="btn-back btn btn-ghost" href="../article/doDelete?id=${article.id}">삭제</a>
        </c:if>
      </div>
    </div>
    </div>
  </section>

</body>
