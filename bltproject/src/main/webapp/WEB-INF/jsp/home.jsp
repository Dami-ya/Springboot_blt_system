<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<title>메인페이지</title>
	
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<!-- <script src="https://cdn.jsdelivr.net/clipboard.js/1.5.3/clipboard.min.js"></script> -->
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel='stylesheet' href='//cdn.jsdelivr.net/font-kopub/1.0/kopubdotum.css'>
	<!-- 우선 css파일 따로 안하고 여기 한번에 정의 -->
	<style> 		
	@import url(//cdn.jsdelivr.net/font-nanum/1.0/nanumbarungothic/nanumbarungothic.css);
	body, table, div, p {font-family:'Nanum Barun Gothic';}
     	 
    input {display:inline}
    .container {
	  width: 670px;
	  max-width: none !important;
	}
	.centered {
	  position: relative;
	  display: inline-block;
	  top:50%;
	  width: 50%;
	  height: 50%;
	  padding: 100px 0px;
	  background: white;
	  color: black;

	  margin:-50px 0 0 -50px;
	}
	.outer {
		  display: table;
		  width: 100%;
		  height: 100%;
	}
	.inner {
	  display: table-cell;
	  vertical-align: middle;
	  text-align: center;
	}
	</style>

</head>

<body>

<script type="text/javascript">
   		
		var cnt=0;		
		
		$( function (){
			var result="";
			$('#btnSend').click(function(){
				if($("#firstkey").val().length>16){
					$('input[name=addText]').map(function(){
						result+=$(this).val()+"&";
					});
				}
				else{
	 				$('input[name=addText]').map(function(){
						result+=$(this).val();
					});
				}
				location.href="list/"+result;
			})
		});
		
		function insRow() {
			
			  if(cnt>3){
				  return;
			  }
			  
			  oTbl = document.getElementById("addTable");
			  var oRow = oTbl.insertRow();
			  oRow.onmouseover=function(){
				  oTbl.clickedRowIndex=this.rowIndex
				  }; //clickedRowIndex: 클릭한 Row의 위치를 확인;
			  var oCell = oRow.insertCell();
			
			  //삽입될 Form Tag
			  //첫 추가
			  if(cnt==0){
				  var frmTag = "<span style='float:left'>　　</span><input type=text onkeydown='chkEnter()' placeholder='보안코드를 입력해주세요.' style='width:65%; float:left' class='form-control' name='addText'>";
				  frmTag +="<span style='float:left'>　";
				  frmTag += "</span>";
				  frmTag += "<input type=button value='삭제' class= 'btn btn-default' onClick='removeRow()' style='width:15%;float:left'>";
				  oCell.innerHTML = frmTag;
			  }
			  
			  if(cnt==1){
				  var frmTag = "<span style='float:left'>　　</span><input type=text onkeydown='chkEnter()' placeholder='보안코드를 입력해주세요.' style='width:65%; float:left' class='form-control' name='addText'>";
				  frmTag +="<span style='float:left'>　";
				  frmTag += "</span>";
				  frmTag += "<input type=button value='삭제' class= 'btn btn-default' onClick='removeRow()' style='width:15%;float:left'>";
				  oCell.innerHTML = frmTag;
			  }
			  
			  if(cnt==2){
				  var frmTag = "<span style='float:left'>　　</span><input type=text onkeydown='chkEnter()' placeholder='보안코드를 입력해주세요.' style='width:65%; float:left' class='form-control' name='addText'>";
				  frmTag +="<span style='float:left'>　";
				  frmTag += "</span>";
				  frmTag += "<input type=button value='삭제' class= 'btn btn-default' onClick='removeRow()' style='width:15%;float:left'>";
				  oCell.innerHTML = frmTag; 
			  }
			  
			  if(cnt==3){
				  var frmTag = "<span style='float:left'>　　</span><input type=text onkeydown='chkEnter()' placeholder='보안코드를 입력해주세요.' style='width:65%; float:left' class='form-control' name='addText'>";
				  frmTag +="<span style='float:left'>　";
				  frmTag += "</span>";
				  frmTag += "<input type=button value='삭제' class= 'btn btn-default' onClick='removeRow()' style='width:15%;float:left'>";
				  oCell.innerHTML = frmTag; 
			  }
			  cnt++;
			}
		
		//Row 삭제
		function removeRow() {
		  oTbl.deleteRow(oTbl.clickedRowIndex);
		  cnt--;
		}
		
		function chkEnter() {
	        if (event.which || event.keyCode) {
	            if ((event.which == 13) || (event.keyCode == 13)) {           
	                document.getElementById("btnSend").click();
	                return false;
	            }
	        }
	        else {       
	            return true;
	        }
	    }
		
		var pre_flag=0;
		function promalert(){
			
			var currentDate = new Date();
			var time_now = currentDate.getFullYear()+"-"+currentDate.getMonth()+"-"+currentDate.getDate()+"-"+currentDate.getHours()
							+"-"+currentDate.getMinutes();
			
 				swal({
					  text:'BLT특허법률사무소로부터 사건정보를 받는\n'+'　이메일 주소를 입력해주시기 바랍니다.',
					  content: "input",
					  buttons:["취소","확인"],
					  closeModal: false,
					})
   				.then(function(name){
				  if (!name) throw null;
				  ////////////name이 있으면??/////////////
						  
				  var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				  if(regExp.test(name)==false) {
					  swal("\n","올바른 형식의 이메일 주소를 입력해 주세요.", "warning");
					  swal.stopLoading();
					  swal.close();
				  }
				  //바른 형식의 메일 주소
				  else{
					
					 $.ajax({
							type:'GET',
							url:'/getApplEmailInfo?water_email='+name,
							async:false,
							success:function(data){
							
							//등록되지 않은 메일
							if(data.length==0){
								swal("해당 메일주소를 찾을 수 없습니다.","\n　　입력한 메일 주소: "+name+"\n\n　　　　다른 메일 주소를 입력하시거나,\n　feedback@blt.kr로 문의해주시기 바랍니다.", "error"); 
							    swal.stopLoading();
							    swal.close();
							    
							    $.ajax({
									type:'GET',
									url:'/insertEmialLogInfo?email='+name+'&requestTime='+time_now+'&confirmOrnot=F',
									async:false,
									success:function(data){
									},
									error:function(){
										alert("ERROR");
									}								
								})
							}
							else{
								//여기서 중복검사해서 같으면 return해버려야됨
								var time_test_flag=0;
								
								 	$.ajax({
										type:'GET',
										url:'/getApplTimeTestInfo?now_email='+name,
										async:false,
										success:function(data){

											if(data.length!=0){//데이터는 있음
												var timote = data[0].requestTime.split('-');
												
												//같은날일 경우
												if(timote[0]==currentDate.getFullYear()&&timote[1]==currentDate.getMonth()&&timote[2]==currentDate.getDate()){
													var minute_diff= eval(eval((currentDate.getHours()-timote[3])*60)+eval(currentDate.getMinutes()-timote[4]));
													/* alert(minute_diff+"분지남"); */
													if(minute_diff<30) time_test_flag=1;//못가
												}
											}
											
										},
										error:function(){
											alert("ERROR");
										}								
									}) 		
								//
								
						if(time_test_flag==0){
							
								var str="";
								var str_name="";
								
								var cnt=1;
								str+=data[0].clientSecurityCode+"splittt";
								str_name+=data[0].clientHangul+"splittt";
								
								if(data.length>1){
				 					for(var i=1;i<data.length;i++){
				 							
										var flag=0;
				 						for(var j=0;j<i;j++){
					 						if(data[i].clientSecurityCode==data[j].clientSecurityCode)
					 						flag=1;			
					 						break;
				 						}
				 						if(flag==0){
					 						str+=data[i].clientSecurityCode+"splittt";	
					 						str_name+=data[i].clientHangul+"splittt";
					 						
					 						cnt++;
				 						}				 						
									}
								}								
								////최종 alert////		
										var arr_2=[];
										arr_2 = str.split("splittt");
										for(var i=0; i<cnt; i++) {
											if(arr_2[i]==null) arr_2[i]="-";
										}
									
										var arr=[];
										arr = str_name.split("splittt");
										for(var i=0; i<cnt; i++) {
											if(arr[i]==null) arr[i]="-";
										}
										
								 var test_hangul="안녕하세요. BLT특허법률사무소 입니다.<BR>요청하신 보안코드 정보는 아래와 같습니다.<BR><p><BR>";
								 
										for(var i=0; i<cnt; i++) {
											test_hangul+="고객명: "+arr[i]+"<BR>"+
														"인증이메일:"+name+"<BR>"+
														"보안코드: <b>"+arr_2[i]+"</b><BR>"+
														"바로가기: "+"https://mylist.blt.kr/list/"+arr_2[i]+"<BR><p><BR>";
										}
										
								 test_hangul += "BLT고객사건 조회페이지 (https://mylist.blt.kr) 에 접속하셔서,<BR> 상기 보안코드를 입력하시면 사건조회가 가능합니다."+
													   "<BR><p>보안코드를 요청한 적이 없으시면 즉시 feedback@blt.kr 로 연락 주시기 바랍니다. ";
										
								 location.href = "${pageContext.request.contextPath}/sendEmail?receiver_address="+name+"&msg_hangul="+encodeURI(test_hangul);           

								    $.ajax({
										type:'GET',
										url:'/insertEmialLogInfo?email='+name+'&requestTime='+time_now+'&confirmOrnot=T',
										async:false,
										success:function(data){
										},
										error:function(){
											alert("ERROR");
										}								
									})
									
								 swal({
									 	title:'\n',
										text:name+'로\n 보안코드를 전송하였습니다.',
										icon:"success",
									  })
 								swal.stopLoading();
							    swal.close();
			 					
								setTimeout(function()
			 						{window.location.reload();},2000);
						}
						
						//시간 안뚫림
						else{
							swal("\n","같은 메일주소로 30분 이내에 재전송할 수 없습니다.", "error"); 
						}
						 
							}
							
							},
								
							error:function(){
								alert("ajax고쳐야대");
							}
							
						})//End Ajax 					
				  }
				   
				}) 
		}
		
	    function textCopy() {
	        var dom = document.getElementById('app');
	        var temp = document.createElement('input');
	        temp.classList.add('on'); // 안보이도록 처리
	 
	        // 복사할 대상
	        var target = document.getElementById('copytext');
	        temp.value = target.value // 대상의 텍스트를 temp에 담아줌
	 
	        dom.appendChild(temp); // 삽입
	        temp.select(); // 선택
	        document.execCommand('copy'); // 복사
	    }
	    
</script> 
<hr size="10" style="border:white">
<div class="container"> 
	<hr width=650px size="10">
	<input type="image" src="static/images/logo.jpg" style="width: 80px;float:left; position: relative; z-index:1">
	<span style="display:inline-block; padding-left:22px; font-family:'KoPub Dotum'; font-size:39px; font-weight:bold; color:#5b5b5b;  margin-top:8px; vertical-align:middle;">BLT 자기사건 검색조회 서비스</span>
</div>
<hr width=650px size="10">
<hr width="100%" size="20" style="border:white">
<hr width="100%" size="20" style="border:white">

	<div></div>
   <div class="outer">
    <div class="inner">
   	 <div class="centered">
    	<div class="container" >
   	 	 <hr width="100%" size="10" style="border:white">
			<table id="addTable" style="vertical-align: middle;">
				 <tr>
					<td width="15%">
						<div class="form-group"> 					
					   		<span style="float:left">　　</span><input type="text" onkeydown="chkEnter()" style="width:65%; float:left" placeholder="보안코드를 입력해주세요." class="form-control" name="addText" id="firstkey">
					   		<span style="float:left">　</span>　
					    	<button id="btnSend" type="button" class= "btn btn-primary" style="width:15%; float:left">조회</button>
					    </div>
					 </td>
				 </tr>
		    </table>
		    <BR>
			 <span style="float:left">　　</span><button name="addButton" type=button onClick="insRow()" class= "btn btn-default" style="width:10%; float:left">추가</button>	
		</div>
 	</div>
  </div>
</div> 
   	 
<hr width="90%" size="10">
    <div class="container">
      <div class="outer">
              		  <font color=#898a8c>· 출원 목록 확인을 위해 안내받으신 보안코드를 입력해주세요. [<span onclick="promalert()" style="color:#3f76e2; text-decoration: underline; cursor:pointer">메일 주소로 보안코드 확인하기</span>]<br></font>
              		  <font color=#898a8c>· 추가 버튼을 통해 보안코드를 최대 5개까지 입력하실 수 있습니다.<br></font>
              		  <font color=#898a8c>· 보안코드를 입력하시면 사건 조회, 사건 검색, 관련 사건(패밀리)조회, excel 저장이 가능합니다.<br></font>
              		  <font color=#898a8c>· excel 파일은 일부 환경 하에서 경고메세지가 발생할 수 있으나 내용 상에는 문제가 없습니다.<br></font>
              		  <font color=#898a8c>· excel 파일에서 경고메세지 발생 시 다른 이름으로 저장하셔서 사용해주세요.<br></font>
              		  <font color=#898a8c>· 사용법 문의 또는 오류 발생 시 <a href="mailto:feedback@blt.kr">feedback@blt.kr</a> 로 메일 부탁드리겠습니다.<br></font>
              		  <hr size="10" style="border:white">
           </div>
        </div>
  	

</body>
</html> 