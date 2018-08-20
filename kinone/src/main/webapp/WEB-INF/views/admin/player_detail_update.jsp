<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div class="container">
	<div class="wrapper" align="center">
		<h1 id="title">선수 정보 수정</h1>
		<hr> 
<form action="/kinone/admin/pupdate1.do" method="POST" enctype="multipart/form-data">
<input type=hidden name="pcode" value="${player.pcode}">
<table class="table table-sm">
<tr>
	<td colspan=5>선수 기본정보</td>
</tr>
<tr>
	<th>선수 이름</th>
	<th>소속 구단</th>
	<th>백넘버</th>
	<th>포지션</th>
	<th>사진</th>
</tr>
<tr>
	<td><input type="text" name="pname" value="${player.pname }"></td>
	<td><select name="ccode" >
				<option value="">팀</option>
				<c:set var="key" value="${player.ccode }"/>
				<c:forEach var="i" items="${cn}">
				
				<option value="${i.key }"<c:if test="${i.key==key}">selected="selected"</c:if> >${i.value }</option>
				</c:forEach>
			</select></td>
	<td><input type="text" name="pno" value="${player.pno }"></td>
	<td>
			<select name="position">
				<option value="">포지션</option>
				<option value="GK" <c:if test="${player.position=='GK'}">selected="selected"</c:if>>GK</option>
				<option value="DF" <c:if test="${player.position=='DF'}">selected="selected"</c:if>>DF</option>
				<option value="MF" <c:if test="${player.position=='MF'}">selected="selected"</c:if>>MF</option>
				<option value="FW" <c:if test="${player.position=='FW'}">selected="selected"</c:if>>FW</option>
			</select>
	</td>
	<td><input type="file" name="file"></td>
	
</tr>
<tr>
	<td colspan=4>선수 상세정보</td>
</tr>
<tr>
	<th>출생국</th>
	<th>생일</th>
	<th>키</th>
	<th>몸무게</th>
</tr>
<tr>
	<td><input type="text" name="nation" value="${playerd.nation}"></td>
	<fmt:parseDate value="${playerd.birthdate}" var="bd1" pattern="yyyy-MM-dd HH:mm:ss"/>
	<fmt:formatDate value="${bd1}" var="bd2" pattern="yyyy-MM-dd" />
	<td><input type="date" name="birthdate1" value="${bd2}"></td>
	<td><input type="text" name="height" value="${playerd.height }"></td>
	<td><input type="text" name="weight" value="${playerd.weight }"></td>
</tr>
</table><br>


<input type=submit value="수정" >
<input type="button" value="취소" onclick="location.href='/kinone/admin/pview.do?pcode=${player.pcode}'">
<input type="button" value="목록으로" onclick="location.href='/kinone/admin/plist.do'">

</form>
<script>
$(function(){
	
	
})

</script>


</div>
	</div>
<%@ include file="footer.jsp"%>