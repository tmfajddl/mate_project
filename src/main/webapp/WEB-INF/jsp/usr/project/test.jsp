<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
@import url("https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css");
* {
-webkit-font-smoothing: antialiased;
box-sizing: border-box;
}
html,
body {
margin: 0;
height: 100%;
}
/* a blue color as a generic focus style */
button:focus-visible {
outline: 2px solid #4a90e2 !important;
outline: -webkit-focus-ring-color auto 5px !important;
}

.screen {
    background-color: transparent;
    display: flex;
    flex-direction: row;
    justify-content: center;
    width: 100%;
}

.screen .div {
    overflow: hidden;
    background: linear-gradient(
        0deg,
        rgba(255, 255, 255, 1) 0%,
        rgba(255, 255, 255, 1) 100%
    );
    width: 1440px;
    height: 1024px;
    position: relative;
}

.screen .group {
    position: absolute;
    width: 614px;
    height: 554px;
    top: 182px;
    left: 15px;
}

.screen .overlap-group {
    position: relative;
    width: 612px;
    height: 554px;
    border-radius: 20px;
}

.screen .frame {
    display: flex;
    flex-direction: column;
    width: 612px;
    align-items: flex-start;
    gap: 10px;
    padding: 10px;
    position: absolute;
    top: 0;
    left: 0;
    background-color: #ffffff;
    border-radius: 20px;
}

.screen .image {
    position: relative;
    align-self: stretch;
    width: 100%;
    height: 564px;
    margin-top: -15.00px;
    margin-bottom: -15.00px;
    margin-left: -15.00px;
    margin-right: -15.00px;
    object-fit: cover;
}

.screen .rectangle {
    position: absolute;
    width: 525px;
    height: 154px;
    top: 346px;
    left: 36px;
    background-color: #ffffff;
    border-radius: 20px;
    opacity: 0.5;
}

.screen .text-wrapper {
    position: absolute;
    width: 487px;
    height: 104px;
    top: 375px;
    left: 56px;
    font-family: "Inter-Bold", Helvetica;
    font-weight: 700;
    color: #000000;
    font-size: 40px;
    text-align: center;
    letter-spacing: 2.00px;
    line-height: normal;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
}

.screen .overlap-wrapper {
    position: absolute;
    width: 596px;
    height: 181px;
    top: 791px;
    left: 25px;
}

.screen .overlap {
    position: relative;
    width: 592px;
    height: 181px;
}

.screen .frame-2 {
    display: inline-flex;
    align-items: center;
    gap: 52px;
    position: absolute;
    top: 0;
    left: 0;
}

.screen .rectangle-wrapper {
    position: relative;
    width: 267px;
    height: 181px;
}

.screen .rectangle-2 {
    height: 181px;
    background-color: #fffef8;
    border-radius: 20px;
    opacity: 0.7;
}

.screen .rectangle-3 {
    position: relative;
    width: 273px;
    height: 181px;
    background-color: #fffef8;
    border-radius: 20px;
    opacity: 0.7;
}

.screen .text-wrapper-2 {
    position: absolute;
    width: 196px;
    height: 95px;
    top: 25px;
    left: 40px;
    font-family: "Inter-Bold", Helvetica;
    font-weight: 700;
    color: #000000;
    font-size: 40px;
    text-align: center;
    letter-spacing: 2.00px;
    line-height: normal;
}

.screen .text-wrapper-3 {
    position: absolute;
    width: 196px;
    height: 95px;
    top: 25px;
    left: 355px;
    font-family: "Inter-Bold", Helvetica;
    font-weight: 700;
    color: #000000;
    font-size: 40px;
    text-align: center;
    letter-spacing: 2.00px;
    line-height: normal;
}

.screen .overlap-group-wrapper {
    position: absolute;
    width: 345px;
    height: 377px;
    top: 184px;
    left: 671px;
}

.screen .overlap-2 {
    position: relative;
    height: 377px;
    border-radius: 20px;
}

.screen .rectangle-4 {
    position: absolute;
    width: 345px;
    height: 377px;
    top: 0;
    left: 0;
    background-color: #fffef8;
    border-radius: 20px;
    opacity: 0.8;
}

.screen .frame-3 {
    display: flex;
    flex-direction: column;
    width: 290px;
    height: 320px;
    align-items: flex-start;
    gap: 19px;
    position: absolute;
    top: 32px;
    left: 25px;
}

.screen .img {
    position: relative;
    align-self: stretch;
    width: 100%;
    height: 172.87px;
    object-fit: cover;
}

.screen .rectangle-5 {
    position: relative;
    align-self: stretch;
    width: 100%;
    height: 87px;
}

.screen .component {
    display: flex;
    width: 246px;
    height: 71px;
    align-items: center;
    justify-content: center;
    gap: 10px;
    padding: 33px;
    position: absolute;
    top: 755px;
    left: 1139px;
    background-color: #ffffff;
    border-radius: 30px;
    border: 4px solid;
    border-color: #78a8df;
    opacity: 0.8;
}

