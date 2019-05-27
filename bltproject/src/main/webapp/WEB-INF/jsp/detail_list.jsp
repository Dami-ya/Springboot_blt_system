<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�󼼻������</title>

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
							/* alert("�ش� ����� ����ΰ� �����ڵ尡 ��ġ���� �ʽ��ϴ�"); */
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
						$("#indepClaim").html(data[0].indepClaim);//���-��
						$("#depClaim").html(data[0].depClaim);//���-��
						$("#specPlainCount").html(data[0].specPlainCount);//���-��
						$("#drawingCount").html(data[0].drawingCount);//���-��
						$("#motherApplDate").html(data[0].motherApplDate);
						
						$("#judgeCallDate").html(data[0].judgeCallDate);
						$("#objectionCallDate").html(data[0].objectionCallDate);
						$("#indepClaimFinal").html(data[0].indepClaimFinal);//���-��
						$("#depClaimFinal").html(data[0].depClaimFinal);//���-��
						$("#specPlainCountFinal").html(data[0].specPlainCountFinal);//���-��
						$("#drawingCountFinal").html(data[0].drawingCountFinal);//���-��
						$("#searchCountry").html(data[0].searchCountry);//PCT�޸�_������û
						$("#applLang").html(data[0].applLang);//PCT�޸�_�ۼ����
						$("#krEnter").html(data[0].krEnter);//PCT�޸�_�ڱ���������
						
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
							"����������������������������������������������������������������[��ǥ ����]</div>";
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
										"<td bgcolor = '#dce0e8'>�ٷ�/����</td>"+
										"<td id='TradeApplType'></td>"+
				 						"<td bgcolor = '#dce0e8'>��</td>"+
										"<td id='TradeClass'></td>"+
										"<td bgcolor = '#dce0e8'>��ǥ�Ǹ�</td>"+
										"<td id='TradeRight'></td>"+
								        "<td bgcolor = '#dce0e8'>��ǥ����</td>   "+
								        "<td id='TradeType'></td>"+
								        "</tr>"+
								        "<tr bgcolor = '#ffffff'>  	"	+
										"<td bgcolor = '#dce0e8'>������ǰ</td>"+
										"<td colspan='5' id='TradeProduct'></td>"+
										"<td bgcolor = '#dce0e8'>�̹���</td>"+
										"<td>"+"</td>"+ 
								        "</tr>"+
									"</tbody>";
						}
						
						if(data[0].overseaNumber.substring(0,3)=='ADP' || data[0].overseaNumber.substring(0,3)=='BDP'){
							var table_design = document.getElementById("detailTable_design");
							var info_design = document.getElementById("design_info");
							info_design.innerHTML="<div style='font-weight: bold; padding:8px;'>"+
							"�������������������������������������� ������������ ������������[������ ����]</div>";
							table_design.innerHTML=
									"<colgroup>"+
									"<col width='300px'/>"+
									"<col width='300px'/>"+
									"<col width='300px'/>"+
									"<col width='300px'/>"+
								    "</colgroup>"+    
								    "<tbody align='center'>"+  
								        "<tr bgcolor = '#ffffff'>"+
										"<td bgcolor = '#dce0e8'>�������</td>"+
										"<td id='DesignApplType'></td>"+
				 						"<td bgcolor = '#dce0e8'>�ɻ�����</td>"+
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
<button type=button onClick="history.back()" class= "btn btn-outline-secondary" style="width:115px; font-size:16px; font-family:'Nanum Barun Gothic'; position:absolute;top:20px;left:65px">�ڷ� ����</button>	
<hr width="100%" size="9" style="position:absolute;top:60px;left:50px"> 
<BR>
<div></div>
<BR>
<div></div>
<BR>
<div></div>
<BR>
<div style="font-weight: bold;padding:8px;">����������������������������������������������������������������[�⺻ ����]</div>
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
			 <td bgcolor = "#dce0e8">���Ref</td>
			 <td id="appl_Ref"></td>
			 <td bgcolor = "#dce0e8">�������</td>
			 <td id="appl_Gubun"></td>
			 <td bgcolor = "#dce0e8">�Ǹ�����</td>
             <td id="appl_Kind2"></td>
             <td bgcolor = "#dce0e8">�������</td>   
             <td id="appl_Kind1"></td>
        </tr>   
        <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">�����Ref</td>
			 <td id="appl_Oldref"></td>
			 <td bgcolor = "#dce0e8">����</td>
			 <td id="appl_Countrycode"></td>
			 <td bgcolor = "#dce0e8">����ܰ�</td>
             <td id="appl_Phase"></td>
             <td bgcolor = "#dce0e8">���������</td>   
             <td id="appl_Duedate"></td>
        </tr>
        <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">�ŷ�óRef</td>
			 <td id="appl_Accountref"></td>
			 <td bgcolor = "#dce0e8">�����</td>
			 <td id="appl_Applicant"></td>
			 <td bgcolor = "#dce0e8">�ŷ�ó</td>
			 <td id="appl_Account"></td>
             <td bgcolor = "#dce0e8">�ŷ�ó���</td> 
             <td id="appl_Accountowner"></td>  
        </tr> 
        <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">�ؿܴ븮��Ref</td>
			 <td id="appl_Oversearef"></td>
			 <td bgcolor = "#dce0e8">�ؿܴ븮��</td>
			 <td id="appl_Oversea"></td>
			 <td bgcolor = "#dce0e8">�űԼ�������</td>
			 <td colspan="3" id="appl_New"></td>

         </tr>
         <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">��ǵ��</td>
			 <td id="appl_Eventgrade"></td>
			 <td bgcolor = "#dce0e8">�߰��̰�</td>
			 <td id="appl_Intercept"></td>
			 <td bgcolor = "#dce0e8">�����繫��</td>
			 <td colspan="3" id="appl_Pre"></td>
         </tr>
         <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">������</td>
			 <td id="appl_receiveddate"></td>
			 <td  bgcolor = "#dce0e8">�߸��Ī</td>
			 <td colspan="5" id="appl_Title"></td>
         </tr> 
		    </tbody>	
	</table>
	<p></p>
	<div style="font-weight: bold;padding:8px;">����������������������������������������������������������������[��� ����]</div>
	
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
			 <td  bgcolor = "#dce0e8">�����Ī_�ѱ�</td>
			 <td colspan="12" id="appl_Hangul"></td>
			 <td bgcolor = "#dce0e8">�߸���</td> 
			 <td colspan="5" id="appl_Inventor"></td> 
         </tr>   
        <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">�����Ī_����</td>
			 <td colspan="12" id="appl_English"></td> 
			 <td bgcolor = "#dce0e8">�켱�ǹ�ȣ</td>
			 <td colspan="5" id=appl_priority></td> 
        </tr>
        <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">�����ȣ</td>
			 <td id="applNumber"></td> 
			 <td bgcolor = "#dce0e8">������ȣ</td>
			 <td id="pubNumber"></td> 
			 <td bgcolor = "#dce0e8">��Ϲ�ȣ</td>
             <td colspan="8" id="issueNumber"></td> 
             <td bgcolor = "#dce0e8">�ֿ켱��</td>   
             <td colspan="5" id="priorityDate"></td> 
         </tr> 
        <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">�����</td>
			 <td id="applDate"></td> 
			 <td bgcolor = "#dce0e8">������</td>
			 <td id="pubDate"></td> 
			 <td bgcolor = "#dce0e8">�����</td>
			 <td  colspan="8" id="issueDate"></td> 
             <td bgcolor = "#dce0e8">�������ȣ</td>   
             <td colspan="5" id="motherApplNumber"></td> 
         </tr>
         <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">����û����ȣ</td>
			 <td id="judgeCallNumber"></td> 
			 <td bgcolor = "#dce0e8">���ǽ�û��ȣ</td>
			 <td id="objectionCallNumber"></td> 
			 <td bgcolor = "#dce0e8">�������</td>
			 <td bgcolor = "#dce0e8">����</td>
			 <td id="indepClaim"></td>
			 <td bgcolor = "#dce0e8">����</td>
			 <td id="depClaim"></td>
			 <td bgcolor = "#dce0e8">����</td>
			 <td id="specPlainCount"></td>
			 <td bgcolor = "#dce0e8">�����</td>
			 <td id="drawingCount"></td>
             <td bgcolor = "#dce0e8">�������</td>   
             <td colspan="5" id="motherApplDate"></td> 
         </tr>					
         <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">����û����</td>
			 <td id="judgeCallDate"></td>
			 <td bgcolor = "#dce0e8">���ǽ�û��</td>
			 <td id="objectionCallDate"></td> 
			 <td bgcolor = "#dce0e8">��ϻ���</td>
			 <td bgcolor = "#dce0e8">����</td>
			 <td id="indepClaimFinal"></td>
			 <td bgcolor = "#dce0e8">����</td>
			 <td id="depClaimFinal"></td>
			 <td bgcolor = "#dce0e8">����</td>
			 <td id="specPlainCountFinal"></td>
			 <td bgcolor = "#dce0e8">�����</td>
			 <td id="drawingCountFinal"></td>
             <td bgcolor = "#dce0e8">PCT�޸�</td>   
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
	
		<div style="font-weight: bold; padding:8px;">�������������������������������������� ������������ ������������[������ ����]</div>
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
			 <td bgcolor = "#dce0e8">�ɻ�û��������</td>
			 <td id="examinDueDate"></td>
			 <td bgcolor = "#dce0e8">�ؿ����������</td>
			 <td id="overseaApplDueDate"></td>
			 <td bgcolor = "#dce0e8">PCT���Ը�����</td>
			 <td id="pctCountryStageDueDate"></td>
             <td bgcolor = "#dce0e8">�켱����������</td>   
             <td id="priorityDocsDueDate"></td>
         </tr> 
        <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">�ɻ�û����</td>
			 <td id="examCallDate"></td>
			 <td bgcolor = "#dce0e8">�ؿ����������</td>
			 <td id="OverseaApplSubmitDate"></td>
			 <td bgcolor = "#dce0e8">PCT����������</td>
			 <td id="pctCountryStageSubmitDate"></td>
             <td bgcolor = "#dce0e8">�켱������������</td> 
             <td id="priorityDocsSubmitDate"></td>  
         </tr> 
         <tr bgcolor = "#ffffff">  		
			 <td bgcolor = "#dce0e8">���ӱⰣ������</td>
			 <td id="expireDate"></td>
			 <td bgcolor = "#dce0e8">��Ÿ������ 1</td>
			 <td></td>
			 <td bgcolor = "#dce0e8">��Ÿ������ 2</td>
			 <td></td>
             <td bgcolor = "#dce0e8">��Ÿ������ 3</td>
             <td></td>
         </tr> 
		    </tbody>
	</table>
	<p></p>
	<div style="font-weight: bold; padding:8px;">���������������������������������������� ��������������  ��������[÷�� ����]
		<span style="color:#666662; padding:8px;">�� <span id="datalen"></span>��</span>
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
		       		<th height=30 align = "center" scope="col" bgcolor="#dce0e8">��</th>
		            <th align = "center" scope="col" bgcolor="#dce0e8">�������̸� (÷�� ���ϸ� Ŭ�� �� �ٿ�ε�)</th>
		            <th align = "center" scope="col" bgcolor="#dce0e8">�뷮</th>
		            <th align = "center" scope="col" bgcolor="#dce0e8">��������</th>
		        </tr>
		    </thead>	 
		    <tbody id="file_info">    
		    </tbody>
        </table>  
        <p>
        ��
        <p>
       	��
	</div>
</body>
</html>