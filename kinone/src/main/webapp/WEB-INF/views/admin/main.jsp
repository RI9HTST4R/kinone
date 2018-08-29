<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<fmt:formatDate var="year" value="${sysdate}" pattern="yyyy"/>
<style>
	#inputYear {
		width: 100px;
	}
	#seasontbl {
		width: 200px;
		text-align: center;
	}
</style>
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
		<br/><br/>
		<h4>시즌 목록</h4>
		<table class="table table-bordered" id="seasontbl">
			<thead>
			<tr>
				<th width="65%" style="text-align: center;">시즌년도</th>
				<th width="35%"></th>
			</tr>
			<thead>
			<tbody>
			<c:forEach var="season" items="${seasonlist}">
			<tr>
				<td>${season}</td>
				<td><input type="button" value="삭제" onClick="delSeason('${season}')"/></td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		
	</div>
</div>
<script>
function delSeason(season){
	$.ajax({
		url: "/kinone/admin/checkSeason.do",
		data: {"seasoncode":season},
		dataType: "text",
		type: "post",
		success: function(data){
		//	alert(data);
			if(data == 1){
				if(confirm("정말로 삭제하시겠습니까?")){
					$.post("/kinone/admin/delSeason.do",{"seasoncode":season},
						function(result){
							if(result > 0){
								alert("삭제되었습니다.");
							}else {
								alert("삭제에 실패하였습니다");
							}
							location.reload();
						}
					);
				}else {
					return;
				}
			}else {
				alert("이미 등록된 경기가 있어 삭제가 불가합니다.");
				return;
			}
		}
	});
}
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
<%@ include file="footer.jsp"%>