.screen .button {
    all: unset;
    box-sizing: border-box;
    position: relative;
    width: fit-content;
    margin-top: -16.00px;
    margin-bottom: -8.00px;
    font-family: "Inter-Bold", Helvetica;
    font-weight: 700;
    color: #000000;
    font-size: 24px;
    text-align: center;
    letter-spacing: 1.20px;
    line-height: normal;
}

.screen .button-wrapper {
    display: flex;
    width: 246px;
    height: 71px;
    align-items: center;
    justify-content: center;
    gap: 10px;
    padding: 33px;
    position: absolute;
    top: 866px;
    left: 1139px;
    background-color: #ffffff;
    border-radius: 30px;
    border: 4px solid;
    border-color: #78a8df;
    opacity: 0.8;
}

.screen .rectangle-6 {
    position: absolute;
    width: 100px;
    height: 100px;
    top: -401px;
    left: 2767px;
}

.screen .header-wrapper {
    position: absolute;
    width: 1439px;
    height: 100px;
    top: -4px;
    left: 1px;
}

.screen .header {
    position: relative;
    width: 1439px;
    height: 100px;
    background-color: #78a8df;
    overflow: hidden;
}

.screen .logo-container {
    display: flex;
    width: 389px;
    height: 180px;
    align-items: center;
    justify-content: center;
    gap: 10px;
    padding: 50px 10px;
    position: absolute;
    top: -40px;
    left: 0;
}

.screen .logo {
    position: relative;
    width: 110px;
    margin-top: -6.00px;
    margin-bottom: -10.00px;
}

.screen .logo-text {
    position: relative;
    width: fit-content;
    font-family: "Inter-Bold", Helvetica;
    font-weight: 700;
    color: #ffffff;
    font-size: 48px;
    text-align: center;
    letter-spacing: 2.40px;
    line-height: normal;
}

.screen .navbar {
    display: flex;
    width: 890px;
    align-items: flex-start;
    gap: 10px;
    padding: 10px 30px;
    position: absolute;
    top: 14px;
    left: 500px;
}

.screen .link {
    position: relative;
    width: 206px;
    height: 53px;
    margin-top: -1.00px;
    font-family: "Inter-Bold", Helvetica;
    font-weight: 700;
    color: #ffffff;
    font-size: 24px;
    text-align: center;
    letter-spacing: 1.20px;
    line-height: normal;
}

.screen .link-2 {
    position: relative;
    width: 206px;
    height: 53px;
    margin-top: -1.00px;
    margin-right: -24.00px;
    font-family: "Inter-Bold", Helvetica;
    font-weight: 700;
    color: #ffffff;
    font-size: 24px;
    text-align: center;
    letter-spacing: 1.20px;
    line-height: normal;
}

.screen .div-wrapper {
    position: absolute;
    width: 349px;
    height: 355px;
    top: 627px;
    left: 671px;
}

.screen .overlap-3 {
    position: relative;
    width: 345px;
    height: 355px;
    border-radius: 20px;
}

.screen .rectangle-7 {
    position: absolute;
    width: 345px;
    height: 355px;
    top: 0;
    left: 0;
    background-color: #fffef8;
    border-radius: 20px;
    opacity: 0.8;
}

.screen .frame-4 {
    display: flex;
    flex-direction: column;
    width: 298px;
    height: 295px;
    align-items: flex-start;
    gap: 35px;
    position: absolute;
    top: 50px;
    left: 25px;
}

.screen .frame-5 {
    position: relative;
    align-self: stretch;
    width: 100%;
    height: 119px;
    overflow: hidden;
    overflow-x: scroll;
}

.screen .frame-5::-webkit-scrollbar {
    width: 0;
    display: none;
}

.screen .group-2 {
    position: absolute;
    width: 101px;
    height: 119px;
    top: 0;
    left: 0;
}

.screen .overlap-group-2 {
    position: relative;
    width: 95px;
    height: 119px;
    background-color: #d9d9d9;
    border-radius: 10px;
}

.screen .image-2 {
    position: absolute;
    width: 75px;
    height: 58px;
    top: 4px;
    left: 10px;
    object-fit: cover;
}

.screen .text-wrapper-4 {
    position: absolute;
    height: 15px;
    top: 85px;
    left: 5px;
    font-family: "Inter-Bold", Helvetica;
    font-weight: 700;
    color: #000000;
    font-size: 12px;
    letter-spacing: 0.60px;
    line-height: normal;
}

.screen .text-wrapper-5 {
    height: 15px;
    top: 70px;
    left: 5px;
    font-size: 12px;
    letter-spacing: 0.60px;
    position: absolute;
    font-family: "Inter-Bold", Helvetica;
    font-weight: 700;
    color: #000000;
    line-height: normal;
}

.screen .text-wrapper-6 {
    height: 15px;
    top: 100px;
    left: 5px;
    font-size: 12px;
    letter-spacing: 0.60px;
    position: absolute;
    font-family: "Inter-Bold", Helvetica;
    font-weight: 700;
    color: #000000;
    line-height: normal;
}

.screen .group-3 {
    position: absolute;
    width: 101px;
    height: 119px;
    top: 0;
    left: 106px;
}

