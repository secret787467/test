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

        .faq {
            font-size: 3rem;
        }

        .box {
            display: inline-block;
            line-height: 1.5rem;
            font-size: 1rem;
            font-weight: bold;
            font-family: Arial, Helvetica, sans-serif;
        }
        
        hr {
            margin-top: 20rem;
        }
    </style>

</head>

<body style="overflow-x: hidden">

    <main>
        <div>
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
                <p class="faq">홀더 혜택</p><br>
                <div class="box">
                    <pre style="text-align:left;">
                    1. 각 분야의 개발자들을 위한 포괄적인 커뮤니티를 구축하는 것을 목표로 합니다.
                    

                    2. 개발에 대한 전문 지식들을 Web2와 Web3에서 서로 공유할 수 있는 지식 공유 커뮤니티를 만들어
                    개발자 간의 정보를 공유하고 팀 프로젝트 등을 수행합니다.
                    

                    3. NFT 홀더들만의 커뮤니티를 따로 만들어서 온/오프라인 커뮤니티 행사를 개최합니다.
                    

                    4. NFT 홀더들에게 해당 NFT 커뮤니티를 운영하면서 생기는 부가적인 수입의 일부를 제공합니다.
                    
                </pre>
                </div>
                
                <hr color="#1f1529" /><br>
                <footer style="text-align: center;">Copyright &copy; 2022 <a href="/member/mint.do">NFTMINT</a> All rights
                    reserved
                </footer>
            </div>
        </div>
    </main>
    <script src="/main.js"></script>
</body>

</html>