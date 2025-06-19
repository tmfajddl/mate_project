<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>야구 포지션 한눈에 보기</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen flex flex-col items-center p-4">

  <h1 class="text-3xl font-bold mb-6">야구 포지션 한눈에 보기</h1>

  <div class="flex flex-col md:flex-row w-full max-w-screen-xl mx-auto gap-6 justify-center">

<!-- 이미지와 포지션 버튼 영역 -->
<div class="relative" style="width: 40vw; min-width: 320px;">
  <img src="/images/base.jpg" alt="야구장" class="w-full h-auto rounded-lg shadow" />

  <!-- 2루수 -->
  <button id="pos-2b" class="absolute bg-red-500 w-8 h-8 rounded-full border-2 border-white"
    style="top: 50%; left: 60%; transform: translate(-50%, -50%)" title="투수"></button>

  <!-- 우익수 -->
  <button id="pos-rf" class="absolute bg-red-200 w-8 h-8 rounded-full border-2 border-white"
    style="top: 35%; left: 80%; transform: translate(-50%, -50%)" title="좌익수"></button>

  <!-- 중견수 -->
  <button id="pos-cf" class="absolute bg-pink-600 w-8 h-8 rounded-full border-2 border-white"
    style="top: 25%; left: 50%; transform: translate(-50%, -50%)" title="중견수"></button>

  <!-- 좌익수 -->
  <button id="pos-lf" class="absolute bg-purple-500 w-8 h-8 rounded-full border-2 border-white"
    style="top: 35%; left: 25%; transform: translate(-50%, -50%)" title="우익수"></button>

  <!-- 포수 -->
  <button id="pos-c" class="absolute bg-blue-500 w-8 h-8 rounded-full border-2 border-white"
    style="top: 78%; left: 50%; transform: translate(-50%, -50%)" title="포수"></button>

  <!-- 1루수 -->
  <button id="pos-1b" class="absolute bg-green-500 w-8 h-8 rounded-full border-2 border-white"
    style="top: 64%; left: 65%; transform: translate(-50%, -50%)" title="1루수"></button>

  <!-- 3루수 -->
  <button id="pos-3b" class="absolute bg-blue-200 w-8 h-8 rounded-full border-2 border-white"
    style="top: 64%; left: 35%; transform: translate(-50%, -50%)" title="3루수"></button>

  <!-- 투수 -->
  <button id="pos-p" class="absolute bg-yellow-500 w-8 h-8 rounded-full border-2 border-white"
    style="top: 63%; left: 50%; transform: translate(-50%, -50%)" title="2루수"></button>

<!-- 유격수 -->
  <button id="pos-ss" class="absolute bg-yellow-500 w-8 h-8 rounded-full border-2 border-white"
    style="top: 50%; left: 40%; transform: translate(-50%, -50%)" title="유격수"></button>
</div>

    <!-- 우측: 포지션 설명 -->
    <div class="bg-white rounded-lg shadow p-6 min-h-[320px]" style="width: 40vw; min-width: 320px;">
      <h2 id="pos-title" class="text-2xl font-semibold mb-4 text-center text-gray-700">포지션을 선택하세요</h2>
      <p id="pos-desc" class="text-gray-600 text-center px-2">
        야구장에서 각 포지션 버튼을 눌러 기본 역할을 확인해보세요.
      </p>
    </div>
  </div>

  <script>
    const descriptions = {
      p: {
        title: "투수 (Pitcher)",
        desc: "경기에서 공을 던지는 선수로, 경기를 주도하고 아웃을 잡는 역할을 합니다.",
      },
      c: {
        title: "포수 (Catcher)",
        desc: "투수가 던진 공을 받고 작전을 지시하며, 수비를 조율하는 역할을 합니다.",
      },
      '1b': {
        title: "1루수 (First Baseman)",
        desc: "1루를 지키며 타자가 친 공을 잡거나 주자를 아웃시키는 역할을 합니다.",
      },
      '2b': {
        title: "2루수 (Second Baseman)",
        desc: "2루 주변을 수비하며 빠른 동작으로 타구를 처리합니다.",
      },
      '3b': {
        title: "3루수 (Third Baseman)",
        desc: "3루를 지키며 강한 타구를 처리하는 역할을 합니다.",
      },
      ss: {
        title: "유격수 (Shortstop)",
        desc: "1루와 2루 사이를 수비하며 가장 많은 움직임이 필요한 포지션입니다.",
      },
      lf: {
        title: "좌익수 (Left Fielder)",
        desc: "외야의 좌측을 지키며 타구를 잡아내는 역할을 합니다.",
      },
      cf: {
        title: "중견수 (Center Fielder)",
        desc: "외야 중앙을 수비하며 넓은 범위를 커버합니다.",
      },
      rf: {
        title: "우익수 (Right Fielder)",
        desc: "외야 우측을 맡아 강한 송구를 하는 역할입니다.",
      }
    };

    // 각 버튼에 이벤트 붙이기
   document.querySelectorAll("button[id^='pos-']").forEach(button => {
  button.addEventListener("click", () => {
    const id = button.id.replace("pos-", "");
    const info = descriptions[id];
    if (info) {
      document.getElementById("pos-title").textContent = info.title;
      document.getElementById("pos-desc").textContent = info.desc;
    }
  });
});
  </script>
</body>
</html>