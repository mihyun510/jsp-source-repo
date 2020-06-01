<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//쿠키대신 세션으로 값 꺼내오기 -> frontmvc2를 거치면 여기에 이름이 담겨있을것입니다
    	String s_name = (String)session.getAttribute("s_name"); //리턴타입이 오브젝트이기 때문에 꼭 형변환해줘야된다.
/*     	의미없는값
		if(s_name == null){ //로그인 안함
			s_name = "이순신";
    	} 
*/
    	out.print(s_name);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MapDesign-Tag, 로그인 부분 구현 - 쿠키 Jqeury가 아닌 자바로 할용하기</title>
<%@include file="../common/jEasyUICommon.jsp" %>
	<style type="text/css">
		div#d_resList{
			border: thin dotted red;
			padding: 5px;
			text-align: left;
		}
	</style>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script><!-- jquery 쿠기 사용 -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAArsLlaumdnutPr1i_GHpyeXthUwh-_MA"></script> <!-- 키값이 존재해야지 맵으로 실행가능 -->
	<script type="text/javascript">
	//쿠키 정보를 담을 전역변수 선언하기
		var c_name = null;
		function memberList(){
			//alert("회원목록호출성공");
			//location.href="./login.mvc2?crud=memberList"; //login.mvc2여기서는 지금 페이지 이름이 의미가 없다 왜냐하면 페이지 이름을 가지고 업무를 진행할 수 없기 때문이다. 그리고 여기서 @이 클래스 앞에만 제공하기 떄문에 메소드에서도 제공을 해주는 스프링에서는 가능하다.
			$('#dl_memList').dialog({ //페이지 이동을 위해서 - mem berList의 페이지가 여기 모달안으로 들어옴.
			    title: '회원목록',
			    width: 400,
			    height: 400,
			    closed: false,
			    cache: false,
			    href: 'memberList.jsp', //모달안에 jsp 페이지을 넣는 역할을 하는 아이. - href 
			    modal: true
			});
		}
		function login() {
			<%-- var u_id = $("#tb_id").val(); //이렇게 화면에 그냥 보여주는 것은 name의 값이 아닌 id의 값을 가져와야된다. 자바로 처리할 것이 아닌 자바스크립트로 이벤트를 처리할려면 id값을 사용
			var u_pw = $("#tb_pw").val();
			alert("사용자가 입력한 아이디-"+u_id+", 비번:"+u_pw);//사용자가 입력한 아이디를 꺼내보기
//			fetch("./loginAction.jsp?mem_id="+u_id+"&mem_pw="+u_pw,{ loginAction.jsp을 servlet으로 처리할 것이다.
			fetch("/member/login.mvc2?crud=login&mem_id="+u_id+"&mem_pw="+u_pw,{
				method: "GET"
			}).then(res => res.text()).then(function(text){ //text : 여기에는 로그인 후 가져온 이름이 담겨있음
				alert("text:"+text);
				if("비밀번호가 틀립니다."==text.trim()){ //비밀번호가 틀립니다.
					alert("비밀번호가 틀립니다.");
					//로그인을 다시 진행해야된다.
					$("#d_login").show();
					$("#d_logout").hide(); 
				}else if("아이디가 존재하지 않습니다"== text.trim()){ 
					alert("아이디가 존재하지 않습니다");
					$("#d_login").show();
					$("#d_logout").hide(); 
				} else{
					c_name = text.trim();//여기에 이름을 담는다. - 로그인한 결과가 여기에 관리됨 but 서버에 관리하기 위해서 세션에 담을 것이다.
					/*$.cookie('c_name',c_name); ---> 로그인 액션에서 이루어져야 된다. 여기는 클라이언트에서 가져온 값*/
					$.cookie('c_name','<%=s_name%>'); //서버에서 가져온다.
					$("#d_login").hide();
					$("#d_logout").show();
					$("#logok").html("<b>"+c_name+"님 환영합니다.</b>");
					$("#d_resList").show(); //식당정보를 보여주자.
				}
			});  --%>
			
			//폼전송으로 바꾸어서 처리해야됨
			
			$("#f_login").attr("method","get");
			$("#f_login").attr("action","./login.mvc2");
			$("#f_login").submit();
			
		}
		function logout(){
			/* $.cookie('c_name',null);
			//아이디와 패스워드를 빈문자열로 초기화 한다.
			u_id = $("#tb_id").textbox('setValue','');
			u_pw = $("#tb_pw").textbox('setValue','');
			$("#d_login").show(); //쿠키에 저장된 것이 빛의 속도로 처리가 된다. 그러니 아작스를 태우지 않아도 된다.
			$("#d_logout").hide();
			$("#d_resList").hide(); */
			location.href="logout.jsp";
		} 
		//입력버튼에서 저장버튼을 누르면 새로고침되는 함수
		function fun(){
			alert("mapDesign3.jsp fun호출");
			$('#dl_memList').dialog({
				title:'회원관리',
			    width: 400,
			    height: 400,
			    closed: false,
			    cache: false,
			    href: './member.mvc3?crud=memberList',
			    modal: true
			});
		}
		function like(u_num){
			$.ajax({
				method:'post'
				,url:'./likeAction.jsp'
				,dataType:'json'
				,data: 'res_num='+u_num
				,success: function(data){
					if(data==1){ //가져온 데이터가 1개이면 즉, 좋아요가 넘어왓으면.
						fetch('./jsonMapList.jsp',{
							method:"post"
						}).then(res => res.text()).then(function(text){
							var imsi = text.trim();
							var resDoc = JSON.parse(imsi);
							var resList = '<table>';
							for(var i =0 ; i<resDoc.length; i++){
								resList += '<tr><td>';
								resList += resDoc[i].res_name+'<br>';
								resList += '<img src=like.png width=20 height=20/>'+resDoc[i].res_like;
								resList += '&nbsp;&nbsp;'; //&nbsp;&nbsp 여백주기
								resList += '<img src=hate.png width=20 height=20/>'+resDoc[i].res_hate;
								resList += '</td></tr>';
							}
							resList += '</table>';
							$("#d_resList").html(resList);
						});
					}
				}
			});
		}
		function hate(u_num){
			var u_hate = $("#u_hate").text();
			$.ajax({
				method:'post'
				,url:'./hateAction.jsp'
				,dataType:'json'
				,data: 'res_num='+u_num
				,success: function(data){
					if(data==1){
						fetch('./jsonMapList.jsp',{
							method:"post"
						}).then(res => res.text()).then(function(text){
							var imsi = text.trim();
							var resDoc = JSON.parse(imsi);
							var resList = '<table>';
							for(var i =0 ; i<resDoc.length; i++){
								resList += '<tr><td>';
								resList += resDoc[i].res_name+'<br>';
								//글씨는 없애고 이미지만 보이자.
								resList += '<img src=like.png width=20 height=20/>'+resDoc[i].res_like;
								resList += '&nbsp;&nbsp;';
								resList += '<img src=hate.png width=20 height=20/>'+resDoc[i].res_hate;
								resList += '</td></tr>';
							}
							resList += '</table>';
							$("#d_resList").html(resList);
						});///////////////end of fetch
					}///////////////오라클 서버에 반영이 되었을때
				}////////////end of success
			});////////////end of ajax
		}///////////////end of like
	</script>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function(){
/* 			if(c_name != null && c_name.length > 0){//쿠키값이 존재하니? 네:로그인했어요, 아니: 로그인 안했음.
				$("#d_login").hide(); 
				$("#d_logout").show();
				$("#d_resList").show();
					
			}else{ //쿠키값이 존재하지 않으면 로그인 하지 않음.
				$("#d_login").show(); 
				$("#d_logout").hide();
				$("#d_resList").hide();
			} 
			*/
		});
	</script>
	<table border="1" align="cneter" width="1000" height="600">
		<tr>
			<td width = "700">
			<div id="d_map" style="width:800px; height:600px;"></div>
			</td>
			<td width="200" valign="top">
			<%
				if(s_name==null){
					
			%>
			<!-- ======================== 로그인 화면 시작 ============================ -->
			<div id="d_login">
			<form id="f_login">
			<input type="hidden" name="crud" value="login">
				<table width="100%" border="0" borderColor="red" >
					<tr>
						<td>
						<input id="tb_id" name="mem_id" class="easyui-textbox" prompt="아이디" data-options="iconCls:'icon-search'" style="width:110px">
						</td>
						<td rowspan="2">
							<a id="btn" style="height:60px" href="javascript:login()" class="easyui-linkbutton">로그인</a>
						</td>
					</tr>
					<tr>
						<td>
						<input id="tb_pw" name="mem_pw" class="easyui-passwordbox" prompt="비밀번호" iconWidth="28" style="width:110px">
						</td>
					</tr>
				</table>
			</form>
			</div>
			<!-- ======================== 로그인 화면 끝 ============================ -->
			<%
				}else{
			%>
			<!-- ======================== 로그아웃 화면 시작 ============================ -->
			<div id="d_logout">
			<form id="f_logout">
				<table width="100%" border="0" borderColor="bule" >
					<tr>
						<td style="width:100px">
							<span id="logok"><%=s_name %>님 환영합니다.</span> <!-- 홍길동님 환영합니다. -->
						</td>
						<td>
							<a id="btn_logout" style="height:30px" href="javascript:logout()" class="easyui-linkbutton">로그아웃</a>
						</td>
					</tr>
				</table>
			</form>
			</div>
			<!-- ======================== 로그아웃 화면 끝 ============================ -->
			<%
				}
			%>
			<!--#######################업무 목록 시작################################  -->
			<div class="easyui-panel" style="padding:5px">
		        <ul class="easyui-tree">
		            <li>
		                <span>My Documents</span>
		                <ul>
		                    <li data-options="state:'closed'">
		                        <span>회원관리</span>
		                        <ul>
		                            <li><span>회원가입</span></li>
		                            <li><span>정보수정</span></li>
		                            <li><span>회원탈퇴</span></li>
		                            <li><span><a href="javascript:memberList()">회원목록</a></span></li>
		                        </ul>
		                    </li>
		                    <li data-options="state:'closed'">
		                        <span>이용권</span>
		                        <ul>
		                        	<li><span>이용권 등록</span></li>
		                            <li><span>이용권 구매</span></li>
		                        </ul>
		                   </li>
		                </ul>
		            </li>
		        </ul>
		    </div>
			<!--#######################업무 목록 끝################################  -->
			<!-- ======================== 식당목록 시작 ============================ -->
			<div id="d_resList">식당목록</div>
			<!-- ======================== 식당목록 끝 ============================== -->
			<script type="text/javascript">
				$(document).ready(function(){
					/* $("#d_login").show(); //show():jquery가 제공하는 함수 - 보여주자
					$("#d_logout").hide();//hide(): 숨기자. */
					var map = new google.maps.Map(document.getElementById('d_map'),{//구글에서 제공해주는 클래스 사용하기 위해서 인스턴스화함
						zoom: 14 //맵의 크기를 정함.
						,center: new google.maps.LatLng(37.4798346,126.8824997) //위도 경도 값을 설정 - 첨음 디폴트 위치 설정.
						,mapTypeId: google.maps.MapTypeId.ROADMAP //ROADMAP으로 지도로 보는 것 - 처음에 로드맵으로 지도맵 보이기
					});////////////end of map
					var infowindow = new google.maps.InfoWindow(); //말풍선 클래스 사용. 말풍선을 클릭했을 떄 열리는 창 = InfoWindow() 객체
					//마커를 사용
					var marker; //마커가 5개가 출력이 되어야됨.(이 5개의 값은 json에서 읽어와야된다[스캔] - jsonMapList.jsp)
					var i; //마커 생성시 부여한 인덱스값
					$.ajax({
						url: './jsonProcMapList.jsp' //서버에 요청
						,dataType: 'json' //데이터타입은 json
						,success:function(data){ //전송에 성공하면 함수를 실행하고 data는 전송에 성공하고 받은 응답결과 데이터 즉 json포맷 결과
							var result = JSON.stringify(data); //값이 덩어리로 들어있음.
							var jsonDoc = JSON.parse(result); //값을 파싱해온다. - 데이터 한개씩 배열방 한칸에 담기
							for(var i = 0; i<jsonDoc.length; i++){ //json의 정보갯수 만큼 for문이 돌고 
								var src1="../../img/restorant/";
								marker = new google.maps.Marker({
									id:i//0,1,2,3,4 - 인덱스값. 하나하나가 마커의 인덱스 정보.
									,position: new google.maps.LatLng(jsonDoc[i].lat, jsonDoc[i].lng)// 마커를 여러개 찍을거임
									,map: map
									,title: jsonDoc[i].res_name
								}); ///////////end of marker
								google.maps.event.addListener(marker, 'click',(function(marker,i){ //마커 클릭하면 이벤트 발생
									return function(){ //이벤트 함수의 반환함수 클릭할때마다 컨텐츠를 만들어준다. 그 컨텐츠는 말풍션을 오픈해준다.
										var content = '<b>식당이름: '+jsonDoc[i].res_name+'</h2>';
										content += '<br>';
										content += '<b>전화번호: '+jsonDoc[i].res_tel+'</b>';
										content += '<br>';
										content += '<b>소개글: '+jsonDoc[i].res_info+'</b>';
										content += '<br>';
										content += '<b>운영시간: '+jsonDoc[i].res_time+'</b>';
										content += '<br>';
										content += "<b><img src="+src1+jsonDoc[i].res_photo+" width='50' height='40'></b>";
										content += '<br>';
										content += '좋아요<a href="javascript:like('+jsonDoc[i].res_num+')"><img src=like.png width=20 height=20></a>';
										content += '<span id=u_like></span>'
										content += '&nbsp;&nbsp;'
										content += ',싫어요<a href="javascript:hate('+jsonDoc[i].res_num+')"><img src=hate.png width=20 height=20></a>';
										infowindow.setContent(content);//infowindow:마커처리할때 말풍선 클래스, setContent(내용)
										infowindow.open(map,marker); //마커의 말풍선을 연다.
									} //end of 반환함수
								})(marker, i)); //(marker, i)는 뭐지...? /////////////end of addLitener
								if(marker){ //자바스크립트에서는 0이 아니면 모두  true 마커가 오브젝트를 가지고 있어도 트루임. 이 문장이 맞는 표현임
									marker.addListener('click', function(){ //클릭이 되었을때
										map.setZoom(15); //마커를 클릭하면 확대되는 느낌을  줌
										map.setCenter(this.getPosition()); //클릭하면 클릭한 마커의 위치로 센터를 맞추자.
									});
								}/////////////end of if
							}/////////////end of for
						}/////////////////end of success
					});/////////////////// end  of ajax
				});//////////////////////end of ready
			</script>
			</td>
		</tr>
	</table>
	<!-- =============================== 메인 페이지 코드가 끝 ====================================== -->
	<!-- =============================== 모달 창에 필요한 코드 시작 ====================================== -->
	<div id="dl_memList">Dialog Content.</div>
	<!-- =============================== 모달 창에 필요한 코드 끝 ====================================== -->	
</body>
</html>