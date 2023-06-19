<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>
<style>
#mainNav{
/* 		border: 1px solid #f00; */
		padding: 8rem 2rem;
		
	}
	
	#mainNav>ul{
		list-style: none;
	}
	.seachArea{
		margin: 1.2em 0;
	}
	/* 검색창안에 검색아이콘 넣기 위한 설정 */
	.board-search {
 		margin: 0.8em 0;
 		width: 300px; 
 		height: 2em;
 		border-radius: 3px; 
 		border: 1px solid #ccc; 
/* 		display: flex; */
/* 		justify-content: center; */
/* 		align-items: center; */
		vertical-align: center;
 		z-index: 1;
 		opacity: 1;
	}
	.board-search>#searchTxt {
		width: 200px;
		height: 1.5em;
		border: none;
/* 		-webkit-appearance: none; */
		text-align: left;
		margin-left: 10px;
		overflow: auto;	/* 검색어가 길어졌을 때 오른쪽으로 검색되도록 하기 위해*/
		z-index: -1;
		font-size: 15px;
	}
	.board-search>#searchTxt:focus {
		outline: none;
/* 		width: 300px; */
/* 		text-align: left; */
	}
	.clear {
		clear: both;
	}
	.qPart {
		background-color: #ccc;
		padding: 5px;
	}
/* 	.qPart:hover {background-color: #eee; } */
 	.checkbox {display:none;} 
	.target {
/*  		display: none; */
		margin: 10px 1em;
		padding: 5px;
	}
	#pageBtn-group {
		text-align: center;
		margin: 1em auto;
	}
	
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script type="text/javascript">
	
	$(function() {
		// 화면 처음 로딩 시 전체 질문, 답변 들고오기
		let cs_type = '전체';
		let pageNum = 1;
		$.ajax({
				type: 'GET',
				url: '<c:url value="/faq_data"/>',
				data: {'cs_type': cs_type},
				dataType: 'JSON',	// 응답데이터 json형식으로 전달받음
				success: function(result) {	// 요청 성공 시
					// 눌린 버튼 비활성화, 아닌 버튼 활성화
// 					$(".btn-group>button").attr("disabled", false);
// 					$(this).attr("disabled", true);
					
					// 총 몇 건인지 안내
					$("#totalCnt").text(result.length);
					
					let start = pageNum * 5 - 4;
					let limit = pageNum * 5;
					
					for(let i = 0; i <= (limit - start); i++) {
// 						console.log(limit);
						$("#faqContents").append(
								"<div class='qPart'>"
								+ "[" + result[i].cs_type + "] <br>" + " Q. " + result[i].cs_subject + "</label></div>"
								);
						$("#faqContents").append(
								"<div class='target' id='target" + i + "' > A. " + result[i].cs_content + "</div>"
								);
					}
					
					// 페이지(버튼) 갯수
					let pageCount = Math.ceil(result.length / 5);
					console.log(pageCount);
					
					for(let i = 1; i <= pageCount; i++) {
// 						console.log(i);
						$("#pageBtn-group").append(
								"<button class='pageBtn btn btn-outline-danger'>" + i + "</button>"
								);
					}
				},
				error: function() {
					alert('에러');
				}
			});
		
		// 카테고리별 질문 & 답변 들고오기
		let isDataAppended = false;	// 추가 여부를 나타내는 변수
		$(".btn-group>button").click(function() {
			// 클릭된 버튼의 value값(카테고리명)을 받아 DB에서 받아오기
			let cs_type = $(this).val();
			let pageNum = 1;
			if(!isDataAppended) {	// 추가되지 않았을 경우에만 실행
				console.log(cs_type);
				
				$.ajax({
					type: 'GET',
					url: '<c:url value="/faq_data"/>',
					data: {'cs_type': cs_type},
					dataType: 'JSON',	// 응답데이터 json형식으로 전달받음
					success: function(result) {	// 요청 성공 시
						
						// 눌린 버튼 비활성화, 아닌 버튼 활성화
						$(".btn-group>button").attr("disabled", false);
						$("button[value='" + cs_type +"']").attr("disabled", true);
						
						$("#totalCnt").text(result.length);	// 총 몇 건인지 안내
						
						// 페이징 처리를 위한 변수 정의
						let start = pageNum * 5 - 4;
						let limit = pageNum * 5;
						
						if(result.length <= limit){
							limit = result.length;
						}
					
						// 1. CsVO 객체 추출(result)
						// 2. 추출된 CsVO 목록(배열)을 반복문을 통해 반복하면서
						// cs_type, cs_subject, cs_content 추출 및 출력
						// 카테고리 버튼 클래스를 바꿔주기(클릭된 버튼 색채우기)
						$(this).removeClass(".btn-outline-danger");
						$(this).addClass(".btn-danger");
// 						console.log("받아오기 성공!");

						$("#faqContents").empty();
						for(let i = (start - 1); i < limit; i++) {
// 							console.log(limit);
							$("#faqContents").append(
									"<div class='qPart'>"
									+ "[" + result[i].cs_type + "] <br>" + " Q. " + result[i].cs_subject + "</label></div>"
									);
							$("#faqContents").append(
									"<div class='target' id='target" + i + "' > A. " + result[i].cs_content + "</div>"
									);
						}
						
						// 전 페이지 버튼들 삭제
						$("#pageBtn-group").empty();
						// 페이지(버튼) 갯수
						let pageCount = Math.ceil(result.length / 5);
// 						console.log(pageCount);
						
						for(let i = 1; i <= pageCount; i++) {
							console.log(i);
							$("#pageBtn-group").append(
									"<button class='pageBtn btn btn-outline-danger'>" + i + "</button>"
									);
						}
						
					},
					error: function() {
						alert('에러');
					}
					
				});
			
			
			}
		});
		

		
		
		
		
		
		
		
	});
	
