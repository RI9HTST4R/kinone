<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
		
		<!-- 매치 일정 슬라이드 -->
		<div class="match-slide">
			<div class="container">
				<a id="totalmatch" href="matchList.do">전체 일정 보기 ></a>
				<ul class="nav nav-tabs match-slide-tabs">
					<li class="nav-item"><a
						class="nav-link active font-weight-bold" data-toggle="tab"
						href="#K1match">K리그 1 경기 일정</a></li>
					<li class="nav-item"><a class="nav-link font-weight-bold"
						data-toggle="tab" href="#K2match">K리그 2 경기 일정</a></li>
				</ul>
				<!-- 매치 일정정보 -->
				
				<div class="tab-content match-slide-content">
					<div id="K1match" class="tab-pane active">
						<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡK리그1 일정ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->


						<div class="match-container" id="K1league" align="center">
							<!-- Nav tabs -->
							<ul class="nav match-date" role="tablist">
							<c:forEach var="matchday" items="${k1MatchDays}" varStatus="status">
								<li class="nav-item each-date">
								<a class="nav-link <c:if test="${status.count == 4}">active</c:if>"
									data-toggle="tab" href="#K1${matchday}"><fmt:formatDate value="${matchday}" pattern="M월  d일 (E)" /></a>
								</li>
							</c:forEach>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content match-detail" id="K1matchday">
								<c:forEach var="matchday" items="${k1MatchDays}" varStatus="s1">
									<fmt:formatDate var="key" value="${matchday}" pattern="yyyy-MM-dd"/>
									<c:set var="inDayMap" value="${k1MatchMapList[key]}" /> <!-- 이 맵의 key : currentPage, totalPage, start, end, list -->
									<c:set var="currentPage" value="${inDayMap['currentPage']}" />
									<c:set var="totalPage" value="${inDayMap['totalPage']}" />
									<c:set var="begin" value="${inDayMap['start']-1}" />
									<c:set var="end" value="${inDayMap['end']-1}" />
									
								<div id="K1${matchday}" class="tab-pane <c:if test="${s1.count == 4}">active</c:if> each-match">
									<div class="match-arrow">
										<c:choose>
										<c:when test="${currentPage != 1 and totalPage != 1}"><a href="">&lt;</a></c:when>
										<c:when test="${totalPage <= 1}"><span>&lt;</span></c:when>
										<c:otherwise><span>&lt;</span></c:otherwise>
										</c:choose>
									</div>
									<c:forEach var="amatch" items="${inDayMap['list']}" begin="${begin}" end="${end}" varStatus="s2">
									<div class="match <c:if test="${s2.count == 2}">match-center</c:if>">
										<table class="match-table">
											<tr class="match-top">
												<td rowspan="2" class="match-team"><img src="${url}/resources/emblem/${amatch.ccode_home}.png" title="${amatch.cname_short_h}">
												</td>
												<!-- ㅡㅡㅡㅡㅡㅡ경기 상태ㅡㅡㅡㅡㅡㅡ -->
												<td class="match-score">
												<c:if test="${amatch.mstatus == 0}"><span>vs</span></c:if><!-- 아직 하지 않은 경기 -->
												<c:if test="${amatch.mstatus == 1}">${amatch.homescore}:${amatch.awayscore}</c:if><!-- 끝난 경기 -->
												</td>
												<!-- ㅡㅡㅡㅡㅡㅡ경기 상태ㅡㅡㅡㅡㅡㅡ -->
												<td rowspan="2" class="match-team"><img src="${url}/resources/emblem/${amatch.ccode_away}.png" title="${amatch.cname_short_a}">
												</td>
											</tr>
											<!-- ㅡㅡㅡㅡㅡㅡ경기 상태ㅡㅡㅡㅡㅡㅡ -->
											<tr class="match-status">
												<td><a href="" class="status">
											<c:if test="${amatch.mstatus == 0}">${fn:substring(amatch.mdate,11,16)}</c:if><!-- 아직 하지 않은 경기 -->
											<c:if test="${amatch.mstatus == 1}">경기종료</c:if><!-- 끝난 경기 -->
												</a></td>
											</tr>
											<!-- ㅡㅡㅡㅡㅡㅡ경기 상태 끝ㅡㅡㅡㅡㅡㅡ -->
											<tr class="match-bottom">
												<td colspan="3"><a href="${url}/matchDetail.do?mcode=${amatch.mcode}" class="lineup">전력비교</a> <a href="${url}/matchReserv.do?mcode=${amatch.mcode}" class="resmatch">경기예매</a></td>
											</tr>
										</table>
									</div>
									</c:forEach>
									
									<c:if test="${fn:length(inDayMap['list']) < 3}">
										<c:set var="idx" value="${3- fn:length(inDayMap['list'])}"/>
										<c:if test="${idx == 1}">
											<div class="match">
												<table class="match-table">
													<tr>
														<td colspan="4" rowspan="4" style="color: lightgray;">
															<i class="fas fa-exclamation" style="font-size: 20pt;"></i><br/>
															<span style="font-size: 15pt;">경기가 없습니다.</span>
														</td>
													</tr>
												</table>
											</div>
										</c:if>
										<c:if test="${idx == 2}">
											<div class="match match-center">
												<table class="match-table">
													<tr>
														<td colspan="4" rowspan="4" style="color: lightgray;">
															<i class="fas fa-exclamation" style="font-size: 20pt;"></i><br/>
															<span style="font-size: 15pt;">경기가 없습니다.</span>
														</td>
													</tr>
												</table>
											</div>
											<div class="match">
												<table class="match-table">
													<tr>
														<td colspan="4" rowspan="4" style="color: lightgray;">
															<i class="fas fa-exclamation" style="font-size: 20pt;"></i><br/>
															<span style="font-size: 15pt;">경기가 없습니다.</span>
														</td>
													</tr>
												</table>
											</div>
										</c:if>
									</c:if>
									
									<div class="match-arrow">
										<c:choose>
										<c:when test="${currentPage != totalPage and totalPage != 1}"><a href="">&gt;</a></c:when>
										<c:when test="${totalPage <= 1}"><span>&gt;</span></c:when>
										<c:otherwise><span>&gt;</span></c:otherwise>
										</c:choose>
									</div>
										
								</div>
								</c:forEach>
							</div>
						</div>
						<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡK리그1 일정ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
					</div>
					<div id="K2match" class="tab-pane">
						<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡK리그2 일정ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

						<div class="match-container" id="K2league" align="center">
							<!-- Nav tabs -->
							<ul class="nav match-date" role="tablist">
							<c:forEach var="matchday" items="${k2MatchDays}" varStatus="status">
								<li class="nav-item each-date">
								<a class="nav-link <c:if test="${status.count == 4}">active</c:if>"
									data-toggle="tab" href="#K2${matchday}"><fmt:formatDate value="${matchday}" pattern="M월  d일 (E)" /></a>
								</li>
							</c:forEach>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content match-detail" id="K2matchday">
								<c:forEach var="matchday" items="${k2MatchDays}" varStatus="s1">
									<fmt:formatDate var="key" value="${matchday}" pattern="yyyy-MM-dd"/>
									<c:set var="inDayMap" value="${k2MatchMapList[key]}" /> <!-- 이 맵의 key : currentPage, totalPage, start, end, list -->
									<c:set var="currentPage" value="${inDayMap['currentPage']}" />
									<c:set var="totalPage" value="${inDayMap['totalPage']}" />
									<c:set var="start" value="${inDayMap['start']-1}" />
									<c:set var="end" value="${inDayMap['end']-1}" />
									
								<div id="K2${matchday}" class="tab-pane <c:if test="${s1.count == 4}">active</c:if> each-match">
									<div class="match-arrow">
										<c:choose>
										<c:when test="${currentPage != 1 and totalPage != 1}"><a href="">&lt;</a></c:when>
										<c:when test="${totalPage <= 1}"><span>&lt;</span></c:when>
										<c:otherwise><span>&lt;</span></c:otherwise>
										</c:choose>
									</div>
									
									<c:forEach var="amatch" items="${inDayMap['list']}" varStatus="s2">
									<div class="match <c:if test="${s2.count == 2}">match-center</c:if>">
										<table class="match-table">
											<tr class="match-top">
												<td rowspan="2" class="match-team"><img src="${url}/resources/emblem/${amatch.ccode_home}.png" title="${amatch.cname_short_h}">
												</td>
												<!-- ㅡㅡㅡㅡㅡㅡ경기 상태ㅡㅡㅡㅡㅡㅡ -->
												<td class="match-score">
												<c:if test="${amatch.mstatus == 0}"><span>vs</span></c:if><!-- 아직 하지 않은 경기 -->
												<c:if test="${amatch.mstatus == 1}">${amatch.homescore}:${amatch.awayscore}</c:if><!-- 끝난 경기 -->
												</td>
												<!-- ㅡㅡㅡㅡㅡㅡ경기 상태ㅡㅡㅡㅡㅡㅡ -->
												<td rowspan="2" class="match-team"><img src="${url}/resources/emblem/${amatch.ccode_away}.png" title="${amatch.cname_short_a}">
												</td>
											</tr>
											<!-- ㅡㅡㅡㅡㅡㅡ경기 상태ㅡㅡㅡㅡㅡㅡ -->
											<tr class="match-status">
												<td><a href="" class="status">
											<c:if test="${amatch.mstatus == 0}">${fn:substring(amatch.mdate,11,16)}</c:if><!-- 아직 하지 않은 경기 -->
											<c:if test="${amatch.mstatus == 1}">경기종료</c:if><!-- 끝난 경기 -->
												</a></td>
											</tr>
											<!-- ㅡㅡㅡㅡㅡㅡ경기 상태 끝ㅡㅡㅡㅡㅡㅡ -->
											<tr class="match-bottom">
												<td colspan="3"><a href="${url}/matchDetail.do?mcode=${amatch.mcode}" class="lineup">전력비교</a> <a href="${url}/matchReserv.do?mcode=${amatch.mcode}" class="resmatch">경기예매</a></td>
											</tr>
										</table>
									</div>
									</c:forEach>
									
									<c:if test="${fn:length(inDayMap['list']) < 3}">
										<c:set var="idx" value="${3- fn:length(inDayMap['list'])}"/>
										<c:if test="${idx == 1}">
											<div class="match">
												<table class="match-table">
													<tr>
														<td colspan="4" rowspan="4" style="color: lightgray;">
															<i class="fas fa-exclamation" style="font-size: 20pt;"></i><br/>
															<span style="font-size: 15pt;">경기가 없습니다.</span>
														</td>
													</tr>
												</table>
											</div>
										</c:if>
										<c:if test="${idx == 2}">
											<div class="match match-center">
												<table class="match-table">
													<tr>
														<td colspan="4" rowspan="4" style="color: lightgray;">
															<i class="fas fa-exclamation" style="font-size: 20pt;"></i><br/>
															<span style="font-size: 15pt;">경기가 없습니다.</span>
														</td>
													</tr>
												</table>
											</div>
											<div class="match">
												<table class="match-table">
													<tr>
														<td colspan="4" rowspan="4" style="color: lightgray;">
															<i class="fas fa-exclamation" style="font-size: 20pt;"></i><br/>
															<span style="font-size: 15pt;">경기가 없습니다.</span>
														</td>
													</tr>
												</table>
											</div>
										</c:if>
									</c:if>
									
									<div class="match-arrow">
										<c:choose>
										<c:when test="${currentPage != totalPage and totalPage != 1}"><a href="">&gt;</a></c:when>
										<c:when test="${totalPage <= 1}"><span>&gt;</span></c:when>
										<c:otherwise><span>&gt;</span></c:otherwise>
										</c:choose>
									</div>
										
								</div>
								</c:forEach>
							</div>
						</div>

						<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡK리그2 일정ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
					</div>
				</div>
			</div>
		</div>
		<!-- 매치 일정 슬라이드 끝 -->
		<!-- 페이지 내용 들어가는 부분 -->
		<div class="wrap_page">
			<div class="wrap_content" align="center">
				<div class="wrap_remain">
					<!-- 왼쪽 페이지 -->
					<div class="remain_left">
						<div class="left-top">
							<span>2018 K리그 순위</span>
						</div>
						<ul class="nav nav-pills nav-justified nav-rank">
							<li class="nav-item"><a
								class="nav-link active font-weight-bold" data-toggle="tab"
								href="#K1_rank">K리그 1</a></li>
							<li class="nav-item"><a class="nav-link font-weight-bold"
								data-toggle="tab" href="#K2_rank">K리그 2</a></li>
						</ul>
						<!-- 리그 순위 테이블 -->
						<div class="tab-content">
							<div id="K1_rank" class="tab-pane active">
								<table class="table rank-table">
									<thead>
										<tr>
											<th>순위</th>
											<th>클럽</th>
											<th>경기</th>
											<th>승점</th>
											<th>득점</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="k1clubseason" items="${k1ClubSeasonRankList}"
											varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td><img src="${url}/resources/emblem/${k1clubseason.ccode}.png" title="${k1clubseason.cname_short}"/></td>
												<td>${k1clubseason.win + k1clubseason.draw + k1clubseason.lose}</td>
												<td>${k1clubseason.win * 3 + k1clubseason.draw}</td>
												<td>${k1clubseason.c_ggoal}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div id="K2_rank" class="tab-pane">
								<table class="table rank-table">
									<thead>
										<tr>
											<th>순위</th>
											<th>클럽</th>
											<th>경기</th>
											<th>승점</th>
											<th>득점</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="k2clubseason" items="${k2ClubSeasonRankList}"
											varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td><img src="${url}/resources/emblem/${k2clubseason.ccode}.png" title="${k2clubseason.cname_short}"/></td>
												<td>${k2clubseason.win + k2clubseason.draw + k2clubseason.lose}</td>
												<td>${k2clubseason.win * 3 + k2clubseason.draw}</td>
												<td>${k2clubseason.c_ggoal}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 리그 순위 테이블 끝 -->
					</div>
					<!-- 왼쪽 페이지 끝 -->
					<!-- 오른쪽 페이지 -->
					<div class="remain_right">
						
						<!-- 뉴스 -->
						<div class="right-menu recent-news">
							<div class="top news-top" align="left">
								<span class="subject" id="news-subject">K리그 소식</span><a
									class="more" href="">더보기 &gt;</a>
							</div>
							<div class="news-content" align="center">
								<div class="news">
									<div class="news-image">
										<a href=""><img src="${url}/resources/news/samplenews.jpg" title="[전북] 전북, 국민연금공단과 MOU 체결"></a>
									</div>
									<div class="news-title" align="justify">
										<a href="" title="">[전북] 전북, 국민연금공단과 MOU 체결</a>
									</div>
								</div>
								<div class="news">
									<div class="news-image">
										<a href=""><img src="${url}/resources/news/samplenews.jpg" title="[부천] 분위기 반전 이룬 부천FC1995, 홈 승리 통해 상승세 이어간다"></a>
									</div>
									<div class="news-title" align="justify">
										<a href="" title="">[부천] 분위기 반전 이룬 부천FC1995, 홈 승리 통해 상승세
											이어간다</a>
									</div>
								</div>
								<div class="news">
									<div class="news-image">
										<a href=""><img src="${url}/resources/news/samplenews.jpg" title="ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ"></a>
									</div>
									<div class="news-title" align="justify">
										<a href="" title="">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</a>
									</div>
								</div>
								<div class="news">
									<div class="news-image">
										<a href=""><img src="${url}/resources/news/samplenews.jpg" title="뉴스제목"></a>
									</div>
									<div class="news-title" align="justify">
										<a href="" title="">뉴스제목</a>
									</div>
								</div>
							</div>
						</div>
						<!-- 뉴스 끝 -->
						<hr>
						<!-- 현 시즌 선수 기록 -->
						<div class="right-menu player-rank">
							<!-- 리그 1 -->
							<div class="rank_wrap">
								<div class="top rank-top" align="left">
									<span class="subject">2018 K리그 1 선수 기록</span><a class="more"
										href="">더보기 &gt;</a>
								</div>
								<hr>
								<div class="rank-content" align="center">
									<div class="goal-rank">
										<ul class="rank-list">
											<li class="rank-subject">
												<div align="center">최다 득점</div>
											</li>
											<c:forEach var="k1playerseason"
												items="${k1PlayerSeasonGRankList}" varStatus="status">
												<li class="rank-detail">
													<div class="rank font-weight-bold">
														<h3>${status.count}</h3>
													</div>
													<div class="pimage">
														<img
															src="${url}/resources/player/${k1playerseason.position}${k1playerseason.pname}.png"
															title="${k1playerseason.pname}">
													</div>
													<div class="pinfo" align="justify">
														<div class="player">
															<strong>${k1playerseason.pname}</strong><span>(${k1playerseason.position})</span>
														</div>
														<span class="club">${k1playerseason.cname_short}</span>
														<div class="stats">${k1playerseason.p_ggoal}<img
																src="${url}/resources/images/goals.png">
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
									<div class="assist-rank">
										<ul class="rank-list">
											<li class="rank-subject">
												<div align="center">최다 도움</div>
											</li>
											<c:forEach var="k1playerseason"
												items="${k1PlayerSeasonARankList}" varStatus="status">
												<li class="rank-detail">
													<div class="rank font-weight-bold">
														<h3>${status.count}</h3>
													</div>
													<div class="pimage">
														<img
															src="${url}/resources/player/${k1playerseason.position}${k1playerseason.pname}.png"
															title="${k1playerseason.pname}">
													</div>
													<div class="pinfo" align="justify">
														<div class="player">
															<strong>${k1playerseason.pname}</strong><span>(${k1playerseason.position})</span>
														</div>
														<span class="club">${k1playerseason.cname_short}</span>
														<div class="stats">${k1playerseason.p_assist}<img
																src="${url}/resources/images/assist.png">
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
							<!-- 리그 1 끝 -->
							<!-- 리그 2 -->
							<div class="rank_wrap">
								<div class="top rank-top" align="left">
									<span class="subject">2018 K리그 2 선수 기록</span><a class="more"
										href="">더보기 &gt;</a>
								</div>
								<hr>
								<div class="rank-content" align="center">
									<div class="goal-rank">
										<ul class="rank-list">
											<li class="rank-subject">
												<div align="center">최다 득점</div>
											</li>
											<c:forEach var="k2playerseason"
												items="${k2PlayerSeasonGRankList}" varStatus="status">
												<li class="rank-detail">
													<div class="rank font-weight-bold">
														<h3>${status.count}</h3>
													</div>
													<div class="pimage">
														<img
															src="${url}/resources/player/${k2playerseason.position}${k2playerseason.pname}.png"
															title="${k2playerseason.pname}">
													</div>
													<div class="pinfo" align="justify">
														<div class="player">
															<strong>${k2playerseason.pname}</strong><span>(${k2playerseason.position})</span>
														</div>
														<span class="club">${k2playerseason.cname_short}</span>
														<div class="stats">${k2playerseason.p_ggoal}<img
																src="${url}/resources/images/goals.png">
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
									<div class="assist-rank">
										<ul class="rank-list">
											<li class="rank-subject">
												<div align="center">최다 도움</div>
											</li>
											<c:forEach var="k2playerseason"
												items="${k2PlayerSeasonARankList}" varStatus="status">
												<li class="rank-detail">
													<div class="rank font-weight-bold">
														<h3>${status.count}</h3>
													</div>
													<div class="pimage">
														<img
															src="${url}/resources/player/${k2playerseason.position}${k2playerseason.pname}.png"
															title="${k2playerseason.pname}">
													</div>
													<div class="pinfo" align="justify">
														<div class="player">
															<strong>${k2playerseason.pname}</strong><span>(${k2playerseason.position})</span>
														</div>
														<span class="club">${k2playerseason.cname_short}</span>
														<div class="stats">${k2playerseason.p_assist}<img
																src="${url}/resources/images/assist.png">
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
							<!-- 리그 2 끝 -->
						</div>
						<!-- 현 시즌 선수 기록 끝 -->
						
						<!-- 클럽 바로가기  -->
						<div class="right-menu team-emblem">
							<div class="top emblem-top" align="left">
								<span class="subject" id="emblem-subject">클럽 바로가기</span>
							</div>

							<div class="emblem" align="left">
								<hr>
								<c:forEach var="club" items="${clubList}">
									<a href="#"><img
										src="${url}/resources/emblem/${club.ccode}.png"
										title="${club.cname_short}"></a>
								</c:forEach>
							</div>
						</div>
						<!-- 클럽 바로가기  끝 -->
					</div>
				</div>
			</div>

		</div>
		<!-- 페이지 내용 들어가는 부분 끝 -->
		
<%@ include file="footer.jsp" %>
