<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/reservation.css" rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>
<style>
   .container-top{
      margin: 3rem;
   }
   aside{
      margin: 10px;
      background-color: #d5b59c;
   }
   
   /* 예매 선택 구간 */
   /* 크기 조절 */
   .container-fluid{
      width: 900px;
      margin: 1rem;
      padding-left: 2rem;
      border: 2px solid #aaa;
   /*    background-color: #d5b59c; */
   }
   div{
      background-color: transparent;
   }
   .container-fluid h5{
      text-align: center;
      font-weight: bold;
   }
   
   /* 선택사항 안내 구간 */
   /* 위 파트와 구별을 위한 색상 부여 */
   
   #seat-part{
      text-align: center;
   }
   #seat-part>hr{
      border: 0;   /* 두께를 지정하려면 기본 border을 0으로 설정해야함 */
      height: 3px;
      background-color: #ccc;
      width: 400px;
   }
   .border {
      border: 3px solid #aaa;
   }
   
   #beforeBtnArea{
      position: absolute;
      bottom: 5px;
      text-align: left;
   }
   #personType>input{
      width: 50px;
      height: 25px;
   }
   #seatType{
      border: 1px solid #999;
      font-size: 0.8em;
   }
   .unable{
      width: 0.8rem;
      height: 0.8rem;
      background-color: black;
   }
   .check{
      width: 0.8rem;
      height: 0.8rem;
      background-color: blue;
   }
   .handi{
      width: 0.8rem;
      height: 0.8rem;
      background-color: green;
      
   }
   .align-left{
      border-bottom:2px solid black;
      border-left: 2px solid black;
      border-right: 2px solid black;
      color: gray;
      left: 10px;
      position: relative;
      margin-right: 24rem;
   }
   .align-right{
      border-top:2px solid black;
      border-left: 2px solid black;
      border-right: 2px solid black;
      color: gray;
      right: 10px;
      position: absolute;
      margin-right: 7rem;
   }
   .vertical-center {
      vertical-align: middle;
   }
   
   #seat-part button{
	margin: 1px;
	border: 1px solid #aaa;
	background-color: #aaa;
	color: #fff;
	
}

#seat-part button:hover {
	background-color: #777;
}

#seat-part button:click {
	background-color: #ef4f4f;
}


#seat-part .seatArea button.seat.selected {
	border: 1px solid #ef4f4f;
	background-color: #ef4f4f; 
	border-radius: 0;
}
/*
#seat-part .seatArea button.seat.on {
	border: 1px solid #ef4f4f;
	background-color: #ef4f4f; 
	border-radius: 0;
}
*/
#seat-part .seatArea button.seat:visited {
	border: 1px solid #ef4f4f;
	background-color: #ef4f4f; 
	border-radius: 0;
}

#seat-part button#A5, 
#seat-part button#B5, 
#seat-part button#C5, 
#seat-part button#D5, 
#seat-part button#E5, 
#seat-part button#F5 {
	margin-right: 20px;
}

#seat-part button#C1, 
#seat-part button#C2, 
#seat-part button#C3, 
#seat-part button#C4, 
#seat-part button#C5, 
#seat-part button#C6, 
#seat-part button#C7, 
#seat-part button#C8, 
#seat-part button#C9, 
#seat-part button#C10 {
	margin-bottom: 20px;
}
   
.selected-animation {
  animation-name: seatSelected;
  animation-duration: 0.5s;
}
/*
@keyframes seatSelected {
  0% {
    background-color: #ff6961;
    color: #fff;
  }
  50% {
    background-color: #fff;
    color: #000;
  }
  100% {
    background-color: #ff6961;
    color: #fff;
  }
}

 .seat {
      width: 50px;
      height: 50px;
      background-color: gray;
      margin: 5px;
      display: inline-block;
      cursor: pointer;
    }

    .selected {
      background-color: green;
    }
  */    
    .seat {
      display: inline-block;
/*       width: 50px; */
/*       height: 50px; */
      margin: 5px;
      background-color: #e0e0e0;
      text-align: center;
/*       line-height: 50px; */
      cursor: pointer;
    }
  
    .selected {
      background-color: #42b983;
    }
    