.screen .group-4 {
    position: absolute;
    width: 101px;
    height: 119px;
    top: 0;
    left: 212px;
}

.screen .text-wrapper-7 {
    width: 80px;
    height: 26px;
    top: 182px;
    left: 25px;
    font-size: 20px;
    text-align: center;
    letter-spacing: 1.00px;
    position: absolute;
    font-family: "Inter-Bold", Helvetica;
    font-weight: 700;
    color: #000000;
    line-height: normal;
}

.screen .text-wrapper-8 {
    width: 80px;
    height: 26px;
    top: 19px;
    left: 25px;
    font-size: 20px;
    text-align: center;
    letter-spacing: 1.00px;
    position: absolute;
    font-family: "Inter-Bold", Helvetica;
    font-weight: 700;
    color: #000000;
    line-height: normal;
}

</style>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta charset="utf-8" />
        <link rel="stylesheet" href="globals.css" />
        <link rel="stylesheet" href="style.css" />
    </head>
    <body>
        <div class="screen">
            <div class="div">
                <div class="group">
                    <div class="overlap-group">
                        <div class="frame"><img class="image" src="img/image-5.svg" /></div>
                        <div class="rectangle"></div>
                        <p class="text-wrapper">10 경기 연속 안타 기록..그의 기록은 어디까지 인가</p>
                    </div>
                </div>
                <div class="overlap-wrapper">
                    <div class="overlap">
                        <div class="frame-2">
                            <div class="rectangle-wrapper"><div class="rectangle-2"></div></div>
                            <a href="" target="_blank" rel="noopener noreferrer"><div class="rectangle-3"></div></a>
                        </div>
                        <div class="text-wrapper-2">추천 굿즈 보러가기</div>
                        <div class="text-wrapper-3">오픈 톡방 참여하기</div>
                    </div>
                </div>
                <div class="overlap-group-wrapper">
                    <div class="overlap-2">
                        <div class="rectangle-4"></div>
                        <div class="frame-3">
                            <img class="img" src="img/rectangle-54.png" /> <img class="rectangle-5" src="img/rectangle-55.png" />
                        </div>
                    </div>
                </div>
                <div class="component"><button class="button">로그인</button></div>
                <div class="button-wrapper"><button class="button">회원가입</button></div>
                <img class="rectangle-6" src="img/rectangle-56.svg" />
                <div class="header-wrapper">
                    <header class="header">
                        <div class="logo-container">
                            <img class="logo" src="img/logo.svg" /> <a href="index.html"><div class="logo-text">응원메이트</div></a>
                        </div>
                        <div class="navbar">
                            <div class="link">응원</div>
                            <div class="link">정보</div>
                            <div class="link">게시판</div>
                            <div class="link-2">회원</div>
                        </div>
                    </header>
                </div>
                <div class="div-wrapper">
                    <div class="overlap-3">
                        <div class="rectangle-7"></div>
                        <div class="frame-4">
                            <div class="frame-5">
                                <div class="group-2">
                                    <div class="overlap-group-2">
                                        <img class="image-2" src="img/image-6.svg" />
                                        <div class="text-wrapper-4">소속팀:</div>
                                        <div class="text-wrapper-5">이름:</div>
                                        <div class="text-wrapper-6">포지션:</div>
                                    </div>
                                </div>
                                <div class="group-3">
                                    <div class="overlap-group-2">
                                        <img class="image-2" src="img/image-3.svg" />
                                        <div class="text-wrapper-4">소속팀:</div>
                                        <div class="text-wrapper-5">이름:</div>
                                        <div class="text-wrapper-6">포지션:</div>
                                    </div>
                                </div>
                                <div class="group-4">
                                    <div class="overlap-group-2">
                                        <img class="image-2" src="img/image-4.svg" />
                                        <div class="text-wrapper-4">소속팀:</div>
                                        <div class="text-wrapper-5">이름:</div>
                                        <div class="text-wrapper-6">포지션:</div>
                                    </div>
                                </div>
                            </div>
                            <div class="frame-5">
                                <div class="group-2">
                                    <div class="overlap-group-2">
                                        <img class="image-2" src="img/image-7.svg" />
                                        <div class="text-wrapper-4">소속팀:</div>
                                        <div class="text-wrapper-5">이름:</div>
                                        <div class="text-wrapper-6">포지션:</div>
                                    </div>
                                </div>
                                <div class="group-3">
                                    <div class="overlap-group-2">
                                        <img class="image-2" src="img/image-2.svg" />
                                        <div class="text-wrapper-4">소속팀:</div>
                                        <div class="text-wrapper-5">이름:</div>
                                        <div class="text-wrapper-6">포지션:</div>
                                    </div>
                                </div>
                                <div class="group-4">
                                    <div class="overlap-group-2">
                                        <img class="image-2" src="img/image.svg" />
                                        <div class="text-wrapper-4">소속팀:</div>
                                        <div class="text-wrapper-5">이름:</div>
                                        <div class="text-wrapper-6">포지션:</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-wrapper-7">1군 말소</div>
                        <div class="text-wrapper-8">1군 등록</div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
