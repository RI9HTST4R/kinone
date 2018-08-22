<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<style>
.container {
	display: block;
	padding: 0;
	margin: 0;
}
a:hover {
	text-decoration: none;
	color: red;
}
h1#title {
	margin-top: 0px;
}
.search-wrapper {
	height: 50px;
}
select.form-control {
	display: inline-block;
	width: 118px;
	padding: 0px;
	border-radius: 2px;
	margin-bottom: 1rem;
	height: 30px;
}
input[type="text"] {
	width: 200px;
	display: inline-block;
	height: 30px;
	padding: 0px 5px;
	border-radius: 2px;
	margin: 0 5px;
}
.table {
	max-width: 980px;
	border-bottom: 2px solid lightgray;
}
.table>tbody>tr>td, .table>tbody>tr>th, 
.table>tfoot>tr>td, .table>tfoot>tr>th, 
.table>thead>tr>td, .table>thead>tr>th {
	text-align: center;
	vertical-align: middle;
}

.table tr>td.last-td {
	text-align: left;
}

.before-m {
	color: blue;
}
.after-m {
	color: red;
}
.tbl-btn, .tbl-btn:hover {
	text-decoration: none;
	background-color: white;
	color: black;
	border: 1px solid lightgray;
	padding: 5px 10px 5px 10px;
	font-size: 10pt;
	cursor: pointer;
}
.tbl-btn:hover {
	background-color: lightgray;
	color: white;
}
a.active {
	background-color: lightgray;
	color: white;
}
span.example {
	font-style: italic;
	color: gray;
	font-size: 10pt;
}
.after-m + .tooltip > .tooltip-inner {
      background-color: black; 
      color: white; 
      padding: 5px;
      font-size: 15px;
}
.pagingwrapper {
	width: 980px;
}
.pagination {
	display: inline-flex;
}

