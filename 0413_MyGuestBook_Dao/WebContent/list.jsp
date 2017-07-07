<%@page import="com.hb.mybatis.DAO"%>
<%@page import="com.hb.mybatis.VO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.hb.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 명 록</title>
<style type="text/css">
	a { text-decoration: none;}
	table{width: 500px; border-collapse:collapse; }
	table,th,td{border: 1px solid black;}
</style>
</head>
<body>
    <% List<VO> list = DAO.getList(); %>
	<div align="center">
		<h2>방명록</h2>
		<hr />
		<p>[<a href="write.jsp"> 방명록쓰기 </a>]</p>
		<table>
			<thead>
				<tr bgcolor="#99ccff">
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody align="center">
			  <%if(list.size()>0){
				for(VO k : list){%>
			  	  	<tr>
			  	  		<td><%=k.getIdx() %> </td>
			  	  		<td><%=k.getName() %> </td>
			  	  		<td><a href="onelist.jsp?idx=<%=k.getIdx()%>"><%=k.getSubject() %></a></td>
			  	  		<td><%=k.getRegdate().substring(0,10) %> </td>
			  	  	</tr>
			  	 <%}%> 	
			  <%}else{%>
			  <tr>
			  	<td colspan="4"><h2>해당 자료가 존재하지 않습니다.</h2></td>
			  </tr>
			  <%} %>
			</tbody>
		</table>
	</div>
</body>
</html>