// 	$(document).ready(function() {
// 		$(".checkbox").on("change", function() {
// 			console.log("클릭됨");
// 			let targetId = $(this).data('target');
// 			let target = $("#" + targetId);
			
// 			if($(this).prop("checked")) {
// 				target.removeClass(".d-none");
// 			} else {
// 				target.addClass(".d-none");
// 			}
// 		});
// 	});
	
</script>
</head>
<body>
 <header id="pageHeader">
 <%--네비게이션 바 영역 --%>
  <%@ include file="../inc/header.jsp"%>
 </header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
  
   <div class="container-fluid w-900" >
  
	 <nav aria-label="breadcrumb">
	  <ol class="breadcrumb bg-white">
	    <li class="breadcrumb-item"><a href="cs_main">고객센터 홈</a></li>
	    <li class="breadcrumb-item active" aria-current="page">자주묻는 질문</li>
	  </ol>
	</nav>

		<h1>자주묻는 질문</h1>
		
		<%-- 검색기능 --%>
		<div class="seachArea">
			<b>빠른 검색</b> &nbsp;&nbsp;
			<span class="board-search w460px">
				<input type="search" id="searchTxt" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text" value="" maxlength="15">
				<span class="material-symbols-outlined">search</span>
			</span>
		</div>
		<br>
		<div class="btn-group" role="group" aria-label="Basic example">
		  <button type="button" id="faqAll" value="전체" class="btn btn-outline-danger" disabled>전체</button>
		  <button type="button" id="faqReserv" value="예매" class="btn btn-outline-danger">예매</button>
		  <button type="button" id="faqMemship" value="멤버십" class="btn btn-outline-danger">멤버십</button>
		  <button type="button" id="faqPayment" value="결제수단" class="btn btn-outline-danger">결제수단</button>
		  <button type="button" id="faqTheater" value="극장" class="btn btn-outline-danger">극장</button>
		  <button type="button" id="faqDiscount" value="할인혜택" class="btn btn-outline-danger">할인혜택</button>
		  <hr>
		</div>
		<hr>
		  
			<div class="faq-list-box">
				<p class="reset mb10">
					<strong>
						<span id="totalTitle">전체</span>
						<span class="font-green" id="totalCnt"></span>건
					</strong>
				</p>
				
				<div class="faq-list">
					<ul>
					</ul>
				</div>
			</div>
   		<div id="faqContents">
   		</div>
   		<hr>
		<div id="pageBtn-group">
		</div>
	<script type="text/javascript">
		
//	 		$("#pageBtn-group").append(
//				"<button class='pageBtn btn btn-outline-danger'>" + i + "</button>"
//				);
		$(document).on("click", ".pageBtn", function() {
			// 페이지 버튼 클릭 시 값 뿌리기
// 			$(".pageBtn").click(function() {
				// 클릭된 버튼의 value값(카테고리명)을 받아 DB에서 받아오기
				console.log("페이지버튼클릭");
				let cs_type = $("button[disabled]").val();
				let pageNum = $(this).text();
				
				console.log(cs_type);
				console.log(pageNum);
				
				$.ajax({
					type: 'GET',
					url: '<c:url value="/faq_data"/>',
					data: {'cs_type': cs_type},
					dataType: 'JSON',	// 응답데이터 json형식으로 전달받음
					success: function(result) {	// 요청 성공 시
						
						// 눌린 버튼 비활성화, 아닌 버튼 활성화
						$(".btn-group>button").attr("disabled", false);
						$("button[value='" + cs_type +"']").attr("disabled", true);
						
						$("#totalCnt").text(result.length);	// 총 몇 건인지 안내
						
						// 페이징 처리를 위한 변수 정의
						let start = pageNum * 5 - 4;
						let limit = pageNum * 5;
						
						if(result.length <= limit){
							limit = result.length;
						}
					
						// 1. CsVO 객체 추출(result)
						// 2. 추출된 CsVO 목록(배열)을 반복문을 통해 반복하면서
						// cs_type, cs_subject, cs_content 추출 및 출력
						// 카테고리 버튼 클래스를 바꿔주기(클릭된 버튼 색채우기)
						console.log("받아오기 성공!");
		
						$("#faqContents").empty();
						for(let i = (start - 1); i < limit; i++) {
							console.log(limit);
							$("#faqContents").append(
									"<div class='qPart'>"
									+ "[" + result[i].cs_type + "] <br>" + " Q. " + result[i].cs_subject + "</label></div>"
									);
							$("#faqContents").append(
									"<div class='target' id='target" + i + "' > A. " + result[i].cs_content + "</div>"
									);
						}
						
						
					},
					error: function() {
						alert('에러');
					}
					
				});
				
				
			});
	
		
		
	</script>
		

  </div>
  </article>
  
  <nav id="mainNav" class="d-none d-md-block sidebar">
  <%--왼쪽 사이드바 --%>
	<jsp:include page="/WEB-INF/views/sidebar/sideBar_cs.jsp"></jsp:include>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>