<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
<head>
<meta charset="EUC-KR">
<title>��ü ���û��</title> 
	<style>
	@import url(//cdn.jsdelivr.net/font-nanum/1.0/nanumbarungothic/nanumbarungothic.css);
	table, body, div, p, span {font-family:'Nanum Barun Gothic';}
	
	.card-header{
		font-size:12px;
		padding:8px;
		font-weight: 1000; }
	.card-body{
		font-size:13px;
		padding:8px; }
	.table{
		border-right:none;
		border-left:none;
		border-top:none;
		border-bottom:none;}
	hr.toctoc {
		border-top: 1px dotted #8c8b8b;}
	hr.jjinjjin_0{
		border-top: 1px solid #8c8b8b;
		width:27px;
		height : 3px; 
		}
	hr.jjinjjin{
		border-top: 1px solid #8c8b8b;
		height : 3px; 
		}
	body{
		padding:20px 20px;
		}
	.vertical-divider {
		width: 1px;
		height: 90%;
		margin: 5% 0 5% 0;
		background: @divider;
		}	
		
	</style>
	
</head>
<body>
<button type=button onClick="history.back()" class= "btn btn-outline-secondary" style="width:115px; position:absolute;top:20px;left:65px">�ڷ� ����</button>	
<div style="position:absolute;top:30px;left:175px">
<span style="font-size:0.9em;">�� �� </span><span style="font-size:0.9em;" id="applicant_name"></span><span style="font-size:0.9em;"> (${code_water})</span>
</div>
<input type="button" id="ToExcel" value="��ü ���û�� ������ �����ϱ�" class= "btn btn-success" style="width:250px;position:absolute;top:20px;left:900px">
<hr width="100%" size="9" style="position:absolute;top:60px;left:50px"> 
<p>
		 <div id="line_line"></div>
		 <div id="tbl_body"></div>
		 <div id="line_line_2"></div>

<script>

var family=[[], []];
var applicant_name="";
var all_cnt=0;
var move=0;

$(function (){
	var basic=[[], []];
	
	$.ajax({
		type:'GET',
		async:false,
		url:'/getApplRelatedInfo?input_water='+"<c:out value="${water}"/>",
		success:function(data){
			if(data.length ==0){
				swal("��ȸ�� �����Ͱ� �����ϴ�.");
				setTimeout(function()
					{history.back();},1000);
			}
			 
			var all_first=[];
			var unique=[];
			var cnt=0;
		    var tmparr=[];
		    
				var str="";		  	 
			  	 
			for(var i=0;i<data.length;i++){
				
				 var flag=0; 
				 for(var j=0;j<data.length;j++){
					 if(flag==1){
						 continue;
					 }
					 //this�� null�� �� unique�� �־��ش�
						 if(data[i].thisApplSerialNumber == null){
						 unique.push(data[i].applSerialNumber);
						 flag=1;
						 continue;
					 }
					 if(data[i].thisApplSerialNumber == data[j].applSerialNumber){
						 //�������� �ڽ�
						 flag=1;
					 }
				 }
				 
				 //if �ֻ����θ��� tmparr�� thisappl,appl ������� ����
				 if(flag==0){

					 /* all_first[cnt]=data[i].thisApplSerialNumber; */
					 tmparr[0]=data[i].thisApplSerialNumber;
					 tmparr[1]=data[i].applSerialNumber; 
					 
					 basic[cnt]=tmparr;
					 tmparr=[]; //���
					 cnt++;
				 }					 
		 	} //for�� END 
			 
	 		 //�������� �ڽĵ� push
				 for(var i=0;i<basic.length;i++){
			 var tail=1;
			 var flag=0;
				 for(var j=0;j<data.length;j++){	 
 					 /* if(basic[i][tail] == null){
						 break;
					 }  */
					 if(basic[i][tail] == data[j].thisApplSerialNumber){
						 basic[i].push(data[j].applSerialNumber);
					 }
				 } 	
			 }

				 //�ֻ�����尡 ���ٸ� �����ش�
			 for(var i=0;i<basic.length;i++){
				 for(var j=0;j<basic.length;j++){
					 if(i==j) continue;
					 else{
						 if(basic[i][0] == basic[j][0]){
							 basic[j].shift();//�Ǿ� �����
							 for(var k=0;k<basic[j].length;k++){
							 	basic[i].push(basic[j][k]);//���� �迭�� ����
							 }
							 basic[j]=[];//����� ������ �迭�� emptyǥ
						 }
					 }
				 }
			} 

			
			var cnt=0;
			 var sum_basic=[[], []];
			 
				//�ڽ��� ������ ��ġ�� �˰���(���� �ߺ�üũx)
				cnt=0;
			var flag=0;
			//////////1
   			for(var i=0;i<basic.length;i++){
					for(var j=0;j<basic[i].length;j++){
						///////////2
						for(var x=0;x<basic.length;x++){
							if(i==x) continue;
							
							flag = basic[x].indexOf(basic[i][j]);
							//�����Ѱ� ������
							if(flag != -1){
    								basic[i] = basic[i].concat(basic[x]);
    								basic[x]=[];
    								break;
							}
						}
						}
   			}

				//basic�� �ߺ������ؼ� ���������� �־��ش�				
				for(var i=0;i<basic.length;i++){
					for(var j=0;j<basic[i].length;j++){
						for(var k=0;k<basic[i].length;k++){
							if(j==k) continue;
							
							if(basic[i][j]==basic[i][k]){
								basic[i].splice(k,1);
							}
						}
					}
				}
				
				//�������� this�� NULL�� �ֵ� ��Ƽ� �־��ش�
				var len = basic.length;
 		 	if(unique.length!=0){
 				basic[len]=[unique[0]];				
				for(var i=1;i<unique.length;i++){
					basic[len][i]=[unique[i]];//���� �迭�� ����
				}
			} 
 		 	
		 	cnt=0;
 		 	for(var i=0;i<basic.length;i++){		 		
		 		 		 if(basic[i].length>2)
		 		 		 {
		 		 			family[cnt]=[basic[i][0]];
		 		 			 for(var j=1;j<basic[i].length;j++){			 		 			 
			 		 			 family[cnt][j]=[basic[i][j]];
		 		 			 }
		 		 			 cnt++;
		 		 		 }
	 		 	}

		},
		
		error:function(){
			alert("Ajax error");
		}
	})//End Ajax 
		
		//�̰� ������ �����ϱ�
		var view_country= new Array(100).fill('');
		var view_family= new Array(100).fill('');
		var bground_line= new Array(100).fill('');
	
		var str_final="";
		var str_line="";
		
		var tbl_info = document.getElementById("tbl_body");
		var line_info = document.getElementById("line_line");
		var cnt=0;

		var oldstring="";
		var oldstring_2="";
		var previous_line=[];
		
 		  for(var i=0;i<family.length;i++){
 				
 			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				type:'POST',
				async: false,
				url:'/getApplRelatedSubInfo?bbang='+family[i],
				success:function(data){
					all_cnt+=data.length;
					cnt=0;
					var diff=new Array(100).fill('');
					var maintain=0;
					
   					for(var j=0;j<data.length;j++){
    					
   						if(data[j].applicant!=null){
   							applicant_name=data[j].applicant;
   						}
   						////////////////
   						if(j==0){
   							diff[j]=0;
   						}
   						else if(data[j].applDate==null && data[j-1].applDate==null){
							diff[j] = maintain;
						}
   						else if(data[j].applDate==null){
							diff[j] = Math.max.apply(null,diff)+3;
							maintain = diff[j];
						}
						else{
			 			 	oldstring = data[0].applDate;
						 	oldstring_2 = data[j].applDate;
			 					 	
	 				  		var diff_month = oldstring_2.substring(5,7) - oldstring.substring(5,7);
			 				  		
		 				  		if(diff_month<0){
		 				  			diff[j] = (oldstring_2.substring(0,4)-oldstring.substring(0,4))*12 - (oldstring.substring(5,7) - oldstring_2.substring(5,7));     
	 				  		}
	 				  		else{
	 				  			diff[j] = (oldstring_2.substring(0,4)-oldstring.substring(0,4))*12 + (oldstring_2.substring(5,7) - oldstring.substring(5,7));
		 				  		}
						} 		
 		 					//������ view_country�迭�� �־��� 
	 			 			if(j==0){
	 			 				view_country[i]=[data[0].countryCode];
 	 						}
	 						else{
	 							var flag=0;
		 						for(k=0;k<j;k++){
		 							if(data[j].countryCode!=data[k].countryCode){
		 								flag++;
		 							}
		 						}
		 						
		 						if(flag==j)//�պκп� �ߺ��Ȱ� ������ ���� �־��ش�
		 							{cnt++;
		 							view_country[i][cnt]=[data[j].countryCode];}
	 						}
			 				
			 				
 					 	} //for������
						
 					 	if(i==0)
					 		previous_line[i]=30;
 					 	else
 					 		previous_line[i]=previous_line[i-1]+120;
 					 	
 					 	var nankai=0;
 					 	var large_line = Math.max.apply(null,diff)+30;
 					 	
 					 	
 					 	//��ȣ ����
 					 	bground_line[i]+="<hr class='jjinjjin_0' style='position:absolute; top:"+eval(previous_line[i]+60)+"px; left:50px;'>"
 					 		+"<span class='badge badge-dark' style='font-size:0.9em; height:21px; width:700px; position:absolute; top:"+eval(previous_line[i]+67)+"px; left:80px;'>&nbsp;"+eval(i+1)+"�� �йи� ��� ("+data[0].applTitleHangul+")</span>"   
 					 		+"<hr class='jjinjjin' style='width:"+eval(large_line*20-532)+"px; position:absolute; top:"+eval(previous_line[i]+60)+"px; left:782px;'>";
 					 	for(var k=0;k<cnt+1;k++){
 					 		
 					 		nankai=1;
 					 		for(var j=0;j<data.length;j++){
 					 		
 					 		 if(view_country[i][k]==data[j].countryCode){
	  					 		if(nankai>1){
	  					 			previous_line[i] = 115 + previous_line[i];
	  					 			nankai++;
 					 			}
	  					 		else{bground_line[i]+="<span class='badge badge-secondary' style='width:40px; position:absolute; top:"+eval(115*nankai+previous_line[i])+"px; left:50px;'>"+view_country[i][k]+"</span>"        
 					 				+"<hr class='toctoc' style='width:"+eval(160+large_line*20)+"px; position:absolute; top:"+eval(115*nankai+previous_line[i]-7)+"px; left:90px;'>";
 					 				previous_line[i] = 115*nankai + previous_line[i];
 					 				nankai++;
	  					 			}
 					 			}
 					 		}
 					 	}//���� for�� ����
 					 	
 					 	if(i==0)
					 		previous_line[i]=30;
 					 	else
 					 		previous_line[i]=previous_line[i-1]+120;
 					 	
  					 	var nankai=0;
  					 	var is_firstone=1;
 					 	for(var k=0;k<cnt+1;k++){
 					 		
 					 		nankai=1;
 					 		for(var j=0;j<data.length;j++){
				 		 	 	 if(view_country[i][k]==data[j].countryCode){ 
				 		 	 		 if(data[j].applDate==null){
				 		 	 			data[j].applDate='�����';
				 		 	 		 }
				 		 	 		 if(data[j].applTitleHangul==null){
				 		 	 			data[j].applTitleHangul='-';
				 		 	 		 }
				 		 	 		 if(data[j].applTitleHangul.length>65){
				 		 	 			data[j].applTitleHangul=data[j].applTitleHangul.slice(0,65)+"..";
				 		 	 		 }
				 		 	 		 if(data[j].applNumber==null){
				 		 	 			data[j].applNumber='-';
				 		 	 		 }
				 		 	 		 if(is_firstone==1){
						 				 view_family[i]+=
						 				  		"<div onclick=location.href='${pageContext.request.contextPath}/detail_list/"+data[j].clientSecurityCode+"/"+data[j].applSerialNumber+"'; onmouseover=this.style.backgroundColor='#e0e0e0'; onmouseout=this.style.backgroundColor=''; class='card border-dark mb-3' style='cursor:pointer; width: 700px; height:73px; position:absolute; top:"+eval(115+previous_line[i]-5)+"px; left:"+eval(130+diff[j]*18)+"px;'>"
						 				  		+"<div class='card-header'>"+"<span style='color:#999999'>�����:&nbsp;</span>"+data[j].applDate+"&nbsp;&nbsp;|&nbsp;<span style='color:#999999'>�����ȣ:&nbsp;</span>"+data[j].applNumber+"&nbsp;&nbsp;|&nbsp;<span style='color:#999999'>BLT������ȣ:&nbsp;</span>"+data[j].overseaNumber;
											if(data[j].eventNumberOfClient!=null){
												view_family[i]+="<span>&nbsp;&nbsp;|&nbsp;<span style='color:#999999'>�ڻ������ȣ:&nbsp;</span>"+data[j].eventNumberOfClient+"</span></div>";
											}
											else{
												view_family[i]+="</div>";
											}
											view_family[i]+="<div class='card-body'>"
													  	+"<span class='card-title'><span style='color:#999999'>��Ī: </span>"+data[j].applTitleHangul+"</span>"											
													+"</div>"
											 	+"</div>";
											 	
										 	previous_line[i] = 115 + previous_line[i];
										 	nankai++;
										 	is_firstone=0;
				 		 	 		 }
				 		 	 		 else{
						 				 view_family[i]+=
					 				  		"<div onclick=location.href='${pageContext.request.contextPath}/detail_list/"+data[j].clientSecurityCode+"/"+data[j].applSerialNumber+"'; onmouseover=this.style.backgroundColor='#e0e0e0'; onmouseout=this.style.backgroundColor=''; class='card border-secondary mb-3' style='cursor:pointer; width: 700px; height:73px; position:absolute; top:"+eval(115+previous_line[i]-5)+"px; left:"+eval(130+diff[j]*18)+"px;'>"
					 				  		+"<div class='card-header'>"+"<span style='color:#999999'>�����:&nbsp;</span>"+data[j].applDate+"&nbsp;&nbsp;|&nbsp;<span style='color:#999999'>�����ȣ:&nbsp;</span>"+data[j].applNumber+"&nbsp;&nbsp;|&nbsp;<span style='color:#999999'>BLT������ȣ:&nbsp;</span>"+data[j].overseaNumber;
											if(data[j].eventNumberOfClient!=null){
												view_family[i]+="<span>&nbsp;&nbsp;|&nbsp;<span style='color:#999999'>�ڻ������ȣ:&nbsp;</span>"+data[j].eventNumberOfClient+"</span></div>";
											}	
											else{
												view_family[i]+="</div>";
											}
											view_family[i]+="<div class='card-body'>"
													  	+"<span class='card-title'><span style='color:#999999'>��Ī: </span>"+data[j].applTitleHangul+"</span>"											
													+"</div>"
											 	+"</div>";
								 	previous_line[i] = 115 + previous_line[i];
								 	nankai++;
				 		 	 		 }
								}
				 			}
 					 	}//���� for�� ����
 					 	
  						str_final+=view_family[i];
  						str_line+=bground_line[i];	
  						move=previous_line[i]+115;
  						
						},
						error:function(){
						}
 					});//End Ajax

 					tbl_info.innerHTML=str_final;
 					line_info.innerHTML=str_line;
 					
					document.getElementById('applicant_name').innerHTML = applicant_name;
  		}//End for�� 

  	});
  		
  $(function (){
	  
		var bground_line_2= new Array(100).fill('');
		
/* 		var tbl_info = document.getElementById("tbl_body");*/
		var line_info_2 = document.getElementById("line_line_2");
		var cnt=0;
		var previous_line_2=[];
		
		var str_line_2="";
	  
		/* selectFinalInfo */
		$.ajax({
			type:'GET',
			async: false,
			url:'/getApplFinalInfo?water='+"<c:out value="${code_water}"/>",
			success:function(data){

				for(var i=0;i<data.length;i++){
					
					if(data[i].applDate==null) data[i].applDate="-";
					if(data[i].applNumber==null) data[i].applNumber="-";
					if(data[i].overseaNumber==null) data[i].overseaNumber="-";
					if(data[i].applTitleHangul==null) data[i].applTitleHangul="-";
					
					if(i==0)
				 		previous_line_2[i]=move;
					else
					 	previous_line_2[i]=previous_line_2[i-1]+150;
					 					 	
					 	//��ȣ ����
					 	bground_line_2[i]+="<hr class='jjinjjin_0' style='position:absolute; top:"+eval(previous_line_2[i]+60)+"px; left:50px;'>"
					 		+"<span class='badge badge-secondary' style='font-size:0.9em; height:21px; width:700px; position:absolute; top:"+eval(previous_line_2[i]+67)+"px; left:80px;'>&nbsp;"+eval(i+1)+"�� ���� ��� ("+data[i].applTitleHangul+")</span>"   
					 		+"<hr class='jjinjjin' style='width:100px; position:absolute; top:"+eval(previous_line_2[i]+60)+"px; left:782px;'>"
					 		+"<span class='badge badge-secondary' style='width:40px; position:absolute; top:"+eval(previous_line_2[i]+120)+"px; left:50px;'>"+data[i].countryCode+"</span>"
					 		+"<hr class='toctoc' style='width:100px; position:absolute; top:"+eval(previous_line_2[i]+113)+"px; left:90px;'>"
							+"<div onclick=location.href='${pageContext.request.contextPath}/detail_list/"+data[i].clientSecurityCode+"/"+data[i].applSerialNumber+"'; onmouseover=this.style.backgroundColor='#e0e0e0'; onmouseout=this.style.backgroundColor=''; class='card border-dark mb-3' style='cursor:pointer; width: 700px; height:73px; position:absolute; top:"+eval(110+previous_line_2[i])+"px; left:130px;'>"
	 				  		+"<div class='card-header'>"+"<span style='color:#999999'>�����:&nbsp;</span>"+data[i].applDate+"&nbsp;&nbsp;|&nbsp;<span style='color:#999999'>�����ȣ:&nbsp;</span>"+data[i].applNumber+"&nbsp;&nbsp;|&nbsp;<span style='color:#999999'>BLT������ȣ:&nbsp;</span>"+data[i].overseaNumber;
						if(data[i].eventNumberOfClient!=null){
							bground_line_2[i]+="<span>&nbsp;&nbsp;|&nbsp;<span style='color:#999999'>�ڻ������ȣ:&nbsp;</span>"+data[i].eventNumberOfClient+"</span></div>";
						}
						else{
							bground_line_2[i]+="</div>";
						}
						bground_line_2[i]+="<div class='card-body'>"
								  	+"<span class='card-title'><span style='color:#999999'>��Ī: </span>"+data[i].applTitleHangul+"</span>"											
										+"</div>"
						 	+"</div>";
						 	
				str_line_2+=bground_line_2[i];

				}
				line_info_2.innerHTML=str_line_2;
				
			},
			error:function(){
			}
		});//End Ajax
  });
  
  $( function (){
  			 $('#ToExcel').click(function(){
  				//////////////������ �����ϴ� excel������///////////////
	  				$.ajax({
							type:'GET',
							url:'/clear_glo_var?test=123',
							success:function(data){					
							},
							error:function(){
							}
						});//End Clear Ajax	 	

  				for(var i=0;i<family.length;i++){
  			 			
  			 			jQuery.ajaxSettings.traditional = true;
  						$.ajax({
  							type:'POST',
  							async: false,
  							url:'/getApplRelatedSubInfo?bbang='+family[i],
  							success:function(data){					
  							},
  							error:function(){
  							}
  						});//End Ajax	
  						
  				}
  				
/* 					$.ajax({
							type:'POST',
							async: false,
							url:'/getApplFinalInfo?water='+"<c:out value="${code_water}"/>",
							success:function(data){					
							},
							error:function(){
							}
						});//End Ajax	 */
						
  				location.href="${pageContext.request.contextPath}/relation_excel_export/"+family.length+"/"+all_cnt+"/"+applicant_name;
  			})
  });

	
</script>

</body>
</html>