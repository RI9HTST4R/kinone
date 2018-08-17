<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
.anchor-btn, .anchor-btn:hover {
text-decoration: none;
background-color: white;
color: black;
border: 1px solid lightgray;
padding: 5px 10px 5px 10px;
font-size: 10pt;
cursor: pointer;
width: 50px;
text-align: center;
}
.anchor-btn:hover {
background-color: lightgray;
color: white;
}
.lineup-container {
  display: inline-block;
  /* border: 1px solid red; */
  margin: 0 20px;
}
.clubname {
  text-align: center;
}
.lineup-content {
  padding: 10px;
  border: 1px solid lightgray;
  display: table;
  background-color: lightgray;
}
.playerlist, .lineup-wrapper {
  display: inline-block;
}
.lineup, .deletebtn {
  display: table;
  width: 100%;
  /* border: 1px solid green; */
}
.deletebtn {
	margin: 15px 0 15px 0;
	text-align: right;
}
.delbtn, .delbtn:hover {
	font-size: 8pt;
}
.selectbtn, .selectbox {
  display: table-cell;
}
.selectbox {
  width: 200px;
  /* border: 1px solid blue; */
}
.selectbtn {
  width: 50px;
  /* border: 1px solid blue; */
  vertical-align: middle;
  text-align: center;
}
/* -------------여기까지 라인업------------------ */
/* -------------여기부터 스코어------------------ */
#scorenstatus {
  /* border: 1px solid red; */
  /* height: 200px; */
  margin: 40px 0px 20px 20px;
}
.score {
  width: 50px;
  margin: 0 5px;
}
.scoreform-container {
  margin-top: 10px;
}

</style>

<script>
// 선발, 후보 라인업 전체 삭제
function delAllList(listname, obj){
	$(obj).parents().eq(1).find("."+listname).children().empty();
}

// 선택한 선수 목록 삭제
function delPlayer(btn){
	var onFocusObj = $("#focusObj").val();
//	alert(onFocusObj);
	
	var delarea = $(btn).parents().eq(1).find("."+onFocusObj);
	if($(delarea).attr('class') != undefined){
		$(delarea).find("option:selected").remove();
	}
	
}

// 셀렉트박스 포커스 될때 포커스 된 셀렉트박스 이름 저장
function addFocusObj(obj){
	$obj = $(obj);
	var classes = $obj.attr('class');
	var focusClass = classes.slice(10);
	$("#focusObj").val(focusClass);
}

// 선수를 라인업에 넣기
function selected(obj){
	var plist = $(obj).parents().eq(3).find(".selectbox"); // 선수리스트
	var lineupObj = $(obj).parents().eq(1).find(".selectbox > optgroup"); // 라인업리스트
	
	// 선택된 선수의 pcode
	var plistArr = plist.val();
	var plistText = [];
	plist.find("option:selected").each(function(){
		plistText.push($(this).text());
	});
	for(var i=0; i<plistArr.length; i++){
		lineupObj.append("<option value='"+plistArr[i]+"'>"+plistText[i]+"</option>");
	}	
}

// 저장 버튼을 눌러 편집 완료
function save(mcode){
	var hStartArr = new Array();
	var hSubArr = new Array();
	var aStartArr = new Array();
	var aSubArr = new Array();
	
	$("#homestarting option").each(function(index, item){
		hStartArr.push(item.value);
	});
	$("#homesub option").each(function(index, item){
		hSubArr.push(item.value);
	});
	$("#awaystarting option").each(function(index, item){
		aStartArr.push(item.value);
	});
	$("#awaysub option").each(function(index, item){
		aSubArr.push(item.value);
	});
	
	var hLineup = "";
	var aLineup = "";
	
	if(hStartArr.length == 11){
		if(hSubArr.length > 7){
			alert("홈팀의 후보 라인업 선수 숫자가 맞지 않습니다.");
			return;
		}else {
			hLineup += hStartArr.join(",");
			hLineup += "/";
			hLineup += hSubArr.join(",");
		}
	}else if(hStartArr.length > 0 && hStartArr.length < 11){
		alert("홈팀의 선발 라인업 선수 숫자가 맞지 않습니다.");
		return;
	}else if(hStartArr.length == 0){
		if(hSubArr.length > 0){
			alert("선발/후보 라인업을 모두 입력하세요.");
			return;
		}
	}
	
	
	if(aStartArr.length == 11){
		if(aSubArr.length > 7){
			alert("홈팀의 후보 라인업 선수 숫자가 맞지 않습니다.");
			return;
		}else {
			aLineup += aStartArr.join(",");
			aLineup += "/";
			aLineup += aSubArr.join(",");
		}
	}else if(aStartArr.length > 0 && aStartArr.length < 11){
		alert("홈팀의 선발 라인업 선수 숫자가 맞지 않습니다.");
		return;
	}else if(aStartArr.length == 0){
		if(aSubArr.length > 0){
			alert("선발/후보 라인업을 모두 입력하세요.");
			return;
		}
	}
	
	$.ajax({
		url: "/kinone/admin/updateMatchDetail.do",
		data: {"mcode":mcode, "homelineup":hLineup, "awaylineup":aLineup},
		dataType: "text",
		type: "post",
		success: function(data){
		//	alert(data);
			var result = parseInt($.trim(data));
			if(result === 1){
				alert("수정되었습니다.");
			}else {
				alert("실패..");
			}
			location.reload();
		}
	});	
}

