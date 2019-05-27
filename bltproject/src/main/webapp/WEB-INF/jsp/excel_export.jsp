<%@ page import="java.util.Calendar" language="java" contentType="application/vnd.ms-excel; charset=EUC-KR" pageEncoding="UTF-8"%>
<%-- <%@ page import="java.util.Calendar" language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>  --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

	<head>
	<meta http-equiv="Content-type" content="application/vns.ms-excel;charset=EUC-KR">
	<title>Insert title here</title>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>
	<body>
  	  <%
 	    Calendar today = Calendar.getInstance();		
	    String getNowDatetime = ""+today.get(Calendar.YEAR) +"0"+(today.get(Calendar.MONTH)+1)+today.get(Calendar.DATE);
		String name = (String)request.getAttribute("applicant");
		String excel_file_name = "[BLT]_"+name+"_사건목록_"+getNowDatetime+".xls";

		response.setHeader("Content-Disposition","attachment;filename="+new String((excel_file_name).getBytes("KSC5601"),"8859_1"));
		response.setHeader("Content-Description", "JSP Generated Data"); 
	  %> 
	  

	<table border=1>
					     <colgroup>
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
		    	<c:forEach items="${list}" var="list">
		    	<tr>
		    		<td align = "center"><c:out value="${list.receivedDate}"/></td>
		    		<td align = "center"><c:out value="${list.code2}"/></td>
		    		<td align = "center"><c:out value="${list.countryCode}"/></td>
		    		<td align = "center"><c:out value="${list.code1}"/></td>
		    		
		    		<td align = "center"><c:out value="${list.applTitleHangul}"/></td>
		    		<td align = "center"><c:out value="${list.inventor}"/></td>
		    		<td align = "center"><c:out value="${list.eventNumberOfClient}"/></td>
		    		<td align = "center"><c:out value="${list.overseaNumber}"/></td>
		    		<td align = "center"><c:out value="${list.phase1}"/> - <c:out value="${list.phase2}"/> - <c:out value="${list.phaseMemo}"/></td>
		    		
		    		<td align = "center"><c:out value="${list.applNumber}"/></td>
		    		<td align = "center"><c:out value="${list.applDate}"/></td>
		    		
		    		<td align = "center"><c:out value="${list.issueNumber}"/></td>
		    		<td align = "center"><c:out value="${list.issueDate}"/></td>
		    		<td align = "center"><c:out value="${list.motherApplNumber}"/></td>
		    		<td align = "center"><c:out value="${list.motherApplDate}"/></td>
		    		<td align = "center"><c:out value="${list.applicant}"/></td>
	
		    	</tr>		    	    		
		   		</c:forEach>
		    </tbody>
	</table>
	</body>
</html>