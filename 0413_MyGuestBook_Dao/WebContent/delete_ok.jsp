<%@page import="com.hb.mybatis.DAO"%>
<%@page import="com.hb.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int result = DAO.getDelete(request.getParameter("idx"));
	if(result>0){
		response.sendRedirect("list.jsp");
	}else{%>
		<script>
    		alert("삭제 실패");
    		history.go(-2);
    	</script>		
   <%}%>