// 스코어 등록
function saveScore(mcode){
	if(confirm("경기 종료 처리 및 스코어 등록을 하시겠습니까?")){
		var homescore = $("#hscore").val();
		var awayscore = $("#ascore").val();
		
		$.ajax({
			url: "/kinone/admin/matchEnd.do",
			data: {"mcode":mcode, "homescore":homescore, "awayscore":awayscore},
			dataType: "text",
			type: "post",
			success: function(data){
				alert(data);
				var result = parseInt($.trim(data));
				if(result === 1){
					alert("수정되었습니다.");
				}else {
					alert("실패..");
				}
				location.reload();
			}
		});
	}else {
		return;
	}
}

$(function(){
	$(".scoreform-container").css("display","none");
	$("select").attr('onfocus','addFocusObj(this)');
	
	// 매치가 이미 종료되었으면 스코어 수정할 수 없도록 한다.
	var mstatus = $("#mstatus").val();
	if(mstatus == 1){
		$(".score").prop("readOnly", true);
		$("#scorebtn").prop("disabled", true);
		$(".scoreform-container").show();
	}
	
	// 체크박스를 통해 스코어 등록할 수 있도록
	$("#status").change(function(){
		var bool = $("#status").is(":checked");
	//	alert(bool);
		if(bool){
			$(".scoreform-container").css("display","block");
		}else {
			$(".scoreform-container").css("display","none");
		}
	});
})
</script>