</style>
<script>
	function category(name){
		var selectedvalue = $("select[name="+name+"]").val();
	}
	
	function cancel(obj){ // 날짜편집 창 끄기
		var $tr = $(obj).parents().eq(1);
		$tr.prev().find(".editDate").removeClass("active");
		$tr.remove();
	}
	
	function validcheck($cdate){ // 날짜 변경시 유효성 검사
		var cdate = $.trim($cdate.val());
		
		if(cdate === ""){
			alert("변경할 날짜를 입력하세요.");
			$cdate.val("").focus();
			return false;
		}else {
			var mdateRegex = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])\s([1-9]|[01][0-9]|2[0-3]):([0-5][0-9])$/;
			if(!mdateRegex.test(cdate)){
				alert("형식에 맞게 입력하세요.");
				$cdate.val("").focus();
				return false;
			}else {
				return true;
			}
		}
	}
	
	function duplcheck(obj){ // 변경될 날짜로 인해 변경되는 mcode를 가진 데이터가 있는지 확인
		var mcode = $(obj).parents().eq(1).prev().find(".mcode").text();
		var $cdate = $("#cdate");
		var bool = validcheck($cdate);
		if(bool){
			var lcode = $("#lcode option:selected").text();
		//	alert(lcode);
			var cdate = $.trim($cdate.val());
			$.ajax({
				url:"/kinone/admin/mcodeDuplCheck.do",
				data: {"mcode":mcode, "cdate":cdate},
				dataType: "text",
				type: "post",
				success: function(data){
				//	alert(data);
					var $result = $("#duplresult");
					$result.empty();
					var result = parseInt($.trim(data));
					if(result === 0){
						$result.addClass("before-m");
						$result.text("변경가능");
					}else {
						$result.addClass("after-m");
						$result.text("변경불가");
					}
				}
			});
		}	
	}
	
	function changeDate(obj){ // 매치 날짜 변경
		var $cdate = $("#cdate");
		var bool = validcheck($cdate);
	//	alert(bool);
		if(bool){
			var cdate = $.trim($cdate.val());
			var mcode = $(obj).parents().eq(1).prev().find(".mcode").text();
		//	alert(mcode);
			$.ajax({
				url:"/kinone/admin/changeMdate.do",
				data: {"mcode":mcode, "cdate":cdate},
				dataType: "text",
				type: "post",
				success: function(data){
				//	alert(data);
					if(data == 1){
						alert("변경 완료!");
						
					}else {
						alert("변경 실패..");
					}
					location.reload();
				}
			});
		}
	}
	
	function allcheckbox(bool){ // 전체 체크/체크 해제
	//	alert(bool);
		$("input:checkbox[name='match_checkbox']").prop("checked", bool);
	}
	
	function getSelectedCheckboxValue(arr){ // 선택된 체크박스의 value값을 배열에 담는다
		$("input:checkbox[name='match_checkbox']").each(function(){
			if(this.checked){
			//	alert(this.value);
				arr.push(this.value);
			}
		});
	}
	
	function matchDel(mcode){ // 삭제 버튼 눌렀을 때
		var mcodearr = new Array();
	//	alert(mcode);
		if(mcode == undefined){
			getSelectedCheckboxValue(mcodearr);
			if(mcodearr.length === 0){
				alert("삭제하실 매치를 선택하세요.");
				return;
			}
		}else {
			mcodearr.push(mcode);
		}
	//	alert(mcodearr);
		
		if(confirm("정말로 삭제하시겠습니까?")){
			// 배열 형태의 데이터를 넘기기 위한 설정(반드시!)
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url: "/kinone/admin/deleteMatch.do",
				data: {"array":mcodearr},
				dataType: "text",
				type: "post",
				success: function(data){
				//	alert(data);
					var resultarr = data.split("/");
					alert(resultarr[1] + "건의 매치 데이터 중 "+resultarr[0]+"건의 데이터가 삭제되었습니다.");
					location.reload();
				}
			});
		}
	}
	
	function goSearch(){ // 검색 버튼 눌렀을 때
		var seasoncode = $("#seasoncode").val();
		var lcode = $("#lcode").val();
		var category = $("#category").val();
		var keyword = $.trim($("#keyword").val());
	//	alert("seasoncode:"+seasoncode);
	//	alert("lcode:"+lcode);
	//	alert("category:"+category);
	//	alert("keyword:"+keyword);
		if(seasoncode == "" && lcode == "" && keyword == ""){
			alert("조건을 선택하시거나 검색어를 입력하세요.");
			return;
		}else {
			if(category == "mstatus" && keyword.length > 0){
				if(keyword == "경기전"){
					$("#keyword").val("0");
				}else {
					$("#keyword").val("1");
				}
			}
			$("#searchForm").submit();
		}
	}
	
	function matchEdit(mcode){ // 편집 버튼 눌렀을때 페이지 이동
	//	alert(mcode);
		$("#hideInput").val(mcode);
		$("#goEdit").submit();		
	}
	
	$(function(){
		// 종료된 경기의 상태에 툴팁 나타냄
		$('[data-toggle="tooltip"]').tooltip();
		
		// 날짜 변경 버튼 클릭
		$(".editDate").each(function(){
			$(this).on("click", function(){
				$(".editDate").removeClass("active");
				$(".match-change").remove();
				$(this).parents().eq(1).after(
				'<tr class="match-change">'
				+'<td></td>'
				+'<td><span style="color: red; font-weight: bold;"><i class="fas fa-chevron-right"></i> 변경될 날짜</span></td>'
				+'<td><input type="text" class="form-control" id="cdate" name="cdate" style="width: 130px;"/></td>'
				+'<td><a class="tbl-btn" onClick="duplcheck(this)">체크</a></td>'
				+'<td><span id="duplresult"></span></td>'
				+'<td class="last-td" colspan="3"><a class="tbl-btn" onClick="changeDate(this)">변경</a> <a class="tbl-btn" onClick="cancel(this)">취소</a> '
				+'<span class="example">예) 20180804 19:00</span>'
				+'</td></tr>');
				$(this).addClass("active");
			});
		});
	})
