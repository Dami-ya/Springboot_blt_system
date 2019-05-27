<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%> --%>
<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>리스트페이지</title>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<style>
 	@import url(//cdn.jsdelivr.net/font-nanum/1.0/nanumbarungothic/nanumbarungothic.css);
	table, body, div, p, span {font-family:'Nanum Barun Gothic';}
		
		body{
		  padding:20px 20px;
		}
		
		.results tr[visible='false'],
		.no-result{
		  display:none;
		}
		
		.results tr[visible='true']{
		  display:table-row;
		}
		
		.counter{
		  padding:8px; 
		  color:#666662;
		}

			table {
				width: 1000px;
				table-layout: fixed;
    			word-wrap: break-word;
			}
			td {
				padding: 100px;
				border: 1px solid #666666;
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
<!-- 저장된 제이쿼리 스크립트 엔진 호출 -->
<script type="text/javascript">	

		$(function (){
			     
			var all_flag=0;
			var urlarr=["","","","",""];
			var tmp="<c:out value="${value_0}" />".split('&amp;');
						
			$.ajax({
					type:'GET',
					async:false,
					url:'/getApplBrekerInfo',
					success:function(data){
						for(var i=0;i<data.length;i++){
							if(tmp[0]==data[i].keyname && data[i].used=='T '){
								all_flag=1;
								break;
							}
							if(tmp[0]==data[i].keyname && data[i].used=='F '){
								swal("해당 키의 사용여부가 F로 설정되어 있습니다.")
 	 							setTimeout(function()
 	 									{history.back();},2000);
							}
						}
						
					},
 					error:function(){
 						alert("Ajax error");
 					}						
 			})//End Ajax
 			
 			if(all_flag==1){

 				if(tmp[1]==null || tmp[1]=="") tmp[1]="미검색미검색입니다";
 				else tmp[1]=encodeURI(tmp[1]);
 				if(tmp[2]==null || tmp[2]=="") tmp[2]="미검색미검색입니다";
 				else tmp[2]=encodeURI(tmp[2]);
 				if(tmp[3]==null || tmp[3]=="") tmp[3]="미검색미검색입니다";
 				else tmp[3]=encodeURI(tmp[3]);
 				if(tmp[4]==null || tmp[4]=="") tmp[4]="미검색미검색입니다";
 				else tmp[4]=encodeURI(tmp[4]);				
 				 
   					 $.ajax({
 						type:'GET',
 						async:false,
  						url:'/getApplCheatKeyInfo?cheat_1='+tmp[1]+'&cheat_2='+tmp[2]
 						 +'&cheat_3='+tmp[3]+'&cheat_4='+tmp[4],
 						success:function(data){
 							if(data.length == 0){
 								swal("조회할 데이터가 없습니다.");
 	 							setTimeout(function()
 									{history.back();},1400);
 							}
 							
 							var urlcnt=0;
 							//상위 5개만~ 아!! 근데 테이더가 1개인데 5개까지 해버리면 멈춘다는거 알고있었지!!
 							for(var i=0;i<data.length;i++){
 								if(urlcnt==5) break;
	 							urlarr[i]=data[i].clientSecurityCode;
	 							urlcnt++;
 							}
 						},
 						error:function(){
 							alert("Ajax error");
 						}
 						
 					})//End Ajax
 			}

			 if(all_flag==0){
	 			  urlarr[0]="<c:out value="${value_0}" />".substring(0,16);
				  urlarr[1]="<c:out value="${value_0}" />".substring(16,32);
				  urlarr[2]="<c:out value="${value_0}" />".substring(32,48);
				  urlarr[3]="<c:out value="${value_0}" />".substring(48,64);
				  urlarr[4]="<c:out value="${value_0}" />".substring(64,80);
			 }
 				  
				  var applicant="";
				  var applicant_2="";
				  var applicant_3="";
				  var applicant_4="";
				  var applicant_5="";
				  var client_num="";

				  $.ajax({
					type:'GET',
					url:'/getApplBasicInfo?input_code_0='+urlarr[0]+'&input_code_1='+urlarr[1]+'&input_code_2='+urlarr[2]
					 +'&input_code_3='+urlarr[3]+'&input_code_4='+urlarr[4], 
					async:false,
					success:function(data){
						if(data.length ==0){
							swal("조회할 데이터가 없습니다.");
 							setTimeout(function()
								{history.back();},1400);
							}
						document.getElementById('datalen').innerHTML = data.length;
						
 							var table = document.getElementById("table_body"); 	
							var str='';
							for(var i=0;i<data.length;i++){							
								str+=
									"<tr>"
										 if(data[i].isfamily=='1'){
									str+="<td align = 'left'>"+"<input type='button' id=result_family_"+i+" value='확인' class= 'btn btn-default' style='width:80px'>"+"</td>";        
										}
										else{
									str+="<td align = 'left'></td>";
										}
									str+="<td id=result_receiveddate_"+i+" align = 'left' style='cursor:pointer'>"+"</td>"
										+"<td id=result_kind2_"+i+" align = 'left'>"+"</td>"
										+"<td id=result_country_"+i+" align = 'left'>"+"</td>"
										+"<td id=result_kind1_"+i+" align = 'left'>"+"</td>"
										+"<td id=result_appltitle_"+i+" align = 'left' style='cursor:pointer'>"+"</td>"
										+"<td id=result_inventor_"+i+" align = 'left'>"+"</td>"
										+"<td id=result_event_"+i+" align = 'left' style='cursor:pointer'>"+"</td>"
										+"<td id=result_ref_"+i+" align = 'left' style='cursor:pointer'>"+"</td>"
										+"<td id=result_phase_"+i+" align = 'left'>"+"</td>"
										+"<td id=result_applnum_"+i+" align = 'left' style='cursor:pointer'>"+"</td>"
										+"<td id=result_appldate_"+i+" align = 'left'>"+"</td>"
										+"<td id=result_issuenum_"+i+" align = 'left'>"+"</td>"
										+"<td id=result_issuedate_"+i+" align = 'left'>"+"</td>"
										+"<td id=result_moapplnum_"+i+" align = 'left'>"+"</td>"
										+"<td id=result_moappldate_"+i+" align = 'left'>"+"</td>"
										+"<td id=result_applicant_"+i+" align = 'left'>"+"</td>" 
									+"</tr>";
							}
							table.innerHTML=str;
							
			 				var result=[];
	 						for(var i=0;i<data.length;i++){
								 if(data[i].phase1==null){
									 data[i].phase1='';
								 } 
								 else{
									 result[i]=data[i].phase1;
								 }
								 if(data[i].phase2==null){
									 data[i].phase2='';
								 }
								 else{
									 result[i]+=' - '+ data[i].phase2;
								 }
								 if(data[i].phaseMemo==null){
									 data[i].phaseMemo='';
								 }
								 else{
									 result[i]+=' - '+ data[i].phaseMemo;
								 }
								 $("#result_inventor_"+i).html(data[i].inventor);
								 $("#result_country_"+i).html(data[i].countryCode);
								 $("#result_kind1_"+i).html(data[i].code1);
								 $("#result_kind2_"+i).html(data[i].code2);
								 $("#result_event_"+i).html(data[i].eventNumberOfClient);
								 $("#result_phase_"+i).html(result[i]);
								 $("#result_ref_"+i).html(data[i].overseaNumber);
								 $("#result_applnum_"+i).html(data[i].applNumber);
								 $("#result_appldate_"+i).html(data[i].applDate);
								 $("#result_receiveddate_"+i).html(data[i].receivedDate)
								 $("#result_issuenum_"+i).html(data[i].issueNumber);
								 $("#result_issuedate_"+i).html(data[i].issueDate);
								 $("#result_moapplnum_"+i).html(data[i].motherApplNumber);
								 $("#result_moappldate_"+i).html(data[i].motherApplDate);
								 $("#result_applicant_"+i).html(data[i].applicant);
								 $("#result_appltitle_"+i).html(data[i].applTitleHangul);
	 						}
			 				
		 	 var name=["","","","",""];
		 	 var num=[0,0,0,0,0];
			 var clientnum=[];
			 		
			 //전부 data가 0건일 경우 빼줘야 한다.
			 for(var j=0;j<5;j++){

				if(urlarr[j]!=""){
						  $.ajax({
								type:'GET',
								url:'/getApplSimpleInfo?code_one='+urlarr[j],
								async:false,
								success:function(data){
									 name[j] = data[0].clientHangul;
									 clientnum[j] = data[0].clientNumber;
								},
		 						error:function(){
		 							alert("Ajax error");
		 						}
						  })
		
			 			for(var i=0;i<data.length;i++){
			 				if(urlarr[j]==data[i].clientSecurityCode){
			 					num[j]++;
			 				}	
			 			}
				}
			 }

					var name0 = document.getElementById("name_0");
					name0.innerHTML="<span>　· "+name[0]+":"+num[0]+"건  ("+urlarr[0]+")"+"</span>";

					if(name[1]){var name1 = document.getElementById("name_1");
					name1.innerHTML="<span>　· "+name[1]+":"+num[1]+"건   ("+urlarr[1]+")"+"</span>";}
					if(name[2]){var name2 = document.getElementById("name_2");
					name2.innerHTML="<span>　· "+name[2]+":"+num[2]+"건  ("+urlarr[2]+")"+"</span>";}
					if(name[3]){var name3 = document.getElementById("name_3");
					name3.innerHTML="<div></div><span>　· "+name[3]+":"+num[3]+"건  ("+urlarr[3]+")"+"</span>";}
					if(name[4]){var name4 = document.getElementById("name_4");
					name4.innerHTML="<span>　· "+name[4]+":"+num[4]+"건  ("+urlarr[4]+")"+"</span>";}
					
					var mylist = document.getElementById("mylist");
					var is_list = "<li></li>"+"<li><a href='${pageContext.request.contextPath}/relation_map/"+urlarr[0]+"/"+clientnum[0]+"'>"+name[0]+"　</a></li>";              

 					if(name[1]){is_list+="<li class='divider'></li><li><a href='${pageContext.request.contextPath}/relation_map/"+urlarr[1]+"/"+clientnum[1]+"'>"+name[1]+"　</a></li>";}
					if(name[2]){is_list+="<li class='divider'></li><li><a href='${pageContext.request.contextPath}/relation_map/"+urlarr[2]+"/"+clientnum[2]+"'>"+name[2]+"　</a></li>";}
					if(name[3]){is_list+="<li class='divider'></li><li><a href='${pageContext.request.contextPath}/relation_map/"+urlarr[3]+"/"+clientnum[3]+"'>"+name[3]+"　</a></li>";}
					if(name[4]){is_list+="<li class='divider'></li><li><a href='${pageContext.request.contextPath}/relation_map/"+urlarr[4]+"/"+clientnum[4]+"'>"+name[4]+"　</a></li>";}
					
					mylist.innerHTML = is_list;
					
			 				applicant=data[0].applicant;
			 	  			
 			 	  			for(var i=0;i<data.length;i++)	{
			 				 (function(i){
			 				 	$('#result_receiveddate_'+i).click(function(){ 
			 				 		location.href="${pageContext.request.contextPath}/detail_list/"+data[i].clientSecurityCode+"/"+data[i].applSerialNumber;
			 				 			  })	
			 				 })(i)
			 	  			}
 			 	  			for(var i=0;i<data.length;i++)	{
 				 				 (function(i){
 				 				 	$('#result_appltitle_'+i).click(function(){ 
 				 				 		location.href="${pageContext.request.contextPath}/detail_list/"+data[i].clientSecurityCode+"/"+data[i].applSerialNumber;
 				 				 			  })	
 				 				 })(i)
 				 	  			}
 			 	  			for(var i=0;i<data.length;i++)	{
 				 				 (function(i){
 				 				 	$('#result_event_'+i).click(function(){ 
 				 				 		location.href="${pageContext.request.contextPath}/detail_list/"+data[i].clientSecurityCode+"/"+data[i].applSerialNumber;
 				 				 			  })	
 				 				 })(i)
 				 	  			}
 			 	  			for(var i=0;i<data.length;i++)	{
 				 				 (function(i){
 				 				 	$('#result_ref_'+i).click(function(){ 
 				 				 		location.href="${pageContext.request.contextPath}/detail_list/"+data[i].clientSecurityCode+"/"+data[i].applSerialNumber;
 				 				 			  })	
 				 				 })(i)
 				 	  			}
 			 	  			for(var i=0;i<data.length;i++)	{
				 				 (function(i){
				 				 	$('#result_applnum_'+i).click(function(){ 
				 				 		location.href="${pageContext.request.contextPath}/detail_list/"+data[i].clientSecurityCode+"/"+data[i].applSerialNumber;
				 				 			  })	
				 				 })(i)
				 	  			}
			 	  			
 			 	  			//버튼
			 	  			for(var i=0;i<data.length;i++)	{
			 	  				if(data[i].isfamily=='1')
				 				 (function(i){
				 				 	$('#result_family_'+i).click(function(){ 
				 				 		location.href="${pageContext.request.contextPath}/single_relation_map/"+data[i].clientSecurityCode+"/"+data[i].clientNumber+"/"+data[i].applSerialNumber;
				 				 			  })	
				 				 })(i)
				 	  		}
					},
					
					error:function(){
						alert("Ajax error");
					}
					
				})//End Ajax 
				
				$('#ToExcel').click(function(){
					location.href="${pageContext.request.contextPath}/excel_export/"+applicant+"/"+urlarr[0]+"/"+urlarr[1]+"/"+urlarr[2]+"/"+urlarr[3]+"/"+urlarr[4];
				})

		});

</script> 	
<script>
  $(document).ready(function() {
	  $(".search").keyup(function () {
		    var searchTerm = $(".search").val();
		    var listItem = $('.results tbody').children('tr');
		    var searchSplit = searchTerm.replace(/ /g,"'):containsi('")	    
		  $.extend($.expr[':'], {'containsi': function(elem, i, match, array){
		        return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
		    }
		  });		    
		  $(".results tbody tr").not(":containsi('" + searchSplit + "')").each(function(e){
		    $(this).attr('visible','false');
		  });
		  $(".results tbody tr:containsi('" + searchSplit + "')").each(function(e){
		    $(this).attr('visible','true');
		  });
		  var jobCount = $('.results tbody tr[visible="true"]').length;
		    $('.counter').text('중 '+jobCount+'건');
		  if(jobCount == '0') {$('.no-result').show();}
		    else {$('.no-result').hide();}
				  });
		});
</script>

<BR>
<span></span>
<span id="name_0"></span>
<span id="name_1"></span>
<span id="name_2"></span>
<span id="name_3"></span>
<span id="name_4"></span>

 <hr width="100%" size="10">			
 			<!-- 여기부터 Search -->
 			<form>
 			<div class="form-group">
 				<span style="float:left; color:#666662; padding:8px;position:absolute;top:120px;left:35px">총 <span id="datalen"></span>건</span>
 				<span class="counter" style="float:left;position:absolute;top:120px;left:90px"></span>
    			<input type="text" style="width:550px;position:absolute;top:120px;left:180px" class="search form-control" placeholder="검색어를 입력하세요.">
    			<input type="button" value="초기화" class= "btn btn-default" onClick="window.location.reload()" style="float:left;position:absolute;top:120px;left:740px">
    			<input type="button" id="ToExcel" value="엑셀로 저장하기" class= "btn btn-success" style="width:120px;position:absolute;top:120px;left:810px">
    			<!-- <input type="button" id="sendMail" value="메일보내져라얍" class= "btn btn-default" style="width:120px;position:absolute;top:120px;left:1150px"> -->
    			
    			
    			<div class="dropdown" style="width:130px;position:absolute;top:120px;left:950px">
				  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" >
				  <span>&nbsp;&nbsp;전체 관련사건 보기&nbsp;&nbsp;</span> <span class="caret"></span>
				  </button>
				  <ul id="mylist" class="dropdown-menu" role="menu">
				  </ul>				  
				</div>
			</div>
			</form>
<BR>
<BR>
<BR>
<p>
	<hr width="100px" size="20" style="border:white">
	
    <div id="table_div">
	<table class="table table-striped table-hover table-bordered results " id="listTable">
					     <colgroup>
					     	<col width="98px"/><!-- 패밀리 여부 -->
					        <col width="110px"/>
					        <col width="150px"/>
					        <col width="50px"/>
					        <col width="100px"/>
					        <col width="420px"/>
					        <col width="200px"/>
					        <col width="120px"/><!-- 고객관리번호 -->
					        <col width="170px"/>
					        <col width="300px"/>
					        <col width="160px"/><!-- 출원번호 -->
					        <col width="100px"/>
					        <col width="160px"/>
					        <col width="100px"/>
					        <col width="180px"/>
					        <col width="150px"/>
					        <col width="180px"/>
					    </colgroup>
		    <thead class="grey lighten-2">
		        <tr>
		        	<th align = "left" scope="col">관련사건 보기</th>
		            <th align = "left" scope="col">사건생성일</th>
		            <th align = "left" scope="col">권리구분</th>
		            <th align = "left" scope="col">국가</th>
		            <th align = "left" scope="col">출원종류</th>
		            <th align = "left" scope="col">출원명</th>
		            <th align = "left" scope="col">발명자</th>
		            <th align = "left" scope="col">고객관리번호</th>
		            <th align = "left" scope="col">BLT관리번호</th>
		            <th align = "left" scope="col">현재진행단계</th>
		            <th align = "left" scope="col">출원번호</th>
		            <th align = "left" scope="col">출원일</th>
		            <th align = "left" scope="col">등록번호</th>
		            <th align = "left" scope="col">등록일</th>
		            <th align = "left" scope="col">기초출원번호</th>
		            <th align = "left" scope="col">기초출원일</th>
		            <th align = "left" scope="col">출원인</th>
		        </tr>
		            <tr class="warning no-result">
     				 <td colspan="16"><i class="fa fa-warning"></i>검색 결과가 없습니다.</td>
  				</tr>
		    </thead>	 
		    <tbody id="table_body">    
		    </tbody>
                </table>   
		</div>
</body>
</html>