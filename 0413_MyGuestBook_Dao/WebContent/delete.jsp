<%@page import="com.hb.mybatis.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- onelist에서 저장한 vo 호출 --%>
<% VO vo = (VO)session.getAttribute("vo"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제화면</title>
<script type="text/javascript">
	function delete_go(f) {
		var pwd1 = f.pwd.value;
		var pwd2 = "<%= vo.getPwd()%>";
		
		if(pwd1 != pwd2){
			alert("비번을 다시 입력하세요");
			f.pwd.value="";
			f.pwd.focus();
			return;
		}else{
			var chk = confirm("정말 삭제할까요?");
			if(chk){
				f.action="delete_ok.jsp?idx=<%=vo.getIdx()%>";
				f.submit();
			
			}else{
				f.action="onelist.jsp?idx=<%=vo.getIdx()%>";
				f.submit();
			}
		}
	}
</script>
</head>
<body>
	<div align="center">
		<h2>방명록 : 삭제화면</h2>
		<hr />
		<p>[<a href="list.jsp">목록으로 이동</a>]</p>
		<form method="post">
			<table>
				<tr align="center">
					<td bgcolor="#99ccff">비번</td>
					<td><input type="password" name="pwd" size ="20"/></td>
			
					<td><input type="button" value="삭제" onclick="delete_go(this.form)" />
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>