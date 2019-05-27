<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%> --%>
<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<head>
<meta charset="EUC-KR">
<title>단일 관련사건</title>
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
	hr.toctoc {
	border-top: 1px dotted #8c8b8b;}
		body{
	padding:20px 20px;
	}
	</style>
</head>
<body>
<button type=button onClick="history.back()" class= "btn btn-outline-secondary" style="width:115px; font-size:16px; font-family:'Nanum Barun Gothic'; position:absolute;top:20px;left:65px">뒤로 가기</button>	
<hr width="100%" size="9" style="position:absolute;top:60px;left:50px"> 
<div style="position:absolute;top:30px;left:175px">
<span style="font-size:0.9em;">　 · </span><span style="font-size:0.9em;" id="applicant_name"></span><span style="font-size:0.9em;"> (${code_water})</span>
</div>
<hr width="100%" size="9" style="position:absolute;top:60px;left:50px"> 
<p>
<script>
	$(function (){
		
		var basic=[[], []];
		var family=[[], []];
		
		$.ajax({
			type:'GET',
			async:false,
			url:'/getApplRelatedInfo?input_water='+"<c:out value="${Clientnum}"/>",
			success:function(data){
				if(data.length ==0){
					alert("조회할 데이터가 없습니다.");
					return;
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
						 //this가 null일 때 unique에 넣어준다
  						 if(data[i].thisApplSerialNumber == null){
							 unique.push(data[i].applSerialNumber);
							 flag=1;
							 continue;
						 }
						 if(data[i].thisApplSerialNumber == data[j].applSerialNumber){
							 //누군가의 자식
							 flag=1;
						 }
					 }
					 
					 //if 최상위부모라면 tmparr에 thisappl,appl 순서대로 넣음
					 if(flag==0){
 
						 /* all_first[cnt]=data[i].thisApplSerialNumber; */
						 tmparr[0]=data[i].thisApplSerialNumber;
						 tmparr[1]=data[i].applSerialNumber; 
						 
						 basic[cnt]=tmparr;
						 tmparr=[]; //비움
						 cnt++;
					 }					 
			 	} //for문 END 
				 
		 		 //그이후의 자식들 push
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

   				 //최상위노드가 같다면 묶어준다
  				 for(var i=0;i<basic.length;i++){
					 for(var j=0;j<basic.length;j++){
						 if(i==j) continue;
						 else{
							 if(basic[i][0] == basic[j][0]){
								 basic[j].shift();//맨앞 지우고
								 for(var k=0;k<basic[j].length;k++){
								 	basic[i].push(basic[j][k]);//앞의 배열에 넣음
								 }
								 basic[j]=[];//비어진 기존의 배열은 empty표
							 }
						 }
					 }
				} 

				
				var cnt=0;
				 
 				//자식이 같으면 합치는 알고리즘(아직 중복체크x)
  				cnt=0;
				var flag=0;
				//////////1
       			for(var i=0;i<basic.length;i++){
    					for(var j=0;j<basic[i].length;j++){
    						///////////2
    						for(var x=0;x<basic.length;x++){
    							if(i==x) continue;
    							
    							flag = basic[x].indexOf(basic[i][j]);
    							//동일한게 있으면
    							if(flag != -1){
	    								basic[i] = basic[i].concat(basic[x]);
	    								basic[x]=[];
	    								break;
    							}
    						}
   						}
       			}

 				//basic을 중복제거해서 마지막으로 넣어준다				
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
  				
 				//마지막에 this가 NULL인 애들 모아서 넣어준다
 				var len = basic.length;
	 		 	if(unique.length!=0){
	 				basic[len]=[unique[0]];				
					for(var i=1;i<unique.length;i++){
						basic[len][i]=[unique[i]];//앞의 배열에 넣음
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
/*   	 		 	 
 				 for(var i=0;i<basic.length;i++){
					 $("#basic_"+i).html(basic[i]);
				 }
				 alert(family.length); */
  				
			},
			
			error:function(){
				alert("Ajax error");
			}
		})//End Ajax 

		var flag=0;
  		for(var i=0;i<basic.length;i++){
 			for(var j=0;j<basic[i].length;j++){
 				if(basic[i][j]=="<c:out value="${Applnum}"/>"){
 					var single_tmp = basic[i].slice();
 					flag=1;
 					break;
 				}
 			}
 			if(flag==1){
 				break;
 			}
  		}
  		/* alert(single_tmp); */

		//////////////////////////////////////////
		var view_country= [];
		var view_family='';
		var bground_line= '';
	
		var applicant_name="";
		var str_final="";
		var str_line="";
		
 		var tbl_info = document.getElementById("tbl_body");
		var line_info = document.getElementById("line_line");
		var cnt=0;

		var oldstring="";
		var oldstring_2="";
		var primary_line=0;
		//////////////////////////////////////////

  			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				type:'POST',
				async: false,
				url:'/getApplRelatedSubInfo?bbang='+single_tmp,
				success:function(data){
						
						var diff=new Array(100).fill('');
						var maintain=0;
						cnt=0;
       					for(var j=0;j<data.length;j++){
        					
       						if(data[j].applicant!=null){
       							applicant_name=data[j].applicant;
       						}
    
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
       					
 		 					//국가를 view_country배열에 넣어줌 
	 			 			if(j==0){
	 			 				view_country[0]=[data[0].countryCode];
 	 						}
	 						else{
	 							var flag=0;
		 						for(k=0;k<j;k++){
		 							if(data[j].countryCode!=data[k].countryCode){
		 								flag++;
		 							}
		 						}
		 						
		 						if(flag==j){//앞부분에 중복된게 없으니 새로 넣어준다
		 							cnt++;
		 							view_country[cnt]=[data[j].countryCode];}
	 						}

       					} //for문종료						
 					 		 
 					 	var previous_line=0;
 					 	var nankai=0;
 					 	var large_line = Math.max.apply(null,diff)+10;
 					 	
 					 	for(var k=0;k<cnt+1;k++){
 					 		
 					 		nankai=1;
 					 		for(var j=0;j<data.length;j++){
 					 		 if(view_country[k]==data[j].countryCode){
	  					 		if(nankai>1){
	  					 			previous_line = 115 + previous_line;
	  					 			nankai++;
 					 			}
	  					 		else{bground_line+="<span class='badge badge-secondary' style='width:40px; position:absolute; top:"+eval(115*nankai+previous_line)+"px; left:50px;'>"+view_country[k]+"</span>"        
 					 				+"<hr class='toctoc' style='width:"+eval(160+large_line*20)+"px; position:absolute; top:"+eval(115*nankai+previous_line-7)+"px; left:90px;'>";
 					 				previous_line = 115*nankai + previous_line;
 					 				nankai++;
	  					 			}
 					 			}
 					 		}
 					 	}//국가 for문 종료
 					 	
  					 	var previous_line=0;
  					 	var nankai=0;
  					 	var is_firstone=1;
  					 	
 					 	for(var k=0;k<cnt+1;k++){
 					 		
 					 		nankai=1;
 					 		for(var j=0;j<data.length;j++){
				 		 	 	 if(view_country[k]==data[j].countryCode){ 
				 		 	 		 if(data[j].applDate==null){
				 		 	 			data[j].applDate='미출원';
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
						 				 view_family+=
						 				  		"<div onclick=location.href='${pageContext.request.contextPath}/detail_list/"+data[j].clientSecurityCode+"/"+data[j].applSerialNumber+"'; onmouseover=this.style.backgroundColor='#d1d1d1'; onmouseout=this.style.backgroundColor=''; class='card border-dark mb-3' style='cursor:pointer; width: 700px; height:73px; position:absolute; top:"+eval(115+previous_line-5)+"px; left:"+eval(130+diff[j]*18)+"px;'>"
													+"<div class='card-header'>"+"<span style='color:#999999'>출원일:&nbsp;</span>"+data[j].applDate+"&nbsp;&nbsp;|&nbsp;<span style='color:#999999'>출원번호:&nbsp;</span>"+data[j].applNumber+"&nbsp;&nbsp;|&nbsp;<span style='color:#999999'>BLT관리번호:&nbsp;</span>"+data[j].overseaNumber;
						 				if(data[j].eventNumberOfClient!=null){
											view_family+="<span>&nbsp;&nbsp;|&nbsp;<span style='color:#999999'>자사관리번호:&nbsp;</span>"+data[j].eventNumberOfClient+"</span></div>";
										}		
										else{
											view_family+="</div>";
										}
										view_family+="<div class='card-body'>"
												  	+"<span class='card-title'><span style='color:#999999'>명칭: </span>"+data[j].applTitleHangul+"</span>"											
												+"</div>"
										 	+"</div>";

										 	previous_line = 115 + previous_line;
										 	nankai++;
										 	is_firstone=0;
				 		 	 		 }
				 		 	 		 else{
					 					view_family+=
				 				  		"<div onclick=location.href='${pageContext.request.contextPath}/detail_list/"+data[j].clientSecurityCode+"/"+data[j].applSerialNumber+"'; onmouseover=this.style.backgroundColor='#d1d1d1'; onmouseout=this.style.backgroundColor=''; class='card border-secondary mb-3' style='cursor:pointer; width: 700px; height:73px; position:absolute; top:"+eval(115+previous_line-5)+"px; left:"+eval(130+diff[j]*18)+"px;'>"
				 				  			+"<div class='card-header'>"+"<span style='color:#999999'>출원일:&nbsp;</span>"+data[j].applDate+"&nbsp;&nbsp;|&nbsp;<span style='color:#999999'>출원번호:&nbsp;</span>"+data[j].applNumber+"&nbsp;&nbsp;|&nbsp;<span style='color:#999999'>BLT관리번호:&nbsp;</span>"+data[j].overseaNumber;
					 					if(data[j].eventNumberOfClient!=null){
											view_family+="<span>&nbsp;&nbsp;|&nbsp;<span style='color:#999999'>자사관리번호:&nbsp;</span>"+data[j].eventNumberOfClient+"</span></div>";
										}		
										else{
											view_family+="</div>";
										}
										view_family+="<div class='card-body'>"
												  	+"<span class='card-title'><span style='color:#999999'>명칭: </span>"+data[j].applTitleHangul+"</span>"											
												+"</div>"
										 	+"</div>";
										 	
								 	previous_line = 115 + previous_line;
								 	nankai++;
									}
				 				}
 					 		}
 					 	}//국가 for문 종료

  						str_final+=view_family;
  						str_line+=bground_line;						
						},
						error:function(){
						}
 					});//End Ajax

 					tbl_info.innerHTML=str_final;
 					line_info.innerHTML=str_line;
 					
					document.getElementById('applicant_name').innerHTML = applicant_name;
  		
	});
	
</script>
<div class="container"> 
		 <div id="line_line"></div>
		 <div id="tbl_body"></div>
</div>

</body>
</html>