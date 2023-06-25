<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
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
<link
	href="${pageContext.request.contextPath }/resources/css/default.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/resources/css/sidebar.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/resources/css/button.css"
	rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>
<style>
#mainNav{
/* 		border: 1px solid #f00; */
	padding: 8rem 2rem;	
}
	
#mainNav>ul{
	list-style: none;
}
div {
background-color: transparent;
}


.page-item.active .page-link {
 z-index: 1;
 color: #555;
 font-weight:bold;
 background-color: #f1f1f1;
 border-color: #ccc;
 
}

.page-link:focus, .page-link:hover {
  color: #000;
  background-color: #fafafa; 
  border-color: #ccc;
}

<%-- a링크 활성화 색상 변경 --%>
a:hover, a:active{
 color:  #ff5050 !important;
	
}

<%-- 페이징 색상변경 --%>
.page-link {
  color: #000; 
  background-color: #fff;
  border: 1px solid #ccc; 
}

</style>

</head>
<body>
 <header id="pageHeader">
 <%--네비게이션 바 영역 --%>
  <%@ include file="../inc/header.jsp"%>
 </header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
  
   <div class="container container-fluid w-900" >
  

<br><h1>자주묻는 질문</h1>
<!-- <div class="btn-group " role="group" aria-label="Basic example"> -->
<!--   <button type="button" class="btn btn-outline-secondary">전체</button> -->
<!--   <button type="button" class="btn btn-outline-secondary">예매</button> -->
<!--   <button type="button" class="btn btn-outline-secondary">멤버십</button> -->
<!--   <button type="button" class="btn btn-outline-secondary">결제수단</button> -->
<!--   <button type="button" class="btn btn-outline-secondary">극장</button> -->
<!--   <button type="button" class="btn btn-outline-secondary">스토어</button> -->
<!--   <button type="button" class="btn btn-outline-secondary">할인혜택</button> -->
<!--   <hr> -->
<!--   </div> -->
  <hr>
  	<%-- 본문 테이블 --%>
  	<div class="row">
  	<table class="table table-striped text-center align-middle">
	  <%-- 테이블 헤드 --%>
	  <thead>
	    <tr>
	      <th scope="col" width="100px">번호</th>
	      <th scope="col" width="100px">유형</th>
	      <th scope="col" width="600px">제목</th>
	      <th scope="col" width="100px">작성자</th>
	      <th scope="col" width="100px">등록일</th>
	    </tr>
	  </thead>
	  <%-- 테이블 바디--%>
	  <tbody>
	  	    <tr>
	  <%-- CS 목록 출력 --%>
	  <c:forEach var="csInfo" items="${csInfoList }">
	    <tr>
	      <td scope="col" class="align-middle">${csInfo.cs_type_list_num }</td>
	      <td scope="col" class="align-middle">${csInfo.cs_type }</td>
	      <td scope="col" class="align-middle text-left">
	      		<a href="admin_cs_faq_modify_form?cs_type_list_num=${csInfo.cs_type_list_num }&pageNo=${pageNo}" class="mb-5" style="color: #3D2C1E;">${csInfo.cs_subject }</a></td>
	      <td scope="col" class="align-middle">${csInfo.member_id }</td>
	      <td scope="col" class="align-middle">
	      	<fmt:formatDate value="${csInfo.cs_date }" pattern="yy-MM-dd HH:mm" />
	      </td>
	    </tr>
	  </c:forEach>
<!-- 	    <tr> -->
<!-- 	      <td scope="col" class="align-middle">24</th> -->
<!-- 	      <td scope="col" class="align-middle">예매</td> -->
<!-- 	      <td scope="col" class="align-middle">안녕하세요</td> -->
<!-- 	      <td scope="col" class="align-middle">관리자</td> -->
<!-- 	      <td scope="col" class="align-middle">2022-02-02</td> -->
<!-- 	    </tr> -->

	    <%-- 밑줄 용 빈칸 --%>
	    <tr>
	     <th scope="row"></th>
	     <th></th>
	     <th></th>
	     <th></th>
	     <th></th>
	    </tr>
	
	  </tbody>
	</table>
  	</div>
  			<div class="row col flex-row-reverse"><button type="button" class="btn btn-danger" onclick="location.href='admin_cs_faq_form'">등록</button></div>
	<div class="col col-md-1"></div>
 <%-- 페이징 --%>
 
 <nav aria-label="...">
  <ul class="pagination pagination-md justify-content-center">
  
  
  <%-- 페이지가 1이상일때 클릭시 이전 페이지로 이동 --%>
	<c:choose>
		<c:when test="${pageNo > 1 }">
			<li class="page-item">
		      <a class="page-link" href="admin_cs_notice?pageNo=${pageNo - 1}" tabindex="-1" aria-disabled="flase">&laquo;</a>
		    </li>
		</c:when>
		<c:otherwise>
		    <li class="page-item disabled">
		      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">&laquo;</a>
		    </li>
		</c:otherwise>
	</c:choose>
	<%-- 각 페이지마다 하이퍼링크 설정(단, 현재 페이지는 하이퍼링크 제거) --%>
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<c:choose>
			    <%-- 현재 페이지 --%>
				<c:when test="${pageNo eq i }">
				    <li class="page-item active" aria-current="page">
				      <a class="page-link" href="#">${i } <span class="sr-only">(current)</span></a>
				    </li>
				</c:when>
				<c:otherwise>
				    <%-- 다른 페이지 --%>
    				<li class="page-item">
    				  <a class="page-link" href="admin_cs_notice?pageNo=${i }">${i }</a>
    				</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>


	<%-- 다음페이지로 이동 --%>
		<c:choose>
			<c:when test="${pageNo < pageInfo.maxPage }">
				<li class="page-item">
				 <a class="page-link" href="admin_cs_notice?pageNo=${pageNo + 1}">&raquo;</a>
			    </li>
			</c:when>
			<c:otherwise>
			    <li class="page-item disabled">
			      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">&raquo;</a>
			</c:otherwise>
		</c:choose>	

    <li class="page-item">

    </li>
  </ul>
</nav>
  
  </article>
  

  <%--왼쪽 사이드바 --%>
	<nav id="mainNav" class="d-none d-md-block sidebar">
		<%@ include file="/WEB-INF/views/sidebar/sideBar.jsp"%>
	</nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>