</style>
<script type="text/javascript">
   
   let seatList = [];
   let seatListForParam = [];
   
   $(function(){   // 페이지 로딩 시 좌석 출력
      let res = "";
   	  res += "<div id='seatMap'>";
      let row = ["A", "B", "C", "D", "E", "F"];
      for(let i = 0; i < 6; i++){
         for(let j = 1; j <= 10; j++){
            res += "<button id="+ row[i] + j +" class='seat' data-seat-num=" + (i * 10 + j) + " data-seat-name=" + row[i] + j + " style='width:30px; font-size:13px;'>" + row[i] + j + "</button>";            
         }
         res += "<br>";
      }
      res += "</div>";
      $("#seat-part .seatArea").html(res);
   });
   
   
   $(function() {
		// [관람인원선택] 영역이 클릭되면 =========================================================================================================================================
		// play_num을 파라미터로 하여 OREDER_TICKETS 테이블에서 예약된 좌석 정보 가져오기
		// 예약된 좌석의 경우 disabled 클래스를 추가하여 선택할 수 없게 설정하기		
		$("#selectPeople button").on("click", function() {
			$("#seat-part").removeClass("disabled");
			$("#selectPeople button").removeClass("selected");
			$(this).addClass("selected");
			
			let playNum = $(".roomInfo2").attr("data-play-num");
			$.ajax({
				type : "post", 
				url : "SelectPeople", 
				data : {"play_num" : playNum}, 
				dataType : "json", 
			})
			.done(function(orderTicketList) {
			for(let i = 0; i <orderTicketList.length; i++) {
			
				for(let j = 0; j < 60; j++){               
					let seatNum = $("#seat-part button").eq(j).attr("data-seat-num");
					
					// 예약된 좌석 정보와 상영관의 좌석 번호를 비교하여 
					// 예약된 좌석의 경우 disabled 클래스를 추가하여 선택할 수 없게 설정하기
					if(orderTicketList[i].seat_num == seatNum){
						$("#seat-part button").eq(j).addClass("disabled")
					}
				}
			}
            })
			.fail(function() { // 요청 실패 시
				alert("요청 실패!");
			});
         
			// 인원 선택 수 제한두기
			// 일반, 청소년, 우대, 장애인 수를 더해서 8 이상이면 좌석에 disabled 클래스 추가
			let countAdult = $("#selectPeople #adult button.result").text();
			let countTeeager = $("#selectPeople #teenager button.result").text();
			let countChild = $("#selectPeople #child button.result").text();
			let countHandi = $("#selectPeople #handi button.result").text();
			let countPeople = Number(countAdult) + Number(countTeeager) + Number(countChild) + Number(countHandi);
// 			alert(countPeople);

			if(countPeople > 8){	// 관람인원의 합이 8명 이상일 때
				alert("인원 선택은 총 8명까지 가능합니다");   
				$("#seat-part button").addClass("disabled");
				
			}else if(countPeople == 0){	// 관람인원의 합이 0일 때
				alert("관람인원을 선택해 주세요");
				$("#seat-part button").removeClass("selected");
				$("#seat-part button").addClass("disabled");
			
				$("#selectPeople button").on("click", function() {
					$("#seat-part button").removeClass("disabled");            
				});
			}else{
				$("#seat-part button").removeClass("disabled");            
			}
			

		});
		
	});  

   
   
	// [좌석] 선택 시 ======================================================================================================================================================   
	$(function() {
		$("#seat-part button").on("click", function() {
			let resultAdult = $("#selectPeople #adult button.result").text();
			let resultTeenager = $("#selectPeople #teenager button.result").text();
			let resultChild = $("#selectPeople #child button.result").text();
			let resultHandi = $("#selectPeople #handi button.result").text();
			let countAdult = Number(resultAdult);
			let countTeenager = Number(resultTeenager);
			let countChild = Number(resultChild);
			let countHandi = Number(resultHandi);
			let countPeople = countAdult + countTeenager + countChild + countHandi;
	
			let selectedSeatName = $(this).attr("data-seat-name");
	
			// 클릭된 좌석이 selected 클래스를 가지고 있으면
			// selecte 클래스를 제거하고, 해당 좌석명을 seatList 배열에서 찾아서 제거
			// splice()를 사용하기 위해 indexOf()를 이용해 해당하는 좌석명이 배열의 몇번째 요소인지 찾아서 제거하기
			if ($(this).hasClass("selected")) {	
				$(this).removeClass("selected");	
				const index = seatList.indexOf(selectedSeatName);
				if (index > -1) {
					seatList.splice(index, 1);
				}
			} else {
				// 클릭된 좌석이 selected 클래스를 가지고 있지 않으면
				if (seatList.length >= countPeople) {	// 배열의 길이가 countPeople 보다 크거나 같아지면
					alert("좌석 선택이 완료되었습니다.");
					return;
				} else if (countPeople < seatList.length) {	// 배열의 길이가 countPeople 보다 작을 때
					
					alert("인원 수를 변경하려면 기존에 선택된 좌석을 취소해야 합니다.");
					return;
				}
				
				$(this).addClass("selected");
				seatList.push(selectedSeatName);
			}
	
			console.log(seatList);
			$("#seatInfo").html(seatList);
				
			for (let i = 0; i < adultCount; i++) {
				seatListForParam[i] = seatList[i] + "/adult";
			}
			for (let i = adultCount; i < adultCount + teenagerCount; i++) {
				seatListForParam[i] = seatList[i] + "/teenager";
			}
			for (let i = adultCount + teenagerCount; i < adultCount + teenagerCount + childCount; i++) {
				seatListForParam[i] = seatList[i] + "/child";
			}
			for (let i = adultCount + teenagerCount + childCount; i < adultCount + teenagerCount + childCount + handiCount; i++) {
				seatListForParam[i] = seatList[i] +  "/handi";
			}
			console.log(seatListForParam);
			
			let playTimeType = $("#dateInfo span").eq(1).attr("data-play-time-type");

			$.ajax({
				type : "post", 
				url : "GetTicketPrice", 
				data : {"play_time_type" : playTimeType}, 
				dataType : "json", 
			})
			.done(function(ticketPrice) {
				for(let i = 0; i < countPeople; i++){
					let ticketUserType = ticketPrice[i].ticket_user_type;
					let res = "";
					
					if(countAdult !=0 && ticketUserType == "일반"){
						res += "<span class='col-6 userType'>" + ticketPrice[i].ticket_user_type + "</span><span class='col-6 ticketPrice'>" + ticketPrice[i].ticket_type_price + " X " + countAdult + "</span>"
// 						$("#paymentInfo").html(res);
					
					}else if(countTeenager != 0 && ticketUserType == "청소년"){
						res += "<span class='col-6 userType'>" + ticketPrice[i].ticket_user_type + "</span><span class='col-6 ticketPrice'>" + ticketPrice[i].ticket_type_price + " X " + countTeenager + "</span>"
// 						$("#paymentInfo").html(res);
						
					}else if(countChild != 0 && ticketUserType == "경로/어린이"){
						res += "<span class='col-6 userType'>" + ticketPrice[i].ticket_user_type + "</span><span class='col-6 ticketPrice'>" + ticketPrice[i].ticket_type_price + " X " + countChild + "</span>"
// 						$("#paymentInfo").html(res);
						
					}else if(countHandi != 0 && ticketUserType == "장애인"){
						res += "<span class='col-6 userType'>" + ticketPrice[i].ticket_user_type + "</span><span class='col-6 ticketPrice'>" + ticketPrice[i].ticket_type_price + " X " + countHandi + "</span>"
// 						$("#paymentInfo").html(res);
					}
						$("#paymentInfo").html(res);
					
// 					if(countAdult !=0 && ticketUserType == "일반"){
// 						res += "<div class='row'><span class='col-6 userType'>" + ticketPrice[i].ticket_user_type + "</span><span class='col-6 ticketPrice'>" + ticketPrice[i].ticket_type_price + " X " + countAdult + "</span></div>"
// 						$("#paymentInfo").html(res);
					
// 					}else if(countTeenager != 0 && ticketUserType == "청소년"){
// 						res += "<div class='row'><span class='col-6 userType'>" + ticketPrice[i].ticket_user_type + "</span><span class='col-6 ticketPrice'>" + ticketPrice[i].ticket_type_price + " X " + countTeenager + "</span></div>"
// 						$("#paymentInfo").html(res);
						
// 					}else if(countChild != 0 && ticketUserType == "경로/어린이"){
// 						res += "<div class='row'><span class='col-6 userType'>" + ticketPrice[i].ticket_user_type + "</span><span class='col-6 ticketPrice'>" + ticketPrice[i].ticket_type_price + " X " + countChild + "</span></div>"
// 						$("#paymentInfo").html(res);
						
// 					}else if(countHandi != 0 && ticketUserType == "장애인"){
// 						res += "<div class='row'><span class='col-6 userType'>" + ticketPrice[i].ticket_user_type + "</span><span class='col-6 ticketPrice'>" + ticketPrice[i].ticket_type_price + " X " + countHandi + "</span></div>"
// 						$("#paymentInfo").html(res);
// 					}
				}
// 				$("#paymentInfo .type").html(res);
// 				let totalPrice = Number(countAdult) * adultPirce + Number(countTeeager) * teenagerPrice + Number(countChild) * childPrice + Number(countHandi) * handiPrice;	
// 				$("#paymentInfo .totalPrice").html(totalPrice + "원");
// 				}
				
			})
			.fail(function() { // 요청 실패 시
				alert("요청 실패!");
			});
			
// 					if(seatListForParam[i].contains("/adult")){
						
// 					}

			
		});
		
	});
	

