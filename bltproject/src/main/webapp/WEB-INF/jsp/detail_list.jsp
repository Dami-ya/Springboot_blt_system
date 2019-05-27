<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상세사건정보</title>

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<style>
/*  	@import url(//cdn.jsdelivr.net/font-nanum/1.0/nanumbarungothic/nanumbarungothic.css);
	table {font-family:'Nanum Gothic';}  */
	@import url(//cdn.jsdelivr.net/font-nanum/1.0/nanumbarungothic/nanumbarungothic.css);
	table {font-family:'Nanum Barun Gothic';
		   font-size:0.9em;}
</style>
</head>
<body>

<script type="text/javascript">

	$(function (){
				var reference="";
				reference="<c:out value="${Ref}" />";
				var code="";
				code="<c:out value="${Code}" />";
				var len="";
				var path=[];
				var name=[];
				
				$.ajax({
					type:'GET',
					url:'/getApplDetailInfo?secu_code='+code+'&ref_code='+reference,	
					async:false,
					success:function(data){
						if(data.length ==0){
							history.back();
							/* alert("해당 출원의 출원인과 보안코드가 일치하지 않습니다"); */
							return;
						}

						var phase="";
						if(data[0].phase1!=null) phase += data[0].phase1;
						if(data[0].phase2!=null) phase += ' - ' + data[0].phase2;
						if(data[0].phase3!=null) phase += ' - ' + data[0].phase3;
						
						/* phase=data[0].phase1+' - '+data[0].phase2+' - '+data[0].phaseMemo; */
						$("#appl_Ref").html(data[0].overseaNumber);
						$("#appl_Gubun").html(data[0].applGubun);
						$("#appl_Kind2").html(data[0].code2);
						$("#appl_Kind1").html(data[0].code1);
						
						$("#appl_Oldref").html(data[0].oldOurRef);
						$("#appl_Countrycode").html(data[0].countryCode);
						$("#appl_Phase").html(phase);
						$("#appl_Duedate").html(data[0].applDueDate);

						$("#appl_Accountref").html(data[0].eventNumberOfClient);
						$("#appl_Applicant").html(data[0].applicant);
						$("#appl_Account").html(data[0].applicantContact);
						$("#appl_Accountowner").html(data[0].taskOwnerOfClient);
						
						$("#appl_Oversearef").html(data[0].lawFirmNumber_Name);
						$("#appl_Oversea").html(data[0].lawFirmName);
						$("#appl_New").html(data[0].asNewDate);

						$("#appl_Eventgrade").html(data[0].eventGrade);
						$("#appl_Intercept").html(data[0].interceptOrNot);
						$("#appl_Pre").html(data[0].preFirm);
						
						$("#appl_receiveddate").html(data[0].receivedDate);
						$("#appl_Title").html(data[0].originalTitle);
						
						$("#appl_Hangul").html(data[0].applTitleHangul);
						$("#appl_Inventor").html(data[0].inventor);
						
						$("#appl_English").html(data[0].applTitleEnglish);
						$("#appl_priority").html(data[0].priorityNumber);

						$("#applNumber").html(data[0].applNumber);
						$("#pubNumber").html(data[0].pubNumber);
						$("#issueNumber").html(data[0].issueNumber);
						$("#priorityDate").html(data[0].priorityDate);
						
						$("#applDate").html(data[0].applDate);
						$("#pubDate").html(data[0].pubDate);
						$("#issueDate").html(data[0].issueDate);
						$("#motherApplNumber").html(data[0].motherApplNumber);
						
						$("#judgeCallNumber").html(data[0].judgeCallNumber);
						$("#objectionCallNumber").html(data[0].objectionCallNumber);
						$("#indepClaim").html(data[0].indepClaim);//출원-독
						$("#depClaim").html(data[0].depClaim);//출원-종
						$("#specPlainCount").html(data[0].specPlainCount);//출원-명
						$("#drawingCount").html(data[0].drawingCount);//출원-도
						$("#motherApplDate").html(data[0].motherApplDate);
						
						$("#judgeCallDate").html(data[0].judgeCallDate);
						$("#objectionCallDate").html(data[0].objectionCallDate);
						$("#indepClaimFinal").html(data[0].indepClaimFinal);//등록-독
						$("#depClaimFinal").html(data[0].depClaimFinal);//등록-종
						$("#specPlainCountFinal").html(data[0].specPlainCountFinal);//등록-명
						$("#drawingCountFinal").html(data[0].drawingCountFinal);//등록-도
						$("#searchCountry").html(data[0].searchCountry);//PCT메모_수리관청
						$("#applLang").html(data[0].applLang);//PCT메모_작성언어
						$("#krEnter").html(data[0].krEnter);//PCT메모_자기지정관련
						
						$("#examinDueDate").html(data[0].examinDueDate);
						$("#overseaApplDueDate").html(data[0].overseaApplDueDate);
						$("#pctCountryStageDueDate").html(data[0].pctCountryStageDueDate);
						$("#priorityDocsDueDate").html(data[0].priorityDocsDueDate);
						
						$("#examCallDate").html(data[0].examCallDate);
						$("#OverseaApplSubmitDate").html(data[0].OverseaApplSubmitDate);
						$("#pctCountryStageSubmitDate").html(data[0].pctCountryStageSubmitDate);
						$("#priorityDocsSubmitDate").html(data[0].priorityDocsSubmitDate);
						
						$("#expireDate").html(data[0].expireDate);
						
						$("#TradeApplType").html(data[0].tradeApplType);
						$("#TradeClass").html(data[0].tradeClass);
						$("#TradeRight").html(data[0].tradeRight);
						$("#TradeType").html(data[0].tradeType);
						$("#TradeProduct").html(data[0].tradeProduct);
						$("#DesignApplType").html(data[0].designApplType);
						$("#DesignExamType").html(data[0].designExamType);
						
						
						if(data[0].overseaNumber.substring(0,3)=='ATP' || data[0].overseaNumber.substring(0,3)=='BTP'){
							var table_trade = document.getElementById("detailTable_trade");
							var info_trade = document.getElementById("trade_info");
							info_trade.innerHTML="<div style='font-weight: bold; padding:8px;'>"+
							"　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　[상표 정보]</div>";
							table_trade.innerHTML=
									"<colgroup>"+
									"<col width='150px'/>"+
									"<col width='200px'/>"+
									"<col width='150px'/>"+
									"<col width='200px'/>"+
									"<col width='150px'/>"+
									"<col width='200px'/>"+
									"<col width='150px'/>"+
									"<col width='200px'/>"+
								    "</colgroup>"+    
								    "<tbody align='center'>"+  
								        "<tr bgcolor = '#ffffff'>"+
										"<td bgcolor = '#dce0e8'>다류/개별</td>"+
										"<td id='TradeApplType'></td>"+
				 						"<td bgcolor = '#dce0e8'>류</td>"+
										"<td id='TradeClass'></td>"+
										"<td bgcolor = '#dce0e8'>상표권리</td>"+
										"<td id='TradeRight'></td>"+
								        "<td bgcolor = '#dce0e8'>상표유형</td>   "+
								        "<td id='TradeType'></td>"+
								        "</tr>"+
								        "<tr bgcolor = '#ffffff'>  	"	+
										"<td bgcolor = '#dce0e8'>지정상품</td>"+
										"<td colspan='5' id='TradeProduct'></td>"+
										"<td bgcolor = '#dce0e8'>이미지</td>"+
										"<td>"+"</td>"+ 
								        "</tr>"+
									"</tbody>";
						}
						
						if(data[0].overseaNumber.substring(0,3)=='ADP' || data[0].overseaNumber.substring(0,3)=='BDP'){
							var table_design = document.getElementById("detailTable_design");
							var info_design = document.getElementById("design_info");
							info_design.innerHTML="<div style='font-weight: bold; padding:8px;'>"+
							"　　　　　　　　　　　　　　　　　　　 　　　　　　 　　　　　　[디자인 정보]</div>";
							table_design.innerHTML=
									"<colgroup>"+
									"<col width='300px'/>"+
									"<col width='300px'/>"+
									"<col width='300px'/>"+
									"<col width='300px'/>"+
								    "</colgroup>"+    
								    "<tbody align='center'>"+  
								        "<tr bgcolor = '#ffffff'>"+
										"<td bgcolor = '#dce0e8'>출원종류</td>"+
										"<td id='DesignApplType'></td>"+
				 						"<td bgcolor = '#dce0e8'>심사종류</td>"+
										"<td id='DesignExamType'></td>"+
								        "</tr>"+
									"</tbody>";
						}						
					},	
					error:function(){
						alert("Ajax error");
					}
				})//Ajax end
				
				$.ajax({
					type:'GET',
					url:'/getApplFileInfo?number='+reference,
					async:false,
					success:function(data){
						document.getElementById('datalen').innerHTML = data.length;
						len=data.length;
						
 						var fileinfo = document.getElementById("file_info");
 						var tbl_str="";
 						for(var i=0;i<data.length;i++){
 							tbl_str+=
								"<tr height=25>"
									+"<td>"+eval(i+1)+"</td>"
									+"<td id=NewFileName_"+i+" align = 'left' style='cursor:pointer'>"+"</td>"
									+"<td id=FileSize_"+i+" align = 'left'>"+"</td>"
									+"<td id=RegisterDate_"+i+" align = 'left'>"+"</td>"
								+"</tr>";	
 						}
 						
 						fileinfo.innerHTML=tbl_str;
 						
 						for(var i=0;i<data.length;i++){
 							$("#NewFileName_"+i).html(data[i].newFileName);
							$("#FileSize_"+i).html(data[i].fileSize);
							$("#RegisterDate_"+i).html(data[i].registerDate);
							
							path[i]=data[i].fullFilePath.replace(/\\\\/gi, '/')+'/'+data[i].newFileName;
							name[i]=data[i].newFileName;
						} 
					},
					error:function(){
						alert("Ajax error");
					}
				})//Ajax end

  	  			for(var i=0;i<len;i++)	{
	 				 (function(i){
	 				 	$('#NewFileName_'+i).click(function(){ 

 	 				 		var filePath = encodeURIComponent(path[i]);
 	 					    var fileName = encodeURIComponent(name[i]);

	 			location.href = "${pageContext.request.contextPath}/fileDownload?filePath="+filePath+"&fileName="+fileName;	 			
	 				 	})	
	 				 })(i)
	 	  		}
				
	});
	
</script>
<div class="container">
<button type=button onClick="history.back()" class= "btn btn-outline-secondary" style="width:115px; font-size:16px; font-family:'Nanum Barun Gothic'; position:absolute;top:20px;left:65px">뒤로 가기</button>	
<hr width="100%" size="9" style="position:absolute;top:60px;left:50px"> 
<BR>
<div></div>
<BR>
<div></div>
<BR>
<div></div>
<BR>
<div style="font-weight: bold;padding:8px;">　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　[기본 정보]</div>
	<table id="detailTable_basic" style="border:1px solid #ccc" border="2">

		<colgroup>
		  <col width="120px"/>
		  <col width="200px"/>
		  <col width="120px"/>
		  <col width="150px"/>
		  <col width="120px"/>
		  <col width="250px"/>
		  <col width="120px"/>
		  <col width="100px%"/>
	    </colgroup>
		    
		    <tbody align="center">    
    	<tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">당소Ref</td>
			 <td id="appl_Ref"></td>
			 <td bgcolor = "#dce0e8">출원구분</td>
			 <td id="appl_Gubun"></td>
			 <td bgcolor = "#dce0e8">권리형태</td>
             <td id="appl_Kind2"></td>
             <td bgcolor = "#dce0e8">출원형태</td>   
             <td id="appl_Kind1"></td>
        </tr>   
        <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">구당소Ref</td>
			 <td id="appl_Oldref"></td>
			 <td bgcolor = "#dce0e8">국가</td>
			 <td id="appl_Countrycode"></td>
			 <td bgcolor = "#dce0e8">진행단계</td>
             <td id="appl_Phase"></td>
             <td bgcolor = "#dce0e8">출원마감일</td>   
             <td id="appl_Duedate"></td>
        </tr>
        <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">거래처Ref</td>
			 <td id="appl_Accountref"></td>
			 <td bgcolor = "#dce0e8">출원인</td>
			 <td id="appl_Applicant"></td>
			 <td bgcolor = "#dce0e8">거래처</td>
			 <td id="appl_Account"></td>
             <td bgcolor = "#dce0e8">거래처담당</td> 
             <td id="appl_Accountowner"></td>  
        </tr> 
        <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">해외대리인Ref</td>
			 <td id="appl_Oversearef"></td>
			 <td bgcolor = "#dce0e8">해외대리인</td>
			 <td id="appl_Oversea"></td>
			 <td bgcolor = "#dce0e8">신규성의제일</td>
			 <td colspan="3" id="appl_New"></td>

         </tr>
         <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">사건등급</td>
			 <td id="appl_Eventgrade"></td>
			 <td bgcolor = "#dce0e8">중간이관</td>
			 <td id="appl_Intercept"></td>
			 <td bgcolor = "#dce0e8">이전사무소</td>
			 <td colspan="3" id="appl_Pre"></td>
         </tr>
         <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">수임일</td>
			 <td id="appl_receiveddate"></td>
			 <td  bgcolor = "#dce0e8">발명명칭</td>
			 <td colspan="5" id="appl_Title"></td>
         </tr> 
		    </tbody>	
	</table>
	<p></p>
	<div style="font-weight: bold;padding:8px;">　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　[출원 정보]</div>
	
	<table id="detailTable_appl" style="border:1px solid #ccc" border="2">

		<colgroup>
		  <col width="130px"/>
		  <col width="180px"/>
		  <col width="100px"/>
		  <col width="160px"/>
		  <col width="100px"/>
		  <!--  -->
		  <col width="40px"/>
		  <col width="30px"/>
		  <col width="40px"/>
		  <col width="30px"/>
		  <col width="50px"/>
		  <col width="30px"/>
		  <col width="50px"/>
		  <col width="30px"/>
		  <!--  -->
		  <col width="120px"/>
		  <!--  -->
		  <col width="5%"/>
		  <col width="5%"/>
		  <col width="5%"/>
		  <!--  -->
	    </colgroup>

		    <tbody align="center">    
    	<tr bgcolor = "#ffffff">  		
			 <td  bgcolor = "#dce0e8">출원명칭_한글</td>
			 <td colspan="12" id="appl_Hangul"></td>
			 <td bgcolor = "#dce0e8">발명자</td> 
			 <td colspan="5" id="appl_Inventor"></td> 
         </tr>   
        <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">출원명칭_영문</td>
			 <td colspan="12" id="appl_English"></td> 
			 <td bgcolor = "#dce0e8">우선권번호</td>
			 <td colspan="5" id=appl_priority></td> 
        </tr>
        <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">출원번호</td>
			 <td id="applNumber"></td> 
			 <td bgcolor = "#dce0e8">공개번호</td>
			 <td id="pubNumber"></td> 
			 <td bgcolor = "#dce0e8">등록번호</td>
             <td colspan="8" id="issueNumber"></td> 
             <td bgcolor = "#dce0e8">최우선일</td>   
             <td colspan="5" id="priorityDate"></td> 
         </tr> 
        <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">출원일</td>
			 <td id="applDate"></td> 
			 <td bgcolor = "#dce0e8">공개일</td>
			 <td id="pubDate"></td> 
			 <td bgcolor = "#dce0e8">등록일</td>
			 <td  colspan="8" id="issueDate"></td> 
             <td bgcolor = "#dce0e8">모출원번호</td>   
             <td colspan="5" id="motherApplNumber"></td> 
         </tr>
         <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">심판청구번호</td>
			 <td id="judgeCallNumber"></td> 
			 <td bgcolor = "#dce0e8">이의신청번호</td>
			 <td id="objectionCallNumber"></td> 
			 <td bgcolor = "#dce0e8">출원사항</td>
			 <td bgcolor = "#dce0e8">독립</td>
			 <td id="indepClaim"></td>
			 <td bgcolor = "#dce0e8">종속</td>
			 <td id="depClaim"></td>
			 <td bgcolor = "#dce0e8">명세서</td>
			 <td id="specPlainCount"></td>
			 <td bgcolor = "#dce0e8">도면수</td>
			 <td id="drawingCount"></td>
             <td bgcolor = "#dce0e8">모출원일</td>   
             <td colspan="5" id="motherApplDate"></td> 
         </tr>					
         <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">심판청구일</td>
			 <td id="judgeCallDate"></td>
			 <td bgcolor = "#dce0e8">이의신청일</td>
			 <td id="objectionCallDate"></td> 
			 <td bgcolor = "#dce0e8">등록사항</td>
			 <td bgcolor = "#dce0e8">독립</td>
			 <td id="indepClaimFinal"></td>
			 <td bgcolor = "#dce0e8">종속</td>
			 <td id="depClaimFinal"></td>
			 <td bgcolor = "#dce0e8">명세서</td>
			 <td id="specPlainCountFinal"></td>
			 <td bgcolor = "#dce0e8">도면수</td>
			 <td id="drawingCountFinal"></td>
             <td bgcolor = "#dce0e8">PCT메모</td>   
             <td id="searchCountry"></td> 
             <td id="applLang"></td> 
             <td id="krEnter"></td> 
         </tr> 
		    </tbody>
	</table>
	<p></p>
			<div id="trade_info"></div>
	<table id="detailTable_trade" style="border:1px solid #ccc" border="2">
	</table>
	
			<div id="design_info"></div>
	<table id="detailTable_design" style="border:1px solid #ccc" border="2">
	</table>
	
		<div style="font-weight: bold; padding:8px;">　　　　　　　　　　　　　　　　　　　 　　　　　　 　　　　　　[마감일 정보]</div>
	<table id="detailTable_magam" style="border:1px solid #ccc" border="2">

		<colgroup>
		  <col width="150px"/>
		  <col width="200px"/>
		  <col width="150px"/>
		  <col width="200px"/>
		  <col width="150px"/>
		  <col width="200px"/>
		  <col width="150px"/>
		  <col width="200px"/>
	    </colgroup>
	    
		    <tbody align="center">    
        <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">심사청구마감일</td>
			 <td id="examinDueDate"></td>
			 <td bgcolor = "#dce0e8">해외출원마감일</td>
			 <td id="overseaApplDueDate"></td>
			 <td bgcolor = "#dce0e8">PCT진입마감일</td>
			 <td id="pctCountryStageDueDate"></td>
             <td bgcolor = "#dce0e8">우선권증명마감일</td>   
             <td id="priorityDocsDueDate"></td>
         </tr> 
        <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">심사청구일</td>
			 <td id="examCallDate"></td>
			 <td bgcolor = "#dce0e8">해외출원제출일</td>
			 <td id="OverseaApplSubmitDate"></td>
			 <td bgcolor = "#dce0e8">PCT진입제출일</td>
			 <td id="pctCountryStageSubmitDate"></td>
             <td bgcolor = "#dce0e8">우선권증명제출일</td> 
             <td id="priorityDocsSubmitDate"></td>  
         </tr> 
         <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">존속기간만료일</td>
			 <td id="expireDate"></td>
			 <td bgcolor = "#dce0e8">기타마감일 1</td>
			 <td></td>
			 <td bgcolor = "#dce0e8">기타마감일 2</td>
			 <td></td>
             <td bgcolor = "#dce0e8">기타마감일 3</td>
             <td></td>
         </tr> 
		    </tbody>
	</table>
	<p></p>
	<div style="font-weight: bold; padding:8px;">　　　　　　　　　　　　　　　　　　　　 　　　　　　　  　　　　[첨부 파일]
		<span style="color:#666662; padding:8px;">총 <span id="datalen"></span>개</span>
	</div>
		<table style="border:1px solid #ccc;" border="2" >
					     <colgroup>
					  	    <col width="30px"/>
					        <col width="1000px"/>
					        <col width="100px"/>
					        <col width="250px"/>
					     </colgroup>
		    <thead>
		        <tr>
		       		<th height=30 align = "center" scope="col" bgcolor="#dce0e8">　</th>
		            <th align = "center" scope="col" bgcolor="#dce0e8">　파일이름 (첨부 파일명 클릭 시 다운로드)</th>
		            <th align = "center" scope="col" bgcolor="#dce0e8">용량</th>
		            <th align = "center" scope="col" bgcolor="#dce0e8">생성일자</th>
		        </tr>
		    </thead>	 
		    <tbody id="file_info">    
		    </tbody>
        </table>  
        <p>
        　
        <p>
       	　
	</div>
</body>
</html>