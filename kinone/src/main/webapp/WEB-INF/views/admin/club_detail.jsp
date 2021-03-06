<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container">
	<div class="wrapper">
		<h1 id="title">클럽 상세 정보</h1>
		<hr> 
		<table class="table table-bordered">
			<tr>
				<th>클럽명(풀네임)</th>
				<td colspan="2">${ mngC.cname }</td>
			</tr>
			
			<tr>
				<th>클럽명(줄임)</th>
				<td colspan="2">${ mngC.cname_short }</td>
			</tr>
			<tr>
				<th>엠블럼</th>
				<td colspan="2"><img src="${url}/resources/emblem/${ mngC.emblem }" width=200 height=200></td>
			</tr>
			<tr>
				<th>감독명</th>
				<td colspan="2">${ mngC.cmanager }</td>
			</tr>
			<tr>
				<th>경기장명</th>
				<td colspan="2">${ mngC.sname }</td>
			</tr>
			<tr>
				<th width="250px">경기장 위치</th>
				<td colspan="2" align="left">( ${ mngC.lat } , ${ mngC.lon } )</td>
			</tr>
			<tr>
				<th>수용 가능 인원</th>
				<td colspan="2">${ mngC.capacity }</td>
			</tr>			
		</table>
			<input type="button" name="update" value="수정하기" onclick="location='update_club.do?ccode=${mngC.ccode}'">
	</div>
</div>
<%@ include file="footer.jsp"%>