</script>
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
 
<article id="mainArticle">
  <%--본문내용 --%>
       <h2>영화 예매</h2>
      <div class="container-fluid" >
            <div class="row row1">
               <div class="col-12">
                  <div class="row title-area">
                     <div class="col-12">
                        <div class="row">
                           <div class="col-12">
                              <h5>관람인원선택</h5>
                           </div>                        
                        </div>
                     </div>
                  </div>
                  
                  <%-- 좌석 선택 파트 --%>
               <div class="row">
                      <div class="col-12 border">
                        <div class="row mt-3">
                           <div class="col-12" id="selectPeople">
                           <div class="row">
                              <div class="col-2"  id="adult">
                                 <span>성인</span>
                                 <div>
                                    <button class="down" onclick="adultDown()"> - </button><button class="result">0</button><button class="up" onclick="adultUp()"> + </button>
                                 </div>
                              </div>
                              <div class="col-2"  id="teenager">
                                    <span>청소년</span><div><button class="down" onclick="teenagerDown()"> - </button><button class="result">0</button><button class="up" onclick="teenagerUp()"> + </button></div>
                              </div>
                              <div class="col-2"  id="child">
                                    <span>우대</span><div><button class="down" onclick="childDown()"> - </button><button class="result">0</button><button class="up" onclick="childUp()"> + </button></div>
                              </div>
                              <div class="col-2"  id="handi">
                                    <span>장애인</span><div><button class="down" onclick="handiDown()"> - </button><button class="result">0</button><button class="up" onclick="handiUp()"> + </button></div>
                              </div>
                              <script type="text/javascript">
                                 let adultResult = $("#selectPeople #adult button.result").text();
                                 let adultCount = Number(adultResult);
                                 function adultDown() {
                                    if(adultCount <= 0){
                                       $("#selectPeople #adult button.down").addClass("disabled");
                                    }else {
                                       adultCount = adultCount - 1;
                                       $("#selectPeople #adult button.up").removeClass("disabled");
                                       $("#selectPeople #adult button.result").html(adultCount);                                       
                                    }
                                 }   
                                 
                                 function adultUp() {
                                    if(adultCount >= 8){
                                       $("#selectPeople #adult button.up").addClass("disabled");
                                    }else {
                                       adultCount = adultCount + 1;
                                       $("#selectPeople #adult button.down").removeClass("disabled");
                                       $("#selectPeople #adult button.result").html(adultCount);                                       
                                    }
                                 }   
                                 
                                 // ------------------------------------------------------------------------------
                                 let teenagerResult = $("#selectPeople #teenager button.result").text();
                                 let teenagerCount = Number(teenagerResult);
                                 function teenagerDown() {
                                    if(teenagerCount <= 0){
                                       $("#selectPeople #teenager button.down").addClass("disabled");
                                    }else {
                                       teenagerCount = teenagerCount - 1;
                                       $("#selectPeople #teenager button.up").removeClass("disabled");
                                       $("#selectPeople #teenager button.result").html(teenagerCount);                                       
                                    }
                                 }   
                                 
                                 function teenagerUp() {
                                    if(teenagerCount >= 8){
                                       $("#selectPeople #teenager button.up").addClass("disabled");
                                    }else {
                                       teenagerCount = teenagerCount + 1;
                                       $("#selectPeople #teenager button.down").removeClass("disabled");
                                       $("#selectPeople #teenager button.result").html(teenagerCount);                                       
                                    }
                                 }   
                                                                  
                                 // ------------------------------------------------------------------------------
                                 let childResult = $("#selectPeople #child button.result").text();
                                 let childCount = Number(childResult);
                                 function childDown() {
                                    if(childCount <= 0){
                                       $("#selectPeople #child button.down").addClass("disabled");
                                    }else {
                                       childCount = childCount - 1;
                                       $("#selectPeople #child button.up").removeClass("disabled");
                                       $("#selectPeople #child button.result").html(childCount);                                       
                                    }
                                 }   
                                 
                                 function childUp() {
                                    if(childCount >= 8){
                                       $("#selectPeople #child button.up").addClass("disabled");
                                    }else {
                                       childCount = childCount + 1;
                                       $("#selectPeople #child button.down").removeClass("disabled");
                                       $("#selectPeople #child button.result").html(childCount);                                       
                                    }
                                 }   
                                 
                                 // ------------------------------------------------------------------------------
                                 let handiResult = $("#selectPeople #handi button.result").text();
                                 let handiCount = Number(handiResult);
                                 function handiDown() {
                                    if(handiCount <= 0){
                                       $("#selectPeople #handi button.down").addClass("disabled");
                                    }else {
                                       handiCount = handiCount - 1;
                                       $("#selectPeople #handi button.up").removeClass("disabled");
                                       $("#selectPeople #handi button.result").html(handiCount);                                       
                                    }
                                 }   
                                 
                                 function handiUp() {
                                    if(handiCount >= 8){
                                       $("#selectPeople #handi button.up").addClass("disabled");
                                    }else {
                                       handiCount = handiCount + 1;
                                       $("#selectPeople #handi button.down").removeClass("disabled");
                                       $("#selectPeople #handi button.result").html(handiCount);                                       
                                    }
                                 }   
                                 
                                 
                                 // ------------------------------------------------------------------------------
                              </script>
                           </div>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-12 disabled" id="seat-part">
                               <hr>
                               <b>SCREEN 화면</b> <span class="door align-right">출구</span>
                               <br>
                               <div class="seatArea">
                              <!-- 좌석 출력되는 부분 -->
                               </div>
                           <div id="beforeBtnArea">   <%-- 영역왼쪽하단에 위치시키고 싶음 --%>
                              <button class="btn btn-secondary" onclick="history.back()"> &lt; 이전</button>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
                <%-- 관람 인원 선택 파트 --%>
<!--                 <div class="col-2.5 border selectPart"> -->
<!--                    <h5>관람 인원 선택</h5> -->
<!--                    <hr> -->
<!--                    <div id="personType"> -->
<!--                       성인 &nbsp;&nbsp;&nbsp;&nbsp;<input type="number"> <br> -->
<%--                       청소년 &nbsp;&nbsp;<input type="number"> <br> 만 7세 초과 ~ 만 18세 미만 --%>
<%--                       경로/어린이 <input type="number"> <br> 만 65세 이상 --%>
<!--                    </div> -->
<!--                    <div id="seatType"> -->
<!--                       <button class="seat"></button> 예매가능 <br> -->
<!--                       <button class="check"></button> 선택좌석 <br> -->
<!--                       <button class="unable"></button> 예매완료 <br> -->
<!--                       <button class="handi"></button> 장애인석 -->
<!--                    </div> -->
<!--                    <hr> -->
<!--                    <button class="btn btn-secondary"><img src="/resources/img/reset.png" width="20px"> 다시 선택하기</button> -->
<!--                 </div> -->
            </div>
            </div>
            
            <%-- 선택사항 안내 구간, 다음으로 넘어가기 --%>
            <div class="row row2">
               <%-- 선택한 영화 포스터와 영화명 노출 --%>
            <div class="col-3">
               <h5>선택 정보</h5>
               <div class="row p-0" id="movieInfo">
                  <div class="col-4 movie_poster"><img src="${reservation.movie_poster }" alt="선택영화포스터" height="90px"></div>
                    <div class="col-8 movie_name_kr"><b>${reservation.movie_name_kr }</b></div><br>
               </div>
            </div>
            
            <%-- 선택한 상영스케줄 노출 --%>
            <div class="col-3">
               <div id="theaterInfo" style="display: table;">
                  <span style="display: table-cell;">극장&nbsp;</span>
                  <span style="display: table-cell;"><b>${reservation.theater_name }</b></span>
               </div>
               <div id="dateInfo" style="display: table;">
                  <span style="display: table-cell;">날짜&nbsp;</span>
