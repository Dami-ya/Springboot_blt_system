<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<title>����������</title>
	
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<!-- <script src="https://cdn.jsdelivr.net/clipboard.js/1.5.3/clipboard.min.js"></script> -->
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel='stylesheet' href='//cdn.jsdelivr.net/font-kopub/1.0/kopubdotum.css'>
	<!-- �켱 css���� ���� ���ϰ� ���� �ѹ��� ���� -->
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
				  }; //clickedRowIndex: Ŭ���� Row�� ��ġ�� Ȯ��;
			  var oCell = oRow.insertCell();
			
			  //���Ե� Form Tag
			  //ù �߰�
			  if(cnt==0){
				  var frmTag = "<span style='float:left'>����</span><input type=text onkeydown='chkEnter()' placeholder='�����ڵ带 �Է����ּ���.' style='width:65%; float:left' class='form-control' name='addText'>";
				  frmTag +="<span style='float:left'>��";
				  frmTag += "</span>";
				  frmTag += "<input type=button value='����' class= 'btn btn-default' onClick='removeRow()' style='width:15%;float:left'>";
				  oCell.innerHTML = frmTag;
			  }
			  
			  if(cnt==1){
				  var frmTag = "<span style='float:left'>����</span><input type=text onkeydown='chkEnter()' placeholder='�����ڵ带 �Է����ּ���.' style='width:65%; float:left' class='form-control' name='addText'>";
				  frmTag +="<span style='float:left'>��";
				  frmTag += "</span>";
				  frmTag += "<input type=button value='����' class= 'btn btn-default' onClick='removeRow()' style='width:15%;float:left'>";
				  oCell.innerHTML = frmTag;
			  }
			  
			  if(cnt==2){
				  var frmTag = "<span style='float:left'>����</span><input type=text onkeydown='chkEnter()' placeholder='�����ڵ带 �Է����ּ���.' style='width:65%; float:left' class='form-control' name='addText'>";
				  frmTag +="<span style='float:left'>��";
				  frmTag += "</span>";
				  frmTag += "<input type=button value='����' class= 'btn btn-default' onClick='removeRow()' style='width:15%;float:left'>";
				  oCell.innerHTML = frmTag; 
			  }
			  
			  if(cnt==3){
				  var frmTag = "<span style='float:left'>����</span><input type=text onkeydown='chkEnter()' placeholder='�����ڵ带 �Է����ּ���.' style='width:65%; float:left' class='form-control' name='addText'>";
				  frmTag +="<span style='float:left'>��";
				  frmTag += "</span>";
				  frmTag += "<input type=button value='����' class= 'btn btn-default' onClick='removeRow()' style='width:15%;float:left'>";
				  oCell.innerHTML = frmTag; 
			  }
			  cnt++;
			}
		
		//Row ����
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
					  text:'BLTƯ������繫�ҷκ��� ��������� �޴�\n'+'���̸��� �ּҸ� �Է����ֽñ� �ٶ��ϴ�.',
					  content: "input",
					  buttons:["���","Ȯ��"],
					  closeModal: false,
					})
   				.then(function(name){
				  if (!name) throw null;
				  ////////////name�� ������??/////////////
						  
				  var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				  if(regExp.test(name)==false) {
					  swal("\n","�ùٸ� ������ �̸��� �ּҸ� �Է��� �ּ���.", "warning");
					  swal.stopLoading();
					  swal.close();
				  }
				  //�ٸ� ������ ���� �ּ�
				  else{
					
					 $.ajax({
							type:'GET',
							url:'/getApplEmailInfo?water_email='+name,
							async:false,
							success:function(data){
							
							//��ϵ��� ���� ����
							if(data.length==0){
								swal("�ش� �����ּҸ� ã�� �� �����ϴ�.","\n�����Է��� ���� �ּ�: "+name+"\n\n���������ٸ� ���� �ּҸ� �Է��Ͻðų�,\n��feedback@blt.kr�� �������ֽñ� �ٶ��ϴ�.", "error"); 
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
								//���⼭ �ߺ��˻��ؼ� ������ return�ع����ߵ�
								var time_test_flag=0;
								
								 	$.ajax({
										type:'GET',
										url:'/getApplTimeTestInfo?now_email='+name,
										async:false,
										success:function(data){

											if(data.length!=0){//�����ʹ� ����
												var timote = data[0].requestTime.split('-');
												
												//�������� ���
												if(timote[0]==currentDate.getFullYear()&&timote[1]==currentDate.getMonth()&&timote[2]==currentDate.getDate()){
													var minute_diff= eval(eval((currentDate.getHours()-timote[3])*60)+eval(currentDate.getMinutes()-timote[4]));
													/* alert(minute_diff+"������"); */
													if(minute_diff<30) time_test_flag=1;//����
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
								////���� alert////		
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
										
								 var test_hangul="�ȳ��ϼ���. BLTƯ������繫�� �Դϴ�.<BR>��û�Ͻ� �����ڵ� ������ �Ʒ��� �����ϴ�.<BR><p><BR>";
								 
										for(var i=0; i<cnt; i++) {
											test_hangul+="����: "+arr[i]+"<BR>"+
														"�����̸���:"+name+"<BR>"+
														"�����ڵ�: <b>"+arr_2[i]+"</b><BR>"+
														"�ٷΰ���: "+"https://mylist.blt.kr/list/"+arr_2[i]+"<BR><p><BR>";
										}
										
								 test_hangul += "BLT����� ��ȸ������ (https://mylist.blt.kr) �� �����ϼż�,<BR> ��� �����ڵ带 �Է��Ͻø� �����ȸ�� �����մϴ�."+
													   "<BR><p>�����ڵ带 ��û�� ���� �����ø� ��� feedback@blt.kr �� ���� �ֽñ� �ٶ��ϴ�. ";
										
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
										text:name+'��\n �����ڵ带 �����Ͽ����ϴ�.',
										icon:"success",
									  })
 								swal.stopLoading();
							    swal.close();
			 					
								setTimeout(function()
			 						{window.location.reload();},2000);
						}
						
						//�ð� �ȶո�
						else{
							swal("\n","���� �����ּҷ� 30�� �̳��� �������� �� �����ϴ�.", "error"); 
						}
						 
							}
							
							},
								
							error:function(){
								alert("ajax���ľߴ�");
							}
							
						})//End Ajax 					
				  }
				   
				}) 
		}
		
	    function textCopy() {
	        var dom = document.getElementById('app');
	        var temp = document.createElement('input');
	        temp.classList.add('on'); // �Ⱥ��̵��� ó��
	 
	        // ������ ���
	        var target = document.getElementById('copytext');
	        temp.value = target.value // ����� �ؽ�Ʈ�� temp�� �����
	 
	        dom.appendChild(temp); // ����
	        temp.select(); // ����
	        document.execCommand('copy'); // ����
	    }
	    
</script> 
<hr size="10" style="border:white">
<div class="container"> 
	<hr width=650px size="10">
	<input type="image" src="static/images/logo.jpg" style="width: 80px;float:left; position: relative; z-index:1">
	<span style="display:inline-block; padding-left:22px; font-family:'KoPub Dotum'; font-size:39px; font-weight:bold; color:#5b5b5b;  margin-top:8px; vertical-align:middle;">BLT �ڱ��� �˻���ȸ ����</span>
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
					   		<span style="float:left">����</span><input type="text" onkeydown="chkEnter()" style="width:65%; float:left" placeholder="�����ڵ带 �Է����ּ���." class="form-control" name="addText" id="firstkey">
					   		<span style="float:left">��</span>��
					    	<button id="btnSend" type="button" class= "btn btn-primary" style="width:15%; float:left">��ȸ</button>
					    </div>
					 </td>
				 </tr>
		    </table>
		    <BR>
			 <span style="float:left">����</span><button name="addButton" type=button onClick="insRow()" class= "btn btn-default" style="width:10%; float:left">�߰�</button>	
		</div>
 	</div>
  </div>
</div> 
   	 
<hr width="90%" size="10">
    <div class="container">
      <div class="outer">
              		  <font color=#898a8c>�� ��� ��� Ȯ���� ���� �ȳ������� �����ڵ带 �Է����ּ���. [<span onclick="promalert()" style="color:#3f76e2; text-decoration: underline; cursor:pointer">���� �ּҷ� �����ڵ� Ȯ���ϱ�</span>]<br></font>
              		  <font color=#898a8c>�� �߰� ��ư�� ���� �����ڵ带 �ִ� 5������ �Է��Ͻ� �� �ֽ��ϴ�.<br></font>
              		  <font color=#898a8c>�� �����ڵ带 �Է��Ͻø� ��� ��ȸ, ��� �˻�, ���� ���(�йи�)��ȸ, excel ������ �����մϴ�.<br></font>
              		  <font color=#898a8c>�� excel ������ �Ϻ� ȯ�� �Ͽ��� ���޼����� �߻��� �� ������ ���� �󿡴� ������ �����ϴ�.<br></font>
              		  <font color=#898a8c>�� excel ���Ͽ��� ���޼��� �߻� �� �ٸ� �̸����� �����ϼż� ������ּ���.<br></font>
              		  <font color=#898a8c>�� ���� ���� �Ǵ� ���� �߻� �� <a href="mailto:feedback@blt.kr">feedback@blt.kr</a> �� ���� ��Ź�帮�ڽ��ϴ�.<br></font>
              		  <hr size="10" style="border:white">
           </div>
        </div>
  	

</body>
</html> 