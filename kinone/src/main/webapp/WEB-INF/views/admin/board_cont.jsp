<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<style>


* {
    box-sizing: border-box;
}

/* Add padding to containers */
.container {
    padding: 16px;
    background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}

/* Overwrite default styles of hr */
hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
    background-color: #4CAF50;
    color: white;
    padding: 16px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}

.registerbtn:hover {
    opacity: 1;
}

/* Add a blue text color to links */
a {
    color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
    background-color: #f1f1f1;
    text-align: center;
}
</style>
</head>
<body>

<form >
  <div class="container">
    <h1>상세 내용</h1>
    <hr>

	
	<font size="6px">제목 : ${bcont.subject}</font>  <font size="4px" style="float:right;font-style: italic;padding-top:20px;" > readcount: ${bcont.readcount}  </font>
	
	<hr>
  	<div id="content" align="center">
  	
  	
  	
  	<c:if test="${empty bcont.image}">
       &nbsp;
       </c:if>
       <c:if test="${!empty bcont.image}">
       <img src="${url}/resources/board_upload/${bcont.image}" /><br><br><br><br>
       </c:if>
      <font size="4px" style="float:right;font-style: italic;" > written by admin</font><br><br><br><br>
  	${bcont.content}
  	
  	
  	
  	</div>
  
  
  
  
  
  
    <hr>

    <button type="button" class="registerbtn" onclick="location.href='boardList.do?page=${page}'">게시판 목록</button>
  </div>
  
 
</form>
<%@ include file="footer.jsp" %>