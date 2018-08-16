<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ page import="com.project.kinone.model.Seats" %>
<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
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
<body>

<h2>결제하기</h2>
<div class="row">
  <div class="col-75">
    <div class="container">
      <form>
        <div class="row">
          <div class="col-50">
            <h3>청구서</h3>
            <label for="fname"><i class="fa fa-user"></i> 이름</label>
            <input type="text" id="fname" name="firstname" placeholder="홍길동">
            <label for="email"><i class="fa fa-envelope"></i> 이메일</label>
            <input type="text" id="email" name="email" placeholder="john@example.com">
            <label for="adr"><i class="fa fa-address-card-o"></i> 주소</label>
            <input type="text" id="adr" name="address" placeholder="서울 특별시 동대문구 제기동 제기로2가길 15-2">
            <label for="city"><i class="fa fa-institution"></i> 세부주소 </label>
            <input type="text" id="city" name="city" placeholder="301호">

            <div class="row">
              <div class="col-50">
                <label for="zip">우편번호</label>
                <input type="text" id="zip" name="zip" placeholder="10001">
              </div>
            </div>
          </div>

          <div class="col-50">
            <h3>결제</h3>
            <label for="fname">이용할 수 있는 카드</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>
            <label for="cname">카드 이름</label>
            <input type="text" id="cname" name="cardname" placeholder="John More Doe">
            <label for="ccnum">신용카드 번호</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
            <label for="expmonth">만료 달</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="September">
            <div class="row">
              <div class="col-50">
                <label for="expyear">만료 해</label>
                <input type="text" id="expyear" name="expyear" placeholder="2018">
              </div>
              <div class="col-50">
                <label for="cvv">CVV 비밀번호</label>
                <input type="text" id="cvv" name="cvv" placeholder="352">
              </div>
            </div>
          </div>
          
        </div>
        <label>
          <input type="checkbox" checked="checked" name="sameadr"> 배송지와 카드 주소지가 동일합니다.
        </label>
        <input type="button" id="subm" value="결제 완료하기" class="btn">
      </form>
    </div>
  </div>
  <div class="col-25">
    <div class="container">
    
    <% String products = request.getParameter("tempa"); 
       String stadium = request.getParameter("stadium");
       String[] product = products.split(",");
       System.out.println(product.length);
       for(int i=0;i<product.length;i++){
           System.out.println(product[i]);
       }
       
       int len = product.length;
       Seats[] seats =new Seats[len];
       int total=0;
       Seats seat = new Seats();
       seat.setPrice(10);
       System.out.println(seat.getPrice());
           for(int k=0; k<product.length;k++){
        	   seats[k] = new Seats();
        	   System.out.println(product[k]);
    	   seats[k].setSeat(product[k]);
    	   int price=0;
    	   System.out.println(product[k].substring(0,1));
    	   if(product[k].substring(0,1).equals("A")){
    		   price=7000;
    	   }else if(product[k].substring(0,1).equals("C")||product[k].substring(0,1).equals("B")){
    		   price=8000;
    	   }else{
    		   price=10000;
    	   }
    	   seats[k].setPrice(price);
    	   total+=price;
       }
       
       pageContext.setAttribute("len", len);
       pageContext.setAttribute("seats", seats);
       pageContext.setAttribute("total", total);
    %>
      <h4><%=stadium %> 좌석 예약<span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b>${len}</b></span></h4>
      <c:forEach var="b" items="${seats}"> 
      <p><a href="#">${b.seat}</a> <span class="price">${b.price}</span></p>
      </c:forEach> 
      <!-- <p><a href="#">Product 2</a> <span class="price">$5</span></p>
      <p><a href="#">Product 3</a> <span class="price">$8</span></p>
      <p><a href="#">Product 4</a> <span class="price">$2</span></p>
       --><hr>
      <p>Total <span class="price" style="color:black"><b>${total}</b></span></p>
    </div>
  </div>
</div>

</body>
<script>
$(function(){
	$("#subm").click(function(){
		alert("이용해주셔서 감사합니다.");
		<%
		String rcode = request.getParameter("rcode"); 
		String mcode = request.getParameter("mcode"); 
		String seatcode = request.getParameter("seatcode"); 
		String ccode = request.getParameter("ccode"); 
		pageContext.setAttribute("rcode", rcode);
		pageContext.setAttribute("mcode", mcode);
		pageContext.setAttribute("seatcode", seatcode);
		pageContext.setAttribute("ccode", ccode);

		%>
		opener.parent.location="pay_complete.do?rcode=${rcode}&mcode=${mcode}&seatcode=${seatcode}&ccode=${ccode}";
		window.close();
	});
});



</script>
</html>