</script>
<div class="container">
	<c:set var="seasoncode" value="${condition['seasoncode']}"/>
	<c:set var="lcode" value="${condition['lcode']}"/>
	<c:set var="category" value="${condition['category']}"/>
	<c:set var="keyword" value="${condition['keyword']}"/>
	<div class="wrapper">
		<h1 id="title">등록된 매치 목록</h1>
		<hr>
		<div class="search-wrapper">
			<form id="searchForm" name="searchForm" method="get" action="${url}/admin/matchList.do">
				<select id="seasoncode" name="seasoncode" class="form-control">
					<option value="">전체시즌</option>
				<c:forEach var="season" items="${seasonList}">
					<option <c:if test="${seasoncode == season}">selected</c:if>>${season}</option>
				</c:forEach>
				</select>
				
				<select id="lcode" name="lcode" class="form-control">
					<option value="">전체리그</option>
				<c:forEach var="league" items="${leagueList}">
					<option <c:if test="${lcode == league}">selected</c:if>>${league}</option>
				</c:forEach>
				</select>
				<select id="category" name="category" class="form-control">
					<option value="mcode" <c:if test="${category == 'mcode'}">selected</c:if>>매치코드</option>
					<option value="ccode" <c:if test="${category == 'ccode'}">selected</c:if>>구단코드</option>
					<option value="cname_short" <c:if test="${category == 'cname_short'}">selected</c:if>>구단명</option>
					<option value="mround" <c:if test="${category == 'mround'}">selected</c:if>>라운드</option>
					<option value="mstatus" <c:if test="${category == 'mstatus'}">selected</c:if>>상태</option>
				</select>
				<!-- <br/> -->
				<input type="text" class="form-control" id="keyword" name="keyword" value="${keyword}"/>
				<a class="tbl-btn" onClick="goSearch()">검색</a>
			</form>
		</div>
		<a class="tbl-btn" onClick="javascript:location.href='${url}/admin/matchList.do'">전체 목록</a>
		<a class="tbl-btn" id="multiDel" onClick="matchDel()">선택 삭제</a><br/><br/>
		<div class="table-wrapper">
			<table class="table table-sm">
				<thead>
					<tr>
						<th style="width: 45px;"><input type="checkbox" id="allcheck"  onChange="allcheckbox(this.checked)"/></th>
						<th style="width: 190px;">매치 코드</th>
						<th style="width: 180px;">매치 일시</th>
						<th style="width: 110px;">홈</th>
						<th style="width: 110px;">어웨이</th>
						<th style="width: 64px;">라운드</th>
						<th style="width: 80px;">상태</th>
						<th style="max-width: 201px;"></th>
					</tr>
				</thead>
				<tbody>
			<c:if test="${empty matchList}">
					<tr class="match-info">
						<td colspan="7"><span style="font-weight: bold; color: red; font-size: 10pt;">매치가 없습니다.</span></td>
					</tr>
			</c:if>
			<c:if test="${not empty matchList}">
				<c:forEach var="match" items="${matchList}">
					<tr class="match-info">
						<td><c:if test="${match.mstatus == 0}"><input type="checkbox" name="match_checkbox" value="${match.mcode}"/></c:if></td>
						<td class="mcode">${match.mcode}</td>
						<td><fmt:formatDate value="${match.mdate}" pattern="yy/MM/dd HH:mm"/></td>
						<td>${match.cname_short_h}(${match.ccode_home})</td>
						<td>${match.cname_short_a}(${match.ccode_away})</td>
						<td>${match.mround}</td>
					<c:if test="${match.mstatus == 0}">
						<td><span class="before-m">경기전</span></td>
						<td class="last-td"><a class="tbl-btn" onClick="matchEdit('${match.mcode}')">편집</a> <a class="tbl-btn editDate">날짜 변경</a> <a class="tbl-btn cancelMatch" onClick="matchDel('${match.mcode}')">삭제</a></td>
					</c:if>
					<c:if test="${match.mstatus == 1}">
						<td><a class="after-m" data-toggle="tooltip" data-placement="bottom" title="${match.homescore}:${match.awayscore}">경기종료</a></td>
						<td class="last-td"><a class="tbl-btn" onClick="matchEdit('${match.mcode}')">상세보기</a></td>
					</c:if>
					</tr>
				</c:forEach>
			</c:if>
				</tbody>
			</table>
			<div class="pagingwrapper" align="center">
				<ul class="pagination">
				<c:choose>
					<%-- 전체 목록의 페이징 처리 --%>
					<c:when test="${empty keyword and empty seasoncode and empty lcode}">
						<c:if test="${pp.startPage > pp.pagePerBlk}">
							<li><a href="${url}/admin/matchList.do?pageNum=${pp.startPage - 1}">&lt;</a></li>
						</c:if>
						<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
							<li <c:if test="${pp.currentPage==i}">class="active"</c:if>>
								<a href="${url}/admin/matchList.do?pageNum=${i}">${i}</a></li>
						</c:forEach>
						<c:if test="${pp.endPage < pp.totalPage}">
							<li><a href="${url}/admin/matchList.do?pageNum=${pp.endPage + 1}">&gt;</a></li>
						</c:if>
					</c:when>
					
					<%-- 검색 했을 경우의 페이징 처리 --%>
					<c:otherwise>
						<c:if test="${pp.startPage > pp.pagePerBlk }">
							<li><a href="${url}/admin/matchList.do?pageNum=${pp.startPage - 1}&seasoncode=${seasoncode}&lcode=${lcode}&category=${category}&keyword=${keyword}">&lt;</a></li>
						</c:if>
						<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
							<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
								href="${url}/admin/matchList.do?pageNum=${i}&seasoncode=${seasoncode}&lcode=${lcode}&category=${category}&keyword=${keyword}">${i}</a></li>
						</c:forEach>
						<c:if test="${pp.endPage < pp.totalPage}">
							<li><a href="${url}/admin/matchList.do?pageNum=${pp.endPage + 1}&seasoncode=${seasoncode}&lcode=${lcode}&category=${category}&keyword=${keyword}">&gt;</a></li>
						</c:if>
					</c:otherwise>
				</c:choose>
				</ul>
			</div>
		</div>
		
			<c:choose><c:when test=""></c:when><c:otherwise></c:otherwise></c:choose>
		
	</div>
	<form id="goEdit" method="post" action="${url}/admin/matchDetailForm.do" >
		<input type="hidden" id="hideInput" name="mcode"/>
	</form>
</div>



<%@ include file="footer.jsp"%>
