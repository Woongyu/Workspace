<%@page import="com.hb.mybatis.DAO"%>
<%@page import="com.hb.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
    
<%-- 파라미터값들 vo에 저장됨 --%>
<jsp:useBean id="vo" class="com.hb.mybatis.VO" />
<jsp:setProperty property="*" name="vo"/>
<%
    int result = DAO.getInsert(vo);
    if(result>0){%>
    <script type="text/javascript">
       alert("삽입성공");
       location.href="list.jsp";
    </script>	
    <%}else{%>
     <script type="text/javascript">
      alert("실패성공");
      history.go(-1);
    </script>	
   <%}   %>