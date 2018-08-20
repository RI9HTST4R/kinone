<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp"%>


<c:if test="${result==1}">
<script>
alert("회원탈퇴 성공~ 그동안 이용해주셔서 감사드립니다.");
location.href="logout.do";
</script>
</c:if>
<c:if test="${result!=1}">
alert("회원탈퇴 실패");
history.go(-1);
</c:if>