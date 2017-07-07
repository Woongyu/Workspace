<%@page import="com.hb.mybatis.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- onelist에서 저장한 vo 호출 --%>
<% VO vo = (VO)session.getAttribute("vo"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정화면</title>
<style type="text/css">
	a { text-decoration: none;}
	table{width: 500px; border-collapse:collapse; }
	table,tr,td{border: 1px solid black; padding: 3px}
</style>
<script type="text/javascript">
	function save_go(f) {
		var pwd1 = f.pwd.value;
		var pwd2 = "<%=vo.getPwd()%>";
		if(pwd1 != pwd2){
			alert("비번 틀립니다.");
			f.pwd.value="";
			f.pwd.focus();
			return;
		}else{
			f.action="update_ok.jsp";
			f.submit();
		}
	}
</script>
</head>
<body>
	<div align="center">
		<h2>방명록 : 수정화면</h2>
		<hr />
		<p>[<a href="list.jsp">목록으로 이동</a>]</p>
		<form method="post">
			<table>
				<tr align="center">
					<td bgcolor="#99ccff">작성자</td>
					<td><input type="text" name="name" size ="20" value="<%=vo.getName() %>" /></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">제  목</td>
					<td><input type="text" name="subject" size ="20" value="<%=vo.getSubject() %>" /></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">email</td>
					<td><input type="text" name="email" size ="20" value="<%=vo.getEmail() %>" /></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">비밀번호</td>
					<td><input type="password" name="pwd" size ="20"/></td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<textarea rows="10" cols="60" name="content"><%=vo.getContent() %></textarea>
					</td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="2">
						<%-- idx가 없으므로 idx를 같이 넘겨주자 --%>
						<input type="hidden" name="idx" value="<%=vo.getIdx() %>" />
							<input type="button" value="업데이트" onclick="save_go(this.form)" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" value="취소" />
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>