<div class="container">
	<div class="wrapper">
		<h1 id="title">매치 편집</h1>
		<hr>
		<div id="lineedit">
			<div class="lineup-container" align="left">
				<h3>홈 라인업 설정</h3>
				<br/>
				<br/>
				<h4 class="clubname">${match.cname_short_h}</h4>
				<div class="lineup-content" align="left">
					<div class="playerlist">
						<select class="selectbox homeplayer" multiple size="22">
							<optgroup label="GK">
						<c:forEach var="player" items="${pList_home}">
							<c:if test='${player.position == "GK"}'>
								<option value="${player.pcode}">(No.${player.pno})${player.pname}</option>
							</c:if>
						</c:forEach>
							</optgroup>
							<optgroup label="DF">
						<c:forEach var="player" items="${pList_home}">
							<c:if test='${player.position == "DF"}'>
								<option value="${player.pcode}">(No.${player.pno})${player.pname}</option>
							</c:if>
						</c:forEach>
							</optgroup>
							<optgroup label="MF">
						<c:forEach var="player" items="${pList_home}">
							<c:if test='${player.position == "MF"}'>
								<option value="${player.pcode}">(No.${player.pno})${player.pname}</option>
							</c:if>
						</c:forEach>
							</optgroup>
							<optgroup label="FW">
						<c:forEach var="player" items="${pList_home}">
							<c:if test='${player.position == "FW"}'>
								<option value="${player.pcode}">(No.${player.pno})${player.pname}</option>
							</c:if>
						</c:forEach>
							</optgroup>
						</select>
					</div>
					<div class="lineup-wrapper">
						<div class="lineup starting-lineup" style="margin-bottom: 5px;">
							<div class="selectbtn">
								<a class="anchor-btn" onClick="selected(this)">&gt;&gt;</a>
							</div>
							<select class="selectbox starting" id="homestarting" multiple size="12">
								<optgroup label="선발 목록">
							<c:forEach var="starting" items="${lu.hStarting}">
								<option value="${starting.pcode}">(No.${starting.pno})${starting.pname}</option>
							</c:forEach>
								</optgroup>
							</select>
						</div>
						<div class="deletebtn">
							<a class="delbtn anchor-btn" onClick="delAllList('starting',this)">선발 삭제</a>
							<a class="delbtn anchor-btn" onClick="delAllList('substitute',this)">후보 삭제</a>
							<a class="delbtn anchor-btn" onClick="delPlayer(this)">선택 삭제</a>
						</div>
						<div class="lineup substitute-lineup">
							<div class="selectbtn">
								<a class="anchor-btn" onClick="selected(this)">&gt;&gt;</a>
							</div>
							<select class="selectbox substitute" id="homesub" multiple size="7">
								<optgroup label="후보 목록">
							<c:forEach var="substitute" items="${lu.hSubstitute}">
								<option value="${substitute.pcode}">(No.${substitute.pno})${substitute.pname}</option>
							</c:forEach>
								</optgroup>
							</select>
						</div>
					</div>
				</div>
			</div>

			<div class="lineup-container" align="left">
				<h3>어웨이 라인업 설정</h3>
				<br />
				<br />
				<h4 class="clubname">${match.cname_short_a}</h4>
				<div class="lineup-content" align="left">
					<div class="playerlist">
						<select class="selectbox awayplayer" multiple size="22">
							<optgroup label="GK">
						<c:forEach var="player" items="${pList_away}">
							<c:if test='${player.position == "GK"}'>
								<option value="${player.pcode}">(No.${player.pno})${player.pname}</option>
							</c:if>
						</c:forEach>
							</optgroup>
							<optgroup label="DF">
						<c:forEach var="player" items="${pList_away}">
							<c:if test='${player.position == "DF"}'>
								<option value="${player.pcode}">(No.${player.pno})${player.pname}</option>
							</c:if>
						</c:forEach>
							</optgroup>
							<optgroup label="MF">
						<c:forEach var="player" items="${pList_away}">
							<c:if test='${player.position == "MF"}'>
								<option value="${player.pcode}">(No.${player.pno})${player.pname}</option>
							</c:if>
						</c:forEach>
							</optgroup>
							<optgroup label="FW">
						<c:forEach var="player" items="${pList_away}">
							<c:if test='${player.position == "FW"}'>
								<option value="${player.pcode}">(No.${player.pno})${player.pname}</option>
							</c:if>
						</c:forEach>
							</optgroup>
						</select>
					</div>
					<div class="lineup-wrapper">
						<div class="lineup starting-lineup" style="margin-bottom: 5px;">
							<div class="selectbtn">
								<a class="anchor-btn" onClick="selected(this)">&gt;&gt;</a>
							</div>
							<select class="selectbox starting" id="awaystarting" multiple size="12">
								<optgroup label="선발 목록">
							<c:forEach var="starting" items="${lu.aStarting}">
								<option value="${starting.pcode}">(No.${starting.pno})${starting.pname}</option>
							</c:forEach>
								</optgroup>
							</select>
						</div>
						<div class="deletebtn">
							<a class="delbtn anchor-btn" onClick="delAllList('starting',this)">선발 삭제</a>
							<a class="delbtn anchor-btn" onClick="delAllList('substitute',this)">후보 삭제</a>
							<a class="delbtn anchor-btn" onClick="delPlayer(this)">선택 삭제</a>
						</div>
						<div class="lineup substitute-lineup">
							<div class="selectbtn">
								<a class="anchor-btn" onClick="selected(this)">&gt;&gt;</a>
							</div>
							<select class="selectbox substitute" id="awaysub" multiple size="7">
								<optgroup label="후보 목록">
							<c:forEach var="substitute" items="${lu.aSubstitute}">
								<option value="${substitute.pcode}">(No.${substitute.pno})${substitute.pname}</option>
							</c:forEach>
								</optgroup>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br/>
		<br/>
		<a class="anchor-btn" style="margin-left:20px;" onClick="save('${match.mcode}')">라인업 저장</a>
		<input type="hidden" id="focusObj"/>
		<hr>
		<div id="scorenstatus">
			<input type="hidden" id="mstatus" value="${match.mstatus}"/>
			<h3>매치 상태 설정 및 스코어 입력</h3>
		<c:if test="${empty lu.hStarting or empty lu.hSubstitute or empty lu.aStarting or empty lu.aSubstitute}">
			<span style="font-size: 10pt; color: red; font-weight: bold; font-style: italic;">라인업 등록 후 가능합니다.</span>
		</c:if>
			
			<br /> 
	<c:if test="${match.mstatus == 0}"><!-- 경기전 -->
		<c:if test="${empty lu.hStarting or empty lu.hSubstitute or empty lu.aStarting or empty lu.aSubstitute}">
			<input type="checkbox" id="status" name="status" disabled />
		</c:if>
		<c:if test="${not empty lu.hStarting and not empty lu.hSubstitute and not empty lu.aStarting and not empty lu.aSubstitute}">
			<input type="checkbox" id="status" name="status" />
		</c:if>
	</c:if>
		<c:if test="${match.mstatus == 1}"><!-- 경기종료 -->
			<input type="checkbox" id="status" name="status" disabled checked />
		</c:if>
			<label for="status">경기 종료</label> <span
				style="font-style: italic; color: gray; font-size: 10pt;">경기
				종료 체크 후 스코어 입력 가능합니다.</span>
			<div class="scoreform-container">
				${match.cname_short_h}(home) <input class="score" type="number" id="hscore" min="0" 
				<c:if test="${empty match.homescore}">value="0"</c:if>
				<c:if test="${not empty match.homescore}">value="${match.homescore}"</c:if> >:<input
					class="score" type="number" id="ascore" min="0"
				<c:if test="${empty match.awayscore}">value="0"</c:if>
				<c:if test="${not empty match.awayscore}">value="${match.awayscore}"</c:if> > ${match.cname_short_a}(away)
			<br/>
			<br/>
			<form id="scorerForm">
				
			</form>
			<c:if test="${match.mstatus == 0 and not empty lu.hStarting and not empty lu.hSubstitute and not empty lu.aStarting and not empty lu.aSubstitute}">
				<a class="anchor-btn" id="scorebtn" onClick="saveScore('${match.mcode}')">저장</a>
				<a class="anchor-btn" onClick="javascript:history.go(-1)">취소</a>
			</c:if>
			</div>
		</div>
		
	</div>
</div>
<%@ include file="footer.jsp"%>