<%--                   <span data-play-time-type="${reservation.play_time_type }" style="display: table-cell;"><b>${reservation.play_start_time }</b></span> --%>
                  <span data-play-num="${reservation.play_num }" data-play-start-time="${reservation.play_start_time }" data-play-time-type="${reservation.play_time_type }" style="display: table-cell;"><b>${reservation.play_start_time }</b></span>
               </div>
               <div id="roomInfo" style="display: table;">
                  <span style="display: table-cell;">상영관&nbsp;</span>
                  <span class="roomInfo2" data-play-num="${reservation.play_num }" style="display: table-cell;"><b>${reservation.room_name }</b></span>
               </div>
            </div>
            
                <%-- 미선택 사항 노출 --%>
                <div class="col-2">
               <h5>좌석 선택</h5>
               <div id="seatInfo">
                  <div>좌석명(일반석)</div>
                    <div class="row" id="seat_name"></div>
               </div>
            </div>
            
                <%-- 미선택 사항(결제) 노출 --%>
                <div class="col-2.5">
<!--                    <h5>결제</h5> -->
<%--                    <table> 선택요소들이 ()안에 들어가게 하기 (인원은 x) --%>
<!--                     <tr><td>일반 (10,000 x 2)</td></tr> -->
<!--                     <tr><td>총 금액 (20,000)</td></tr> -->
<!--                  </table> -->
                 <h5>결제</h5>
               <div id="paymentInfo">
                  <div class="row">
                  	<span class="col-6 userType"></span><span class="col-6 ticketPrice"></span>                  
                  </div>
                    <div class="totalPrice"><b></b></div>
               </div>
                </div>
                <%-- 다음 페이지 이동 버튼 --%>
                <div class="col-2 ">
                 <button class="btn btn-danger vertical-center" onclick="location.href='reservation_snack?play_num=${reservation.play_num}&seat_name=' + seatList"> next > </button>
                </div>
            </div>
        </div>
  
  </article>
  <nav id="mainNav">
  <%--왼쪽 사이드바 --%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>