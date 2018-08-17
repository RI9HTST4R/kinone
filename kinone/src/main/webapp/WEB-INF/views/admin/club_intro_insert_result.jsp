<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<script>
<c:if test="${result==1}">
alert("수정 성공");
location.href='clubIntro.do';
</c:if>
<c:if test="${result!=1}">
alert("수정 실패");
history.go(-1);
</c:if>

	</script>
<%@ include file="footer.jsp" %>