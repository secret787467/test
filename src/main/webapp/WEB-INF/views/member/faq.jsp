<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MINTABLE</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@300&display=swap" rel="stylesheet">
    <script src="/config.js"></script>
    <script src="/mintScript.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bignumber.js/8.0.2/bignumber.js"
        integrity="sha512-XQDG6H87RgMf+aNFwDPCUcFwUf3t9liyqN/2BkJ8KGixupbjPwQHNhypNA972mLIkg4KPo4lkGmqAf3yfDz8hw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <style>
        #page {
            margin-left: 50px;
            margin-right: 50px;
            text-align: center;
        }
        
        body {
            font-family: 'Roboto', sans-serif;
            /* display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh; */
            background-color: #120c18;
            color: white;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .but {
            display: flex;
            align-items: center;
            position: relative;
            top: 30px;
            left: 30px;
            transition: .5s;
        }

        .marterial-icons {
            font-size: 3rem;
            margin-right: 10px;
        }

        .bookmark-btt {
            border: none;
            outline: none;
            background-color: transparent;
            font-size: 3rem;
            color: white;
            cursor: pointer;
        }

        section {
            background-color: #34495e;
            color: #fff;
            width: 200px;
            padding-top: 30px;
            padding-left: 30px;
            position: absolute;
            top: 0;
            left: -200px;
            bottom: 0;
            transition: 1s ease;
        }

        .bookmark-lists {
            padding-left: 0px;
        }

        .bookmark {
            margin: 30px 0;
        }

        .bookmark:nth-child(1) {
            margin-top: 50px;
        }

        .bookmark a {
            color: #fff;
            text-decoration: none;
        }

        ul {
            list-style: none;
            padding-left: 0px;
        }

        /* 클래스 3개 */
        .accordion-list .accordion-item .title[data-v-7c67ff0b] {
            position: relative;
            width: 60%;
            display: flex;
            align-items: center;
            text-align: left;
            font-size: 26px;
            line-height: 28px;
            padding: 45px 84px 45px 40px;
            border-radius: 40px;
            color: #000;
            background: #fff;
            font-weight: 700;
            white-space: nowrap;
            flex-direction: row;
            margin: auto;
        }

        ::after,
        ::before {
            box-sizing: inherit;
            padding: 0;
            margin: 0;
        }

        .accordion-list .accordion-item .title[data-v-7c67ff0b]:before {
            content: "";
            display: inline-block;
            width: 44px;
            height: 44px;
            background: url(https://upload.wikimedia.org/wikipedia/commons/8/84/NYCS-bull-trans-Q.svg) 50% no-repeat;
            margin-right: 10px;
        }

        .accordion-list .accordion-item .title[data-v-7c67ff0b]:after {
            content: "";
            display: block;
            position: absolute;
            top: 39px;
            right: 40px;
            width: 44px;
            height: 44px;
            background: url(pngwing.com.png) no-repeat 50%;
            will-change: transform;
            transition: all .3s ease-in;
        }

        .accordion-list .accordion-item .title.active[data-v-7c67ff0b]:after {
            transform: rotate(180deg);
            top: 35px;
        }

        .faq {
            font-size: 3rem;
            font-weight: bold;
        }
    </style>

</head>

<body style="overflow-x: hidden">

    <main>
 		<label class="but"> <span class="material-icons">reorder</span>
            <input type="image" src="/logo.png" width="250px" height="50px" alt="제출버튼" class="bookmark-btt">
            <!-- <input type="button" value="MINTABLE" class="bookmark-btt"> -->
        </label>
        <section style="z-index: 1;">
            <br>
            <h1>MINTABLE</h1>
            <ul class="bookmark-lists">
               <li class="bookmark"><a href="/member/mint.do">NFT 민팅</a></li>
               <li class="bookmark"><a href="/member/roadmap.do">로드맵</a></li>
               <li class="bookmark"><a href="/member/benefit.do">홀더 혜택</a></li>
               <li class="bookmark"><a href="/member/faq.do">FAQ</a></li>
               <li class="bookmark"><a href="/bbs/list.do">게시판</a></li>
			   <!-- 		로그인하지 않은 경우 출력할 메뉴 -->
	           <c:if test="${loginUser==null}">	
		      		<li class="bookmark"><a href="/member/login.do"> 로그인 </a></li>
		       		<li class="bookmark"><a href="/member/add.do"> 회원가입 </a></li>
	           </c:if>	
               <!-- 		로그인한 경우 출력할 메뉴   -->
	           <c:if test="${loginUser!=null}">
		       		<li class="bookmark"><a href="/member/logout.do"> 로그아웃 </a></li>
		       		<li class="bookmark"><a href="/member/list.do"> 회원목록 </a></li>
		       		<li class="bookmark">[${loginUser.memName}]</li>
	           </c:if>
            </ul>
        </section>

        <br><br><br><br><br>

        <div id="page" style="z-index: 2;">
            <p class="faq">FAQ</p><br>
            <div data-v-60e2dcca class="content-wrap">
                <ul data-v-7c67ff0b data-v-60e2dcca class="accordion-list">
                    <li data-v-7c67ff0b class="accordion-item">
                        <button data-v-7c67ff0b class="title" onclick='toggleBtn1()'>
                            "Q.Developer Club은 어떤 블록체인을 이용하나요?"
                        </button>

                        <!-- 버튼 클릭시 아래에 내용 출력 -->
                        <div data-v-7c67ff0b class="accordion-content">
                            <div data-v-7c67ff0b class="cont" id="co1">
                                <p data-v-7c67ff0b>
                                    "A. 해당 NFT는 클레이튼(Klaytn) 블록체인을 이용합니다."
                                </p>
                            </div>
                        </div>
                    </li>
                </ul>
                <br>
                <ul data-v-7c67ff0b data-v-60e2dcca class="accordion-list">
                    <li data-v-7c67ff0b class="accordion-item">
                        <button data-v-7c67ff0b class="title" onclick='toggleBtn2()'>
                            "Q. 카이카스 지갑은 어떻게 만드나요? 오픈씨 이용은 어떻게 하나요?"
                        </button>

                        <!-- 버튼 클릭시 아래에 내용 출력 -->
                        <div data-v-7c67ff0b class="accordion-content">
                            <div data-v-7c67ff0b class="cont" id="co2">
                                <p data-v-7c67ff0b>
                                    "A. https://evrdh.tistory.com/m/entry/How-to-use-opensea (추후 따로 문서로 작성해서 업로드 예정)"
                                </p>
                            </div>
                        </div>
                    </li>
                </ul>
                <br>
                <ul data-v-7c67ff0b data-v-60e2dcca class="accordion-list">
                    <li data-v-7c67ff0b class="accordion-item">
                        <button data-v-7c67ff0b class="title" onclick='toggleBtn3()'>
                            "Q. 2차 판매 수수료가 있나요?"
                        </button>

                        <!-- 버튼 클릭시 아래에 내용 출력 -->
                        <div data-v-7c67ff0b class="accordion-content">
                            <div data-v-7c67ff0b class="cont" id="co3">
                                <p data-v-7c67ff0b>
                                    "A. 2차 판매 수수료는 5%입니다."
                                </p>
                            </div>
                        </div>
                    </li>
                </ul>
                <br>
                <ul data-v-7c67ff0b data-v-60e2dcca class="accordion-list">
                    <li data-v-7c67ff0b class="accordion-item">
                        <button data-v-7c67ff0b class="title" onclick='toggleBtn4()'>
                            "Q. Developer Club은 저작권을 활용할 수 있나요?"
                        </button>

                        <!-- 버튼 클릭시 아래에 내용 출력 -->
                        <div data-v-7c67ff0b class="accordion-content">
                            <div data-v-7c67ff0b class="cont" id="co4">
                                <p data-v-7c67ff0b>
                                    "A. 해당 NFT의 저작권을 사용할 수 있습니다.(2차 창작물 등)"
                                </p>
                            </div>
                        </div>
                    </li>
                </ul>
                <br>
            </div>
            <hr color="#1f1529" /><br>
            <footer style="text-align: center;">Copyright &copy; 2022 <a href="/member/mint.do">NFTMINT</a> All rights
                reserved
            </footer>
        </div>
    </main>
    <script src="/main.js"></script>
    <script>
        function toggleBtn1() {

            // 토글 할 버튼 선택 (btn1)
            const co1 = document.getElementById('co1');

            // btn1 숨기기 (display: none)
            if (co1.style.display !== 'none') {
                co1.style.display = 'none';
            }
            // btn1 보이기 (display: block)
            else {
                co1.style.display = 'block';
            }

        }
        function toggleBtn2() {

            // 토글 할 버튼 선택 (btn2)
            const co2 = document.getElementById('co2');

            // btn1 숨기기 (display: none)
            if (co2.style.display !== 'none') {
                co2.style.display = 'none';
            }
            // btn1 보이기 (display: block)
            else {
                co2.style.display = 'block';
            }

        }
        function toggleBtn3() {

            // 토글 할 버튼 선택 (btn1)
            const co3 = document.getElementById('co3');

            // btn1 숨기기 (display: none)
            if (co3.style.display !== 'none') {
                co3.style.display = 'none';
            }
            // btn1 보이기 (display: block)
            else {
                co3.style.display = 'block';
            }

        }
        function toggleBtn4() {

            // 토글 할 버튼 선택 (btn1)
            const co4 = document.getElementById('co4');

            // btn1 숨기기 (display: none)
            if (co4.style.display !== 'none') {
                co4.style.display = 'none';
            }
            // btn1 보이기 (display: block)
            else {
                co4.style.display = 'block';
            }

        }
    </script>
</body>

</html>