<%@page import="com.hb.mybatis.DAO"%>
<%@page import="com.hb.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="u_vo" class="com.hb.mybatis.VO" />
<jsp:setProperty property="*" name="u_vo"/>

<%  int result = DAO.getUpdate(u_vo);
    if(result>0){
    	String idx = u_vo.getIdx();
    	response.sendRedirect("onelist.jsp?idx="+idx);
    }else{%>
    	<script>
    		alert("업데이트 실패");
    		history.go(-1);
    	</script>	
    <%}%>

