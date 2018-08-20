<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp"%>
<style>
.pagetitle {
	background-color: violet;
}
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #4CAF50;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}
</style>

<div class="pagetitle"><span>환불</span></div>

<style>
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #4CAF50;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
</style>
</head>
<c:if test="${result==0}">
<script>
alert("당일 환불 및 이미 지나간 표는 환불이 불가합니다.")
history.go(-1);
</script>


</c:if>
<c:if test="${result==1}">
<div class="row">
  <div class="col-75">
    <div class="container">
      <form>
        <div class="row">
          <div class="col-50" style="position:relative;top:100">
            <h3>예약 좌석 정보</h3><br>
          	<label for="cname">경기장: ${shopping.sname} </label>
            <label for="cname">경기 일자: ${shopping.rdate} </label>
            <label for="ccnum">좌석 번호: ${fn:substring(shopping.rcode, fn:length(shopping.rcode)-3, fn:length(shopping.rcode)-2)}열 ${fn:substring(shopping.rcode, fn:length(shopping.rcode)-2, fn:length(shopping.rcode))}좌석 </label>
            <label for="ccnum">경기 이름:${shopping.home_name} vs ${shopping.away_name} </label><br>
             </div>

          <div class="col-50" align="left">
            <h3>환불 계좌  입력</h3><br>
             <label for="fname">구매자</label>
            <input type="text" id="fname" name="firstname" placeholder="홍길동">
            <label for="cname">계좌 예금주</label>
            <input type="text" id="cname" name="cardname" placeholder="John More Doe">
            <label for="cname">계좌 은행</label>
            <input type="text" id="cname" name="cardname" placeholder="하나 은행">
            <label for="ccnum">환불 받을 계좌 번호</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
          </div>
          
        </div>
        <input type="button" id="refund" value="환불 완료하기" class="btn">
      </form>
    </div>
  </div>
</div>

</c:if>
<script>
$(function(){
	$("#refund").click(function(){

		$.ajax({
	        type:"POST",
	        url:"cancel_reservation.do",    
	        data: {"rcode":"${shopping.rcode}"},  
	        success: function (data){
	        	if(data>0){
		        	alert("환불 완료"); 
		        	location.href="mypage.do";
	        	}else{
	        		alert("환불 실패");
	        		history.go(-1);
	        	}
	        }
		}); 
		
		
	});
})



</script>








    <%@ include file="footer.jsp"%>

