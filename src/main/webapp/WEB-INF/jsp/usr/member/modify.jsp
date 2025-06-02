<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html lang="en">
<style>
  option {
    background-color: rgba(242, 247, 247, 0.8);
  }
  option:hover {
    background-color: #79afe8;
  }
  .btn-back {
    background: none;
    border: none;
    cursor: pointer;
    color: black;
    padding: 4px 10px;
    border-radius: 5px;
    background-color: #82c3f5;
  }
  .btn-back:hover {
    background-color: #4a90e2;
  }
</style>

<body class="m-0 h-full font-sans">

  <section class="h-screen bg-cover bg-center bg-no-repeat bg-fixed flex flex-col items-center justify-center text-black" style="background-image: url('/images/bg.jpg');">

    <div style="width: 35%; border-radius: 10px; background-color: rgba(242, 247, 247, 0.8); padding: 15px; border: 3px dashed red;">
      <div class="text-center text-2xl font-bold mb-4">회원정보 수정</div>
      
      <!-- 수정: enctype="multipart/form-data" 추가 -->
      <form action="../member/doModify" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${member.id}" />
        
        <!-- 프로필 이미지 표시 -->
        <div class="mb-4 flex justify-center">
  <c:if test="${not empty member.profileImg}">
    <img id="previewImg" src="${member.profileImg}" style="width: 100px; height: 100px; border-radius: 50%; object-fit: cover; border: 2px solid #555;">
  </c:if>
  <c:if test="${empty member.profileImg}">
    <img id="previewImg" src="/images/ball.jpg" style="width: 100px; height: 100px; border-radius: 50%; object-fit: cover; border: 2px solid #555;">
  </c:if>
</div>

<script>
  function previewProfileImage(input) {
    if (input.files && input.files[0]) {
      const reader = new FileReader();

      reader.onload = function(e) {
        document.getElementById('previewImg').src = e.target.result;
      };

      reader.readAsDataURL(input.files[0]);
    }
  }
</script>
        
        <!-- 이미지 업로드 input -->
        <div class="text-center mb-4">
          <input type="file" name="profileImgFile" accept="image/*" onchange="previewProfileImage(this)" />
        </div>
        

        <table class="table" cellpadding="5" style="width: 90%; color: black; margin: 0 auto;">
          <tbody style="text-align: center;">
            <tr>
              <th>ID</th>
              <td>${member.id}</td>
            </tr>
            <tr>
              <th>가입일</th>
              <td>${member.regDate}</td>
            </tr>
            <tr>
              <th>수정일</th>
              <td>${member.updateDate}</td>
            </tr>
            <tr>
              <th>아이디</th>
              <td>${member.loginId}</td>
            </tr>
            <tr>
              <th>새 비밀번호</th>
              <td>
                <input class="input input-info input-sm w-full" required name="loginPw" value="${member.loginPw }" type="password" autocomplete="off" placeholder="새 비밀번호" />
              </td>
            </tr>
            <tr>
              <th>새 비밀번호 확인</th>
              <td>
                <input class="input input-info input-sm w-full" required name="loginPw2" type="password" autocomplete="off" placeholder="새 비밀번호 확인" />
              </td>
            </tr>
            <tr>
              <th>이름</th>
              <td>${member.name}</td>
            </tr>
            <tr>
              <th>성별</th>
              <td>${member.gender}</td>
            </tr>
            <tr>
              <th>응원팀</th>
              <td>${member.team}</td>
            </tr>
            <tr>
              <th>새 닉네임</th>
              <td>
                <input class="input input-info input-sm w-full" required name="nickname" value="${member.nickname }" type="text" autocomplete="off" placeholder="새 닉네임" />
              </td>
            </tr>
            <tr>
              <th>새 전화번호</th>
              <td>
                <input class="input input-info input-sm w-full" required name="cellphoneNum" value="${member.cellphoneNum }" type="tel" autocomplete="off" placeholder="새 전화번호" />
              </td>
            </tr>
            <tr>
              <th>새 이메일</th>
              <td>
                <input class="input input-info input-sm w-full" required name="email" value="${member.email }" type="email" autocomplete="off" placeholder="새 이메일" />
              </td>
            </tr>
            <tr>
              <th>자기소개</th>
              <td>
                <input class="input input-info input-sm w-full" required name="introduce" value="${member.introduce }" type="text" autocomplete="off" placeholder="자기소개" />
              </td>
            </tr>
            <tr>
              <th></th>
              <td>
                <button type="submit" class="btn-back btn btn-ghost btn-xs">수정</button>
              </td>
            </tr>
          </tbody>
        </table>
      </form>
    </div>
    
    <div class="text-center mt-4">
      <button class="btn-back btn btn-ghost" type="button" onclick="history.back()">뒤로가기</button>
      <a href="../member/doDelete?id=${member.id}" class="btn-back btn btn-ghost">삭제</a>
    </div>

  </section>

<%@ include file="../common/foot.jspf"%>
</body>
</html>