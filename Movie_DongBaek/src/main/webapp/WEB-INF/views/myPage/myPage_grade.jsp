<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/myPage.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/sidebar_myPage.css" rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>
<style>
</style>
</head>
<body>
	<%--네비게이션 바 영역 --%>
	<header id="pageHeader"><%@ include
			file="/resources/inc/header.jsp"%></header>

	<article id="mainArticle">
		<%--본문내용 --%>
		<div class="container">
			<div class="mainTop">
				<h1>OOO{param.name]님의 등급 : <img src="${pageContext.request.contextPath }/resources/img/gold.png" id="myPage_GOLD"></h1>
			</div>
			<div>
				<h2>등급별 혜택</h2>
				<table class="table table-striped">
					<tr>
						<th><img src="${pageContext.request.contextPath }/resources/img/gold.png" id="myPage_nowGrade">브론즈</th>
						<td>할인율 : 영화 결제금액 <span class="sale">1%</span> <b>할인</b></td>
					</tr>
					<tr>
						<th><img src="${pageContext.request.contextPath }/resources/img/gold.png" id="myPage_nowGrade">실버</th>
						<td>할인율 : 영화 결제금액 <span class="sale">3%</span> <b>할인</b></td>
					</tr>
					<tr>
						<th><img src="${pageContext.request.contextPath }/resources/img/gold.png" id="myPage_nowGrade">골드</th>
						<td>할인율 : 영화 결제금액 <span class="sale">5%</span> <b>할인</b></td>
					</tr>
					<tr>
						<th><img src="${pageContext.request.contextPath }/resources/img/gold.png" id="myPage_nowGrade">플래티넘</th>
						<td>할인율 : 영화 결제금액 <span class="sale">10%</span> <b>할인</b></td>
					</tr>
				</table>
			</div>
		</div>

	</article>

	<%--왼쪽 사이드바 --%>
		<nav id="mainNav">
		<%--왼쪽 사이드바 --%>
  		<%@ include file="/WEB-INF/views/sidebar/sideBar_myPage.jsp"%>
  	</nav>

	<div id="siteAds"></div>
	<%--페이지 하단 --%>
	<footer id="pageFooter"><%@ include
			file="/resources/inc/footer.jsp"%></footer>
</body>