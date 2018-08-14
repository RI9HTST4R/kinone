<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기 예매 페이지</title>
<style>
.pagetitle {
	background-color: violet;
}
</style>
<link href='//fonts.googleapis.com/css?family=Kotta+One' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<link href="${url}/resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
<script src="${url}/resources/js/jquery-1.11.0.min.js"></script>
<script src="${url}/resources/js/jquery.seat-charts.js"></script>
</head>
<body>
<div class="pagetitle"><span>K In One 경기 예매</span></div>
<%-- <img width=80% height =80% src="${url}/resources/images/cowboys_seating_chart.jpg"></img>
 --%>


<div class="content">
	<h1><font color=black>${home.cname} vs ${away.cname}</font></h1>
	<div class="main" style="width:920px; padding-right:0px;padding-left:0px;">
		<h2>좌석 선택</h2>
		<div class="demo">
			<div id="seat-map" style="width:757px;">
			</div>
			</div> 
			<div id="legend"></div>
			
			<div class="booking-details">
			
				<ul class="book-left">
					<li>경기 </li>
					<li>시간 </li>
					<li>매수</li>
					<li>총 가격</li>
					<li>선택한 좌석 :</li>
				</ul>
				<ul class="book-right">
					<li>: ${home.cname} vs ${away.cname} </li>
					<li>: 
					<fmt:formatDate value="${m.mdate}" pattern="yyyy.MM.dd aa hh:mm"/>
					</li>
					<li>: <span id="counter">0</span></li>
					<li>: <b><span id="total">0</span><i>원</i></b></li>
				</ul>
				<div class="clear"></div>
				<ul id="selected-seats" class="scrollbar scrollbar1"></ul>
				<button class="checkout-button">Book Now</button>

			</div>
			<div style="clear:both"></div>
	    </div>
		<input type="hidden" id="mcode" value="${m.mcode}">
		<input type="hidden" id="rcode" value="${m.mcode}+회원번호">
			<script type="text/javascript">
			
			
			var seat_num = 1;
			var seat_num2 = 1;
			var seat_num3 = 1;
			var seat_num4 = 1;
				var price = 0; //price
				var total = 0;
				$(document).ready(function() {
					$(".checkout-button").click(function(){
						$("#selected-seats li").each(function(){
				            var regExp = /\d+/i;
				            var ke = $(this).text();
				            var num = ke.match(regExp);
				            var key = $(this).attr('id');
				            var key1 = key.replace('cart-item-',''); //좌석번호 아이디 ;
				            var key2 = ke.slice(0,1); //좌석의 구역;
				            if(num.toString().length!=2){
				            	num = "0"+num;
				            }
				            alert(key1);
				            alert(key2);
				            alert(num);
				        });
					});
					
					
					
					
					var $cart = $('#selected-seats'), //Sitting Area
					$counter = $('#counter'), //Votes
					$total = $('#total'); //Total money

					var sc = $('#seat-map').seatCharts({
						map: [  //Seating chart
							'_____aaaaaaaaa______',
							'____aaaaaaaaaaaa____',
							'___aaaaaaaaaaaaaa___',
							'__aaaa________aaaa__',
							'_aaaa__________aaaa_',
							'_aaa____________aaa_',
							'_aaa____________aaa_',
							'_aaa____________aaa_',
							'_aaaa__________aaaa_',
							'__aaaa________aaaa__',
							'___aaaaaaaaaaaaaa___',
							'____aaaaaaaaaaaa____',
							'_____aaaaaaaaa______'
						],
						naming : {
							top : false,
							getLabel : function (character, row, column) {
								return column;
							}
						},
						legend : {
							node : $('#legend'),
							items : [
								[ 'a', 'skyblue',   '7000원'],
								[ 'a', 'gold',   '8000원'],
								[ 'a', 'green',   '8000원'],
								[ 'a', 'violet',   '10000원'],
								[ 'a', 'unavailable', '팔렸음'],
								[ 'a', 'selected', '선택됨']
							]
						},
						click: function () {
							if (this.status() == 'available') {
								var k=0;
								$(".selected").each(function(){
									k++;
								});
								if(k>10){
									alert("10개까지 가능합니다.");
									return false;
								}
								
								var con = $("#"+this.settings.id).html();
								var back = $("#"+this.settings.id).css('background-color');
								$("#"+this.settings.id).css('background','red');
								$("#"+this.settings.id).attr('temp',back);
								if(back=='rgb(0, 128, 0)'){
									back = 'C';
									price = 8000;

								}else if(back=='rgb(135, 206, 235)'){
									back = 'A';
									price = 7000;

								}else if(back=='rgb(125, 38, 205)'){
									back = 'D';
									price = 10000;

								}else if(back=='rgb(255, 215, 0)'){
									back = 'B';
									price = 8000;

								}

								$('<li>'+back+'좌석 '+con+'</li>')
									.attr('id', 'cart-item-'+this.settings.id)
									.data('seatId', this.settings.id)
									.appendTo($cart);

								$counter.text(sc.find('selected').length+1);
								total = total + price;
								$total.text(total);
								price = 0;

								return 'selected';
							} else if (this.status() == 'selected') {
								var precolor = $("#"+this.settings.id).attr('temp');
								$("#"+this.settings.id).css('background',precolor);
									$counter.text(sc.find('selected').length-1);

								var back = $("#"+this.settings.id).css('background-color');

								if(back=='rgb(0, 128, 0)'){
									back = 'green';
									price = 8000;
								}else if(back=='rgb(135, 206, 235)'){
									back = 'skyblue';
									price = 7000;
								}else if(back=='rgb(125, 38, 205)'){
									back = 'violet';
									price = 10000;
								}else if(back=='rgb(255, 215, 0)'){
									back = 'yellow';
									price = 8000;
								}

								total = total - price;
								$total.text(total);

									$('#cart-item-'+this.settings.id).remove();
									return 'available';
							} else if (this.status() == 'unavailable') { //sold
								return 'unavailable';
							} else {
								return this.style();
							}
						}
					});
					// sc.get(['1_2', '4_4','4_5','6_6','6_7','8_5','8_6','8_7','8_8', '10_1', '10_2']).status('unavailable');
					
					for(var l=1;l<=4;l++){
						for(var k =1;k<30;k++){

							if($(document).find("#"+l+"_"+k).html()!=null){
									if(l==3&&k>=7&&k<=14){
										$("#"+l+"_"+k).css('background','#7D26CD');
										$("#"+l+"_"+k).html(seat_num4);
										seat_num4++;
									}else if(l==4&&k>=6&&k<=15){
										$("#"+l+"_"+k).css('background','#7D26CD');
										$("#"+l+"_"+k).html(seat_num4);
										seat_num4++;
									}else{
										$("#"+l+"_"+k).css('background','green');
										$("#"+l+"_"+k).html(seat_num);
										seat_num++;
									}
								}

						}
					}
					for(var l=5;l<=9;l++){
						for(var k =1;k<30;k++){
										if($(document).find("#"+l+"_"+k).html()!=null){
									$("#"+l+"_"+k).css('background','skyblue');
									$("#"+l+"_"+k).html(seat_num2);
									seat_num2++;


							}

						}
					}

					for(var l=10;l<=13;l++){
						for(var k =1;k<30;k++){
							if($(document).find("#"+l+"_"+k).html()!=null){

									if(l==10&&k>=6&&k<=15){
										$("#"+l+"_"+k).css('background','#7D26CD');
										$("#"+l+"_"+k).html(seat_num4);
										seat_num4++;
									}
									else if(l==11&&k>=7&&k<=14){
										$("#"+l+"_"+k).css('background','#7D26CD');
										$("#"+l+"_"+k).html(seat_num4);
										seat_num4++;
									}
									else{
										$("#"+l+"_"+k).css('background','gold');
										$("#"+l+"_"+k).html(seat_num3);
										seat_num3++;
									}

							}

						}
					}
				});
			</script>
	</div>
</body>
</html>