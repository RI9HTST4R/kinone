<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
.pagetitle {
	background-color: lightgray;
}
.board-subject {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	word-wrap: break-word;
	word-break: break-all;
	line-height: normal;
}
.board-title {
	color: black;
}
.table > thead > tr > th, .table > tbody > tr > td{
	font-size: 12pt;
	vertical-align: middle;
	height: 30px;
}
</style>

<div class="pagetitle"><span>마이 페이지</span></div>
		${name}님 환영합니다! 
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 900px;
  margin: auto;
  text-align: center;
  font-family: arial;
}

.title {
  color: grey;
  font-size: 18px;
}

#qk{
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}



button:hover, a:hover {
  opacity: 0.7;
}
</style>
</head>
<body>

<h2 style="text-align:center">${name}님의 마이페이지 </h2>

<div class="card">
  <p class="title">나의 결제 내역</p>
  <div style="margin: 24px 0;">
  <div id="items" align="center">
  
  <c:forEach var="t" items="${basket}">
  <div align="justify" style="border:solid gray 1px; width:90%;height:200px;">
	<img style="margin-left:20px; margin-top:30px;" src="${url}/resources/emblem/${t.home_code}.png" width="90px" height="90px"><font size=25px style="font-weight:bold;position:relative;top:30px;">vs</font>  <img src="${url}/resources/emblem/${t.away_code}.png"  style=" margin-top:30px;" width="90px" height="90px">
  	  	<font size="5px" style="font-weight:bold; margin-left:40px;position:relative;top:27px;">${t.sname}<br></font>
  	<font size="5px" style="position:relative; top:18px; font-weight:bold; margin-left:15px;" >${t.home_name} vs ${t.away_name}</font><br>
  	<font style="position: absolute;right: 8%;margin-top: -150;">경기 일자: ${t.rdate}</font><br>
  	<font style="margin-left: 15px; position: relative; bottom:5px;">예약 번호: <a id="barcode" href=""> ${t.rcode}</a></font>
  <button style="position: absolute;right: 8%;margin-top: -100;width:150px;" type="button" class="btn btn-info" onclick="location.href='boardList_edit.do?page=${page}&bno=${bcont.bno}'" >환불하기 </button><br>
  <button style="position: absolute;right: 8%;margin-top: -80;width:150px;" type="button" class="btn btn-info" onclick="location.href='boardList.do?page=${page}'" >예매 페이지 이동</button>
  </div>
  <br>
  
  </c:forEach>
   </div>
  
  
  
    <a href="#"><i class="fa fa-dribbble"></i></a> 
    <a href="#"><i class="fa fa-twitter"></i></a>  
    <a href="#"><i class="fa fa-linkedin"></i></a>  
    <a href="#"><i class="fa fa-facebook"></i></a> 
 </div>
 <button id="qk">회원 정보 수정하기</button>
</div>
<script>
$(function(){
	$("[id='barcode']").click(function(){
		//alert($(this).text().trim());
		var rcode=$(this).text().trim();
		var ref="barcode.do?rcode="+rcode;
		window.open(ref, "a", "width=470, height=30, left=100, top=50");
	});
})

</script>
		
<%@ include file="footer.jsp" %>