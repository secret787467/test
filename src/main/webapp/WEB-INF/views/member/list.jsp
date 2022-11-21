<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MINTABLE</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/style.css">
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
        
        hr {
            margin-top: 50rem;
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
			<div class="box">
				<h2>Member list</h2>
				<p>our member</p>
				
				<c:forEach items="${memList}" var="vo" >
					<a href="/member/edit.do?memId=${vo.memId}">${vo.memId}</a> 
		 			: 
					${vo.memName}
					<br />
				</c:forEach>									                               
				
			</div>
	
			<hr color="#1f1529" /><br>
            <footer style="text-align: center;">Copyright &copy; 2022 <a href="/member/mint.do">NFTMINT</a> All rights
                reserved
            </footer>
        </div>

    <script src="/main.js"></script>
    
</body>
</html>











