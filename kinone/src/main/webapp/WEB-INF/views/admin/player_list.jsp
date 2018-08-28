<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
	.table>tbody>tr>td, .table>tbody>tr>th,
	.table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
		vertical-align: middle;
		text-align: center;
	}
</style>
<div class="container">
	<div class="wrapper">
		<h1 id="title">선수 리스트</h1>
		<hr> 
			포지션 검색
			<select name="sposition" id="sposition" >
				<option value="">포지션</option>
				<option value="GK">GK</option>
				<option value="FW">FW</option>
				<option value="MF">MF</option>
				<option value="DF">DF</option>
			</select>
			팀 검색
			<select name="teamcode" id="teamcode">
				<option value="">팀</option>
				<c:forEach var="i" items="${cn}">
				<option value="${i.key }">${i.value }</option>
				</c:forEach>
				
			</select>
			<form action="/kinone/admin/plist.do" method="get">
			선수 이름 검색
			<input type="text" name="keyword" > 
			<input type="submit" value="확인">
			</form>


<table class="table table-sm" style="width: 700px;">
	<tr>
	<th>선수 이름</th>
	<th>소속 구단</th>
	<th>포지션</th>
	<th>선수번호</th>
	<th>사진</th>
	</tr>
	<c:if test="${empty list }">
		<tr>
			<td colspan="5">데이터가 없습니다</td>
		</tr>
	</c:if>
	<c:set var="key" value="${0 }"/>
	<c:if test="${not empty list }">
	<c:forEach var="player" items="${list }" >
		<tr>
			<td><a href ="/kinone/admin/pview.do?pcode=${player.pcode}">${player.pname }</a> </td>
			<td><c:set var="key" value="${player.ccode}"/>
					<c:out value="${cn[key]}"/></td>
			<td>${player.position }</td>
			<td>${player.pno }</td>
			<td><img src="/kinone/resources/player/${player.ccode}/${player.pcode}.png" width=60height=100/></td>
			
		</tr>
	</c:forEach>
	</c:if>

</table>
		<c:if test="${empty keyword && empty teamcode &&empty sposition}">
			<c:if test="${pp.startPage > pp.pagePerBlk }">
				<a href="/kinone/admin/plist.do?pageNum=${pp.startPage - 1}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
				<c:if test="${pp.currentPage==i}">${i}</c:if>
				<c:if test="${pp.currentPage!=i}"><a href="/kinone/admin/plist.do?pageNum=${i}">${i}</a></c:if>
			</c:forEach>
			<c:if test="${pp.endPage < pp.totalPage}">
				<a href="/kinone/admin/plist.do?pageNum=${pp.endPage + 1}">다음</a>
			</c:if>
		</c:if>
		<c:if test="${not empty keyword }">
			<c:if test="${pp.startPage > pp.pagePerBlk }">
				<a href="/kinone/admin/plist.do?pageNum=${pp.startPage - 1}&keyword=${player.keyword}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
				<c:if test="${pp.currentPage==i}">${i}</c:if>
				<c:if test="${pp.currentPage!=i}"><a href="/kinone/admin/plist.do?pageNum=${i}&keyword=${player.keyword}">${i}</a></c:if>
			</c:forEach>
			<c:if test="${pp.endPage < pp.totalPage}">
				<a href="/kinone/admin/plist.do?pageNum=${pp.endPage + 1}&keyword=${player.keyword}">다음</a>
			</c:if>
		</c:if>
		<c:if test="${not empty teamcode }">
			<c:if test="${pp.startPage > pp.pagePerBlk }">
				<a href="/kinone/admin/plist.do?pageNum=${pp.startPage - 1}&teamcode=${player.teamcode}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
				<c:if test="${pp.currentPage==i}">${i}</c:if>
				<c:if test="${pp.currentPage!=i}"><a href="/kinone/admin/plist.do?pageNum=${i}&teamcode=${player.teamcode}">${i}</a></c:if>
			</c:forEach>
			<c:if test="${pp.endPage < pp.totalPage}">
				<a href="/kinone/admin/plist.do?pageNum=${pp.endPage + 1}&teamcode=${player.teamcode}">다음</a>
			</c:if>
		</c:if>
		<c:if test="${not empty sposition }">
			<c:if test="${pp.startPage > pp.pagePerBlk }">
				<a href="/kinone/admin/plist.do?pageNum=${pp.startPage - 1}&sposition=${player.sposition}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
				<c:if test="${pp.currentPage==i}">${i}</c:if>
				<c:if test="${pp.currentPage!=i}"><a href="/kinone/admin/plist.do?pageNum=${i}&sposition=${player.sposition}">${i}</a></c:if>
			</c:forEach>
			<c:if test="${pp.endPage < pp.totalPage}">
				<a href="/kinone/admin/plist.do?pageNum=${pp.endPage + 1}&sposition=${player.sposition}">다음</a>
			</c:if>
		</c:if>	
		
			
		
<br>
</div>
	</div>
<script>
$(function(){
	$('#teamcode').change(function(){
		location.replace("/kinone/admin/plist.do?teamcode="+$(this).val());
	})
	
	$('#sposition').change(function(){
		location.replace("/kinone/admin/plist.do?sposition="+$(this).val());
	})
	
});
</script>	
	
<%@ include file="footer.jsp"%>