<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div class="container">
	<div class="wrapper" align="center">
		<h1 id="title">시즌 정보</h1>
		<hr> 
<h2>${player.pname}선수 정보</h2>
<table class="table table-sm">
<tr>
	<td colspan=5>선수 기본정보</td>
</tr>
<tr>
	<td>선수 이름</td>
	<td>소속 구단</td>
	<td>백넘버</td>
	<td>포지션</td>
	<td>사진</td>
	
</tr>

<tr>
	<td>${player.pname}</td>
	<td>${player.ccode}</td>
	<td>${player.pno }</td>
	<td>${player.position}</td>
	<td><img src="/kinone/resources/player/${player.photo }" width=60height=100/></td>
	
</tr>
<tr>
	<td colspan=5>선수 상세정보</td>
</tr>

<tr>
	<td>출생국</td>
	<td>생일</td>
	<td>키</td>
	<td>몸무게</td>
	<td></td>
</tr>
<tr>
	<td>${playerd.nation}</td>
	<td>${playerd.birthdate}</td>
	<td>${playerd.height}</td>
	<td>${playerd.weight}</td>
	<td></td>
</tr>
<tr>
	<td colspan=5>선수 시즌별 정보</td>
</tr>
<tr>
	<td>시즌</td>
	<td>출장수</td>
	<td>득점</td>	
	<td>실점</td>
	<td>도움</td>
</tr>
<c:forEach var="players" items="${players}" >
	<c:if test="${empty players.seasoncode}">
	</c:if>
	<c:if test="${not empty players.seasoncode}">
	<tr>
		<td>${players.seasoncode}</td>
		<td>${players.gamecount}</td>
		<td>${players.p_ggoal}</td>
		<td>${players.p_lgoal}</td>
		<td>${players.p_assist}</td>
	</tr>
	</c:if>
</c:forEach> 
</table>


<input type="button" value="기본정보수정" onclick="location.href='/kinone/admin/pupdateForm1.do?pcode=${player.pcode}'">
<input type="button" value="시즌정보수정" onclick="location.href='/kinone/admin/pupdateForm2.do?pcode=${player.pcode }'">
<input type="button" value="시즌정보업데이트" onclick="location.href='/kinone/admin/pupdateForm3.do?pcode=${player.pcode }'">
<input type="button" value="삭제" id="pdelete" onclick="pdelete('${player.pcode}')" >
<input type="button" value="목록" onclick="location.href='/kinone/admin/plist.do?pageNum=1'">
</div>
	</div>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	
	function pdelete(pcode){
		
		var result = confirm('정말로 삭제하시겠습니까?');
		if(result) { //yes 
			location.replace('/kinone/admin/pdelete.do?pcode='+pcode); 
		} else { //no
			return;
				}
			}
	
	

</script>	
	
<%@ include file="footer.jsp"%>