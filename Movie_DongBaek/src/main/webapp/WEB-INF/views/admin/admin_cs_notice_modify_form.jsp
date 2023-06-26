<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%-- JSTL 의 함수를 사용하기 위해 functions 라이브러리 추가 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!doctype html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/button.css" rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>
<style>

div {
    background-color: transparent;
}

a {
    text-decoration: none;
}
    
<%-- a링크 활성화 색상 변경 --%>
a:hover, a:active{
 color:  #ff5050 !important;
	
}
</style>
<script type="text/javascript">

<%-- 공백 입력 방지 --%>

$(function() {
    $("#cs_form").submit(function(e) {
      var csContent = $("#cs_content").val().trim();
      
      if (/^\s*$/.test(csContent)) { // 스페이스바로만 이루어진 공백 감지
          e.preventDefault(); // 등록 방지
          
          alert("내용을 입력해주세요.");
      }
    });
});

</script>
</head>
<body>
    <header id="pageHeader">
        <%--네비게이션 바 영역 --%>
        <%@ include file="../inc/header.jsp"%>
    </header>
 
    <article id="mainArticle">
        <%--본문내용 --%>
        <div class="container-fluid w-900">
            <form action="admin_cs_notice_modify_pro" id="cs_form" method="post" enctype="multipart/form-data">
                <h1>공지사항 관리자</h1>
                <input type="hidden" name="pageNo" value="${param.pageNo }"> <%-- 페이지번호 전송용 --%>
                <input type="hidden" name="cs_type" value="공지" ><%-- 공지사항 유형 정보 전송용 --%>
                <input type="hidden" name="csTypeNo" value="1" ><%-- 공지사항 유형 정보 전송용 --%>


                <table class="table table-striped text-center align-middle">
                    <tbody>
                        <tr>
                            <td scope="col" class="align-middle" width="100">번호</td>
                            <td scope="col" class="align-middle" width="400"><input type="text" class="form-control" aria-label="notice.cs_type_list_num" name="cs_type_list_num" value="${csInfo.cs_type_list_num }" readonly></td>
                        </tr>
                        <tr>
                            <td scope="col" class="align-middle" width="100">제목</td>
                            <td scope="col" class="align-middle"><input type="text" class="form-control" aria-label="cs_subject" name="cs_subject" value="${csInfo.cs_subject }"></td>
                        </tr>
                        <tr>
                            <td scope="col" class="align-middle" width="100">작성자</td>
                            <td scope="col" class="align-middle"><input type="text" class="form-control" aria-label="cs_name" name="member_id" value="${sessionScope.member_id }" readonly></td>
                        </tr>
                        <tr>
                            <td scope="col" class="align-middle" width="100">내용</td>
                            <td scope="col" class="align-middle"><textarea class="form-control" rows="10" cols="200" name="cs_content">${csInfo.cs_content }</textarea></td>
                        </tr>
                        <tr>
                        	<td scope="col" class="align-middle" width="100">사진첨부(이전)</td>
                            <td scope="col" class="align-middle">
                            	
                            	<%-- 첨부파일 다운로드 구현 아직 --%>
		                        <c:choose>
									<c:when test="${not empty csInfo.cs_file }">
										<a href="${pageContext.request.contextPath }/resources/upload/${csInfo.cs_file }" download="${fn:split(csInfo.cs_file, '_')[1] }">
											${fn:split(csInfo.cs_file, '_')[1] }
										</a>
									</c:when>
		                          		<c:otherwise>
		                           		<span id="cs_file_old_span">첨부파일이 없습니다</span>
		                          		</c:otherwise>
		                        </c:choose>
                            </td>	
						</tr>
                        <tr>
                            <td scope="col" class="align-middle" width="100">사진첨부(변경)</td>
                            <td scope="col" class="align-middle">
                            	<input type="file" class="form-control" aria-label="cs_file" name="file1" />
                            </td>
                        </tr>
                        <tr>
                            <td scope="col" class="align-middle"></td>
                            <td scope="col" class="align-middle">
                                <button class="btn btn-danger" type="submit">&nbsp;&nbsp;&nbsp;수정&nbsp;&nbsp;&nbsp;</button>
                                <button class="btn btn-outline-danger" type="button" onclick="history.back()">돌아가기</button>
                                <button class="btn btn-outline-secondary" type="button" data-toggle="modal" data-target="#deleteWrite">&nbsp;&nbsp;&nbsp;삭제&nbsp;&nbsp;&nbsp;</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </article>

    <%--왼쪽 사이드바 --%>
    <nav id="mainNav" class="d-none d-md-block sidebar">
        <%@ include file="/WEB-INF/views/sidebar/sideBar.jsp"%>
    </nav>
  
    <div id="siteAds"></div>
    <%--페이지 하단 --%>
    
    
    <%-- 모달 --%>
<div class="modal fade" id="deleteWrite" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	공지를 삭제하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="">취소</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="location.href='delete_cs?csTypeNo=1&cs_type_list_num=${csInfo.cs_type_list_num }'">&nbsp;&nbsp;예&nbsp;&nbsp;</button>
      </div>
    </div>
  </div>
</div>

    
    
</body>
