<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<%-- 부트스트랩 이모티콘 --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<title>영화 예매 사이트</title>

<%--페이징css --%>
<style>
	#pageList{
	  align-content: center;
	  font-size: large; 
	  margin: auto;
	  margin-bottom:50px;
/* 	  width: 1024px; */
	  text-align: center;
	}
	#nowPage{
		color:#dc3545;
		size: 20px;
		margin: auto;
/* 		width: 1024px; */
		text-align: right;
	}
	#anotherPage{
		color:graytext;
		margin: auto;
/* 		width: 1024px; */
		text-align: right;
	}
	
</style>
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="../inc/header.jsp"%></header> 
 <article id="mainArticle">
 <%--본문내용 --%>
 <div class="container">
	<%--top 섹션 include --%>
	<%@include file="movieDetail_top.jsp" %>
		  	
	<%-- 2. 두번째 섹션 - 탭 --%>
	<section id="tap">
		 <div class="row">
			 <div class="col">
		  		<ul class="nav nav-tabs">
					<li class="nav-item">
				    	<a class="nav-link" href="movie_detail_info?movie_num=${movie.movie_num }"> 주요정보 </a>
				  	</li>
				  	<li class="nav-item">
				    	<a class="nav-link active" href="movie_detail_review?movie_num=${movie.movie_num }"> 리뷰 </a>
				  	</li>
				  	<li class="nav-item">
				    	<a class="nav-link" href="movie_detail_photo?movie_num=${movie.movie_num }"  style="width:150px">예고편/스틸컷</a>
				  	</li>
				</ul>
			</div>
		</div>
	</section>

	 <%-- 2-1. 두번째 섹션 - 탭내용(리뷰) --%>
	 <section id="review_content" style="margin: 80px">
	 	<div class="row">
     		<b>${movie.movie_name_kr}</b> 에 대한 리뷰 ${reviewCount.review_count } 개가 등록되어있습니다
         	<%-- 리뷰개수카운팅 전달필요 => movie_num(movie_name_kr)에 해당하는 review_num 카운팅--%>
      	</div>
      	<div class="row h6" id="review_count" style="margin-bottom:10px; margin-top: 10px">
            전체 리뷰 개수 : ${reviewCount.review_count}개
      	</div>
      	
	    <%-- 리뷰컨텐츠 --%>
	      <c:forEach var="review" items="${reviewList}">
	         <div class="row" style="margin-top: 20px">
	            <%-- 아이콘,아이디 --%>
	            <div class="col sm-2">
	               <img src="${pageContext.request.contextPath }/resources/img/anonymous.png" class="rounded float-left rounded-circle" alt="..." width="50px" style="margin:10px">
	               <p>${review.member_id} 님</p>
	            </div>
	            <%-- 평점 --%>
	            <div class="col sm-2">
	               <h5>평점</h5>
	               <p> ${review.review_rating} 점</p>
	            </div>
	            <%-- 리뷰내용 --%>
	            <div class="col sm-6">
	               ${review.review_content}
	            </div>
	            <%-- 공감버튼,공감수? --%>
	            <div class="col sm-2">
	               <button><img src="${pageContext.request.contextPath }/resources/img/finger.png" class="rounded float-left" alt="..." width="50px"></button>
	            </div>
	         </div>
	      </c:forEach>
      </section>
      
    <%-- pageNum 파라미터 가져와서 저장(없을 경우 기본값 1로 설정) --%>
	<c:set var="pageNum" value="1" />
	<c:if test="${not empty param.pageNum }">
		<c:set var="pageNum" value="${param.pageNum }" />
	</c:if>
		
	<%-- 페이징처리 ========================================== --%>
	<section id="pageList">
		<%-- 1. 현재페이지>1 =>[이전]버튼 동작 => 버튼클릭시 : BoardList서블릿요청(파라미터:현재pg-1) --%>
		<c:choose>
			<c:when test="${pageNum > 1 }">
				<input type="button" class="btn-sm btn-outline-danger mr-2" value="이전" onclick="location.href='movie_detail_review?pageNum=${pageNum - 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" class="btn-sm btn-outline-danger mr-2" value="이전" disabled="disabled">
			</c:otherwise>
		</c:choose>
		<%--간소화 할시 --%>
		<%-- 	<input type="button" value="이전" <c:if test="${pageNum > 1 }"> onclick="location.href='BoardList.bo?pageNum=${pageNum - 1}'"</c:if>> --%>
	
	
		<%-- 2. 페이지번호 목록은 시작페이지(startPage) 부터 끝페이지(endPage) 까지 표시 --%>
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<%-- 각 페이지마다 하이퍼링크 설정(단, 현재 페이지는 하이퍼링크 제거) --%>
			<c:choose>
				<c:when test="${pageNum eq i }">
					<b id="nowPage">${i }</b> <%--페이지번호=현재페이지번호 -> 글자만표시  --%>
				</c:when>
				<c:otherwise>
					<a href="movie_detail_review?pageNum=${i }" id="anotherPage">${i }</a><%--하이퍼링크활성화 --%>
				</c:otherwise>
			</c:choose>
		</c:forEach>	
	
		<%-- 3. 현재페이지<maxPage =>[다음]버튼 동작 => 버튼클릭시 : BoardList서블릿요청(파라미터:현재pg+1) --%>
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage }">
				<input type="button" value="다음" class="btn-sm btn-outline-danger mr-2" onclick="location.href='movie_detail_review?pageNum=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value="다음" class="btn-sm btn-outline-danger mr-2" disabled="disabled">
			</c:otherwise>
		</c:choose>
	</section>
	<%--페이징처리 끝 ==========================================--%>
		
		
      
		  	
 </div>
 </article>
 <%-- 컨테이너 끝 --%> 
	 
	 
	 
	 
  <nav id="mainNav">
  <%--왼쪽 사이드바 --%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>
