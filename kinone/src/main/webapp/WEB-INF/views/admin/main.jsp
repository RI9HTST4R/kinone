<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<fmt:formatDate var="year" value="${sysdate}" pattern="yyyy"/>
<style>
	#inputYear {
		width: 100px;
	}
</style>
<script>
	$(function(){
		$("#addbtn").click(function(){
			var season = $("#inputYear").val();
			var current = $("#current").val();
			if(season == ""){
				alert("시즌을 입력하세요");
				return;
			}else if(season <= current){
				alert("현재 시즌 이후의 시즌을 입력하세요");
				return;
			}else {
				$("#addForm").submit();
			}
		});
	})
</script>
<div class="container">
	<div class="wrapper">
		<h1 id="title">시즌 정보</h1>
		<hr>
		<input type="hidden" id="current" value="${seasoncode}"/>
		현재 시즌 : ${seasoncode}
		<br/><br/>
		<h4>새 시즌 추가</h4>
		<form id="addForm" action="${url}/admin/addSeason.do" method="post">
			<input type="number" id="inputYear" name="seasoncode" min="${year}" value="${year+1}" /> 
			<input id="addbtn" type="button" value="추가"/>
		</form>
	</div>
</div>
<%@ include file="footer.jsp"%>