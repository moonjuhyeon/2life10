<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>장례상품</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>장례상품</span>
					<strong>장례상품</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN30200";
		var mbId = "MO30200";
		var mbId2 = "";
		
		console.log(menuId);
		if ( menuId != '' ){
			var temp = menuId.substring((menuId.length-2), menuId.length);
			if ( temp == '00'){//대메뉴 // class="active"
				$("#"+menuId).addClass("active");
				$("#"+menuId).children().find("li:eq(0)").addClass("active");
			}else{//소메뉴
				$("#"+menuId).addClass("active");
				$("#"+menuId).parents("li").addClass("active");
			}
		}

		$("#subtitle").text($("#"+mbId).text());
		$("#subtitle2").text($("#"+mbId2).text());
		
	});

</script>

<form action="#" name="menuFrm" method="post">
	<input type="hidden" name="menuNum"/>
</form>	

			<div class="moLnbWrap">
                <nav class="flexContainer">
                    <div class="flexItem3">
                        <strong><button type="button" class="select">장례상품</button></strong>
                        <ul>
                            <li><a href="javascript:goMenu('../company/overview.jsp', '');">회사소개</a></li>
                            <li><a href="javascript:goMenu('../info/pro_info.jsp', '');">상조상품안내</a></li>
                            <li><a href="javascript:goMenu('../funeral/funeral_mark.jsp', '');">장례상품</a></li>
                            <li><a href="javascript:goMenu('../marry/marry_mark.jsp', '');">웨딩상품</a></li>
                            <li><a href="javascript:goMenu('../cruise/cruise_mark.jsp', '');">크루즈상품</a></li>
                            <li><a href="javascript:goMenu('../notice/notice_list.jsp', '');">고객센터</a></li>
                        </ul>
                    </div>
                    <div class="flexItem4"> <!-- .select 버튼 클릭시 다중클래스 on 추가 -->
                        <strong><button type="button" class="select" id="subtitle">장례상품</button></strong>
                        <ul>
                            <li id="MO30100"><a href="javascript:goMenu('../funeral/funeral_mark.jsp', 'MO30100');">장례상품특징</a></li>
                            <li id="MO30200"><a href="javascript:goMenu('../funeral/funeral_list_a.jsp', 'MO30200');">장례상품</a></li>
                            <li id="MO30300"><a href="javascript:goMenu('../funeral/funeral_info_a.jsp', 'MO30300');">장례정보</a></li>
                            <li id="MO30400"><a href="javascript:goMenu('../funeral/funeral_notice.jsp', 'MO30400');">부고알림</a></li>
                        </ul>
                    </div>

                </nav>
            </div> <!-- // moLnbWrap -->

            <div class="pcLnbWrap">
                <nav>
                    <ul class="pcLnb">
                        <li id="MN30100"><a href="javascript:goMenu('../funeral/funeral_mark.jsp', 'MN30100');">장례상품특징</a></li>
                        <li id="MN30200"><a href="javascript:goMenu('../funeral/funeral_list_a.jsp', 'MN30200');">장례상품</a></li>
                        <li id="MN30300"><a href="javascript:goMenu('../funeral/funeral_info_a.jsp', 'MN30300');">장례정보</a></li>
                        <li id="MN30400"><a href="javascript:goMenu('../funeral/funeral_notice.jsp', 'MN30400');">부고알림</a></li>
                    </ul>
                </nav>
            </div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div id="pro_info" class="contents"> <!-- 페이지별 ID -->

				<div class="defaultTab">
					<strong class="select">
						<button type="button">장례 260</button>
					</strong>
					<ul>
						<li class="tab01 active"><a href="./funeral_list_a.jsp">장례 260</a></li>
						<li class="tab02"><a href="./funeral_list_b.jsp">장례 390</a></li>
						<li class="tab03"><a href="./funeral_list_c.jsp">장례 480</a></li>
						<li class="tab04"><a href="./funeral_list_d.jsp">프라임(350)상품</a></li>
					</ul>
				</div>
				
				<header class="contInfoArea">
					<p class="img"><img src="../public/img/conts/img_pro_a_260.png" alt="장례 260 안내이미지" /></p>
					<div class="area">
						<h3 class="contTit"><span>장례260</span></h3>
						<p class="subTxt">월 26,000원 X 100회 (2,600,000원)</p>
						<ul class="defaultGrayDotList mt-10">
							<li>-캐딜락리무진 또는 장의버스 택일 (왕복200Km제공</li>
							<li>-수의, 관, 꽃바구니 2개 제공</li>
							<li>-장례지도사 3일간 장례 진행, 도우미 2명</li>
						</ul>
						<br/>
						<a href="/downloadFile.do?fileSeqNum=eykinhybdvik" class="btnDefault">가입신청</a>
						<a href="/downloadFile.do?fileSeqNum=eykinhybdvik" class="btnDefault">상담신청</a>
						
					</div>
				</header>

				<div class="tableBasicList">
					<table class="defaultTable">
						<caption>장례260</caption>
						<colgroup>
							<col style="width:18%;" />
							<col style="width:12%;" />
							<col style="width:18%;" />
							<col style="width:auto%;" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">구분</th>
								<th scope="col" colspan="2">상품</th>
								<th scope="col">내용</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>환급서비스</td>
								<td colspan="2">만기환급률 100%</td>
								<td class="alignL">만기완납 1년후 헤약시 실납입금액 100%환급</td>
							</tr>
							<tr>
								<td rowspan="2">인력지원</td>
								<td colspan="2">장례전문지도사 2명</td>
								<td class="alignL">장례진행의 제반절차를 예법에 따라 장례진행</td>
							</tr>
							<tr>
								<td colspan="2">장례전문도우미 2명</td>
								<td class="alignL">장례기간 중 -> 10시간/1일 봉사<br/>-장례기간 중 총2명(총20시간)</td>
							</tr>
							<tr>
								<td rowspan="6">고인용품 및<br/>입관 수시용품</td>
								<td rowspan="2">관</td>
								<td>화장시</td>
								<td class="alignL">오동나무 0.5치</td>
							</tr>
							<tr>
								<td>매장시</td>
								<td class="alignL">오동나무 1.5치</td>
							</tr>
							<tr>
								<td colspan="2">수의</td>
								<td class="alignL">저마</td>
							</tr>
							<tr>
								<td colspan="2">도포,원삼</td>
								<td class="alignL">저마</td>
							</tr>
							<tr>
								<td colspan="2">멧베(탈관시)</td>
								<td class="alignL">탈관시 제공</td>
							</tr>
							<tr>
								<td colspan="2">받침대, 베게, 수세포, 관보, 명정, 결관포,한지, 탈지면, 알코올, 예단, 습신, 보공 등</td>
								<td class="alignL">규격품 제공</td>
							</tr>
							<tr>
								<td>빈소용품</td>
								<td colspan="2">액자리본,명패,양초,부의록</td>
								<td class="alignL">제공</td>
							</tr>
							<tr>
								<td>꽃장식</td>
								<td colspan="2">영정 및 제단</td>
								<td class="alignL">꽃바구니2개</td>
							</tr>
							<tr>
								<td rowspan="8">의전용품<br/>(현대식/전통식 중 택일)</td>
								<td rowspan="3">현대식</td>
								<td>남상복 대여</td>
								<td class="alignL">3벌 (상,하의검정색 정장, Y셔츠, 넥타이포함)</td>
							</tr>
							<tr>
								<td>여성복 대여</td>
								<td class="alignL">10벌</td>
							</tr>
							<tr>
								<td>완장</td>
								<td class="alignL">필요량제공</td>
							</tr>
							<tr>
								<td rowspan="5">전통식</td>
								<td>굴건제복</td>
								<td class="alignL">직계상주 제공</td>
							</tr>
							<tr>
								<td>두루마기</td>
								<td class="alignL">10벌</td>
							</tr>
							<tr>
								<td>중단</td>
								<td class="alignL">10벌</td>
							</tr>
							<tr>
								<td>치마저고리</td>
								<td class="alignL">10벌</td>
							</tr>
							<tr>
								<td>두건,행전 등</td>
								<td class="alignL">필요량제공</td>
							</tr>
							<tr>
								<td>발인용품</td>
								<td colspan="2">운구용장갑, 선도차리본</td>
								<td class="alignL">제공</td>
							</tr>
							<tr>
								<td>장의차량</td>
								<td colspan="2">캐딜락리무진 또는 장의버스 중 택일</td>
								<td class="alignL">택일(왕복200Km이내)</td>
							</tr>
							<tr>
								<td rowspan="5">의전용품<br/>(현대식/전통식 중 택일)</td>
								<td colspan="2">고인운구 전용차량</td>
								<td class="alignL">24시간 앰블런스 대기(관내무료)</td>
							</tr>
							<tr>
								<td colspan="2">예약</td>
								<td class="alignL">화장장 예약</td>
							</tr>
							<tr>
								<td colspan="2">알선</td>
								<td class="alignL">납골,산역(장지행사)</td>
							</tr>
							<tr>
								<td colspan="2">회장지원</td>
								<td class="alignL">납골당의뢰시 할인 및 유골함 제공</td>
							</tr>
							<tr>
								<td colspan="2">행정안내</td>
								<td class="alignL">각종행정절차안내<br/>필요한서류 안내</td>
							</tr>
						</tbody>
					</table>
				</div>



			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="../include/inc_footer.jsp"%>
