<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <style>
    /* 연한 하늘색 오버레이 */
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
      background-color: #d0e7f9;
    }

    /* 버튼에 마우스 올리면 테이블 행 호버 색과 같게 */
    .btn-back:hover {
      background-color: #4a90e2;
    }

    /* 작성 버튼 오른쪽 정렬 */
    .submit-container {
      text-align: right;
      margin-top: 10px;
    }
  </style>
</head>

<body style="margin:0; height:100vh; background-image: url('/images/bg.jpg'); background-size: cover; background-position: center; position: relative;">

  <!-- 연한 하늘색 오버레이 -->
  <div class="overlay"></div>

  <!-- 내용 컨테이너 -->
  <section class="content-container text-black">
    <div>
      <form action="../article/doWrite" method="POST">
        <table>
          <tbody>
            <tr>
              <th>게시판</th>
              <td>
                <select name="boardId" required>
                  <option value="" selected disabled>게시판을 선택해주세요</option>
                  <option value="1">공지사항</option>
                  <option value="2">자유</option>
                  <option value="3">QnA</option>
                </select>
              </td>
            </tr>
            <tr>
              <th>제목</th>
              <td>
                <input class="input input-info input-sm" required name="title" type="text" autocomplete="off" placeholder="제목" />
              </td>
            </tr>
            <tr>
              <th>내용</th>
              <td>
                <input class="input input-info input-sm" required name="body" type="text" autocomplete="off" placeholder="내용" />
              </td>
            </tr>
          </tbody>
        </table>

        <!-- 작성 버튼 오른쪽 정렬 -->
        <div class="submit-container">
          <button class="btn-back btn btn-ghost btn-sm" type="submit">작성</button>
        </div>
      </form>

      <!-- 뒤로가기 버튼 -->
      <div class="btns mt-4">
        <button class="btn-back btn btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
      </div>
    </div>
  </section>

  <%@ include file="../common/foot.jspf"%>
</body>
</html>