<%@ page import="java.util.Calendar" language="java" contentType="application/vnd.ms-excel; charset=EUC-KR" pageEncoding="UTF-8"%>
<%-- <%@ page import="java.util.Calendar" language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
  	  <%
 	    Calendar today = Calendar.getInstance();		
	    String getNowDatetime = ""+today.get(Calendar.YEAR) +"0"+(today.get(Calendar.MONTH)+1)+today.get(Calendar.DATE);
		String name = (String)request.getAttribute("applicant");
		String excel_file_name = "(BLT) 패밀리사건리스트_"+name+"_사건리스트"+getNowDatetime+".xls";

		response.setHeader("Content-Disposition","attachment;filename="+new String((excel_file_name).getBytes("KSC5601"),"8859_1"));
		response.setHeader("Content-Description", "JSP Generated Data"); 
	  %> 
<!-- 	  <script>
		$.ajax({
			type:'GET',
			async: false,
			url:'/savecustomerstime/clear_glo_var?test=excel',
			success:function(data){					
			},
			error:function(){
			}
		});//End Ajax	
	  </script> -->
	  
	<table border=1>
					     <colgroup>
					     	<col width="15%"/>
					        <col width="10%"/>
					        <col width="20%"/>
					        <col width="15%"/>
					        <col width="20%"/>
					        <col width="20%"/>
					        <col width="15%"/>
					        <col width="10%"/>
					        <col width="10%"/>
					        <col width="10%"/>
					        <col width="10%"/>
					        <col width="10%"/>
					        <col width="10%"/>
					        <col width="10%"/>
					        <col width="10%"/>
					        <col width="10%"/>
					        <col width="20%"/>
					    </colgroup>
		    <thead>
		        <tr bgcolor = "#e1e6e8">
		        	<th align = "center" scope="col">관련사건 그룹번호</th>
		            <th align = "center" scope="col">사건생성일</th>
		            <th align = "center" scope="col">권리구분</th>
		            <th align = "center" scope="col">국가</th>
		            <th align = "center" scope="col">출원종류</th>
		            <th align = "center" scope="col">출원명</th>
		            <th align = "center" scope="col">발명자</th>
		            <th align = "center" scope="col">고객관리번호</th>
		            <th align = "center" scope="col">BLT관리번호</th>
		            <th align = "center" scope="col">현재진행단계</th>
		            <th align = "center" scope="col">출원번호</th>
		            <th align = "center" scope="col">출원일</th>
		            <th align = "center" scope="col">등록번호</th>
		            <th align = "center" scope="col">등록일</th>
		            <th align = "center" scope="col">기초출원번호</th>
		            <th align = "center" scope="col">기초출원일</th>
		            <th align = "center" scope="col">출원인</th>
		        </tr>
		    </thead>		    
		    <tbody>  
				<c:set var="count" value="0" />
		    	<c:forEach items="${list}" var="listnow" begin="0" end="${all_cnt}" varStatus="loop">
		    	<tr>

		    	<c:choose>
		    		<%-- <c:when test="${listnow.overseaNumber == null}"> --%>
		    		<c:when test="${list[loop.index-1].overseaNumber == null}">
		    			<c:set var="count" value="${count + 1}" />
		    			<td align = "center">${count}</td>
		    		</c:when>
		    		
		    		<c:when test="${list[loop.index].overseaNumber == null}">
		    			<td align = "center"> </td>
		    		</c:when>	
		    		  
		    		<c:otherwise>
		    			<td align = "center"> - </td>
		    		</c:otherwise>		    		
		    	</c:choose>
		    	
		    		<td align = "center"><c:out value="${listnow.receivedDate}"/></td>
		    		<td align = "center"><c:out value="${listnow.code2}"/></td>
		    		<td align = "center"><c:out value="${listnow.countryCode}"/></td>
		    		<td align = "center"><c:out value="${listnow.code1}"/></td>
		    		
		    		<td align = "center"><c:out value="${listnow.applTitleHangul}"/></td>
		    		<td align = "center"><c:out value="${listnow.inventor}"/></td>
		    		<td align = "center"><c:out value="${listnow.eventNumberOfClient}"/></td>
		    		<td align = "center"><c:out value="${listnow.overseaNumber}"/></td>
		    		
		    	<c:choose>
		    		<c:when test="${listnow.overseaNumber == null}">
		    			<td align = "center"></td>
		    		</c:when>
		    		<c:otherwise>
		    			<td align = "center"><c:out value="${listnow.phase1}"/> - <c:out value="${listnow.phase2}"/> - <c:out value="${listnow.phaseMemo}"/></td>
		    		</c:otherwise>		    		
		    	</c:choose>
		    		
		    		<td align = "center"><c:out value="${listnow.applNumber}"/></td>
		    		<td align = "center"><c:out value="${listnow.applDate}"/></td>
		    		
		    		<td align = "center"><c:out value="${listnow.issueNumber}"/></td>
		    		<td align = "center"><c:out value="${listnow.issueDate}"/></td>
		    		<td align = "center"><c:out value="${listnow.motherApplNumber}"/></td>
		    		<td align = "center"><c:out value="${listnow.motherApplDate}"/></td>
		    		<td align = "center"><c:out value="${listnow.applicant}"/></td>
	
		    	</tr>		    	    		
		   		</c:forEach>
		    </tbody>
	</table>
	</body>
</html>