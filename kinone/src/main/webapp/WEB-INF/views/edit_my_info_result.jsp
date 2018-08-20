<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp"%>
<style>
.pagetitle {
	background-color: violet;
}
</style>
<c:if test="${result==0}">
<script>
alert("정보 수정 실패");
history.go(-1);


</script>
</c:if>
<c:if test="${result!=0}">
<div class="pagetitle"><span>정보 수정이 완료되었습니다.</span></div>
</c:if>


    <%@ include file="footer.jsp"%>

