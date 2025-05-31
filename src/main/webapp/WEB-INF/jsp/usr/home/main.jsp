<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jspf"%>
<!DOCTYPE html>
<html lang="en">

  <body class="m-0 h-full font-sans">

    <!-- Hero Section (100% 화면 채움 + 배경 이미지) -->
    <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-white" style="background-image: url('/images/bg.jpg');">
    
    <c:if test="${!rq.isLogined()}">
              <button class="mt-2 px-2 py-2 bg-blue-500 hover:bg-blue-600 rounded text-white font-semibold transition w-48" class="btn btn-ghost"><a href="../member/login">로그인</a></button>
              <button class="mt-2 px-2 py-2 bg-blue-500 hover:bg-blue-600 rounded text-white font-semibold transition w-48" class="btn btn-ghost">회원가입</a></button>
            </c:if>
                <c:if test="${rq.isLogined()}">
              <button class="mt-2 px-2 py-2 bg-blue-500 hover:bg-blue-600 rounded text-white font-semibold transition w-48" class="btn btn-ghost"><a onclick="if(confirm('로그아웃 하시겠습니까?') == false) return false;" href="../member/doLogout">로그아웃</a></button>
            </c:if>
    </section>

  </body>
</html>