<%@page import="org.sp.mybatisApp.domain.Board"%>
<%@page import="org.sp.mybatisApp.repository.MySQLBoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
MySQLBoardDAO boardDAO=new MySQLBoardDAO();
%> <!-- 유지보수성을 유지하면서 데이터베이스 연동을 하기 위해 -->
<%
	int board_idx=Integer.parseInt(request.getParameter("board_idx"));
	//out.print(board_idx);
	
	Board board=boardDAO.select(board_idx);
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}

input[type=text], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
	resize: vertical;
}

input[type=submit] {
	background-color: #04AA6D;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#bt_list").click(function(){
		location.href="/board/list.jsp";
	});
	
	$("#bt_edit").click(function(){
		//폼태그의 입력 내용을 서버에 전송
		$("form").attr({
			method:"POST",
			action:"/board/edit.jsp"
		});
		$("form").submit(); //전송
	});
	
	$("#bt_del").click(function(){
		if(confirm("삭제하시겠습니까?")){
			location.href="/board/delete.jsp?board_idx=<%=board.getBoard_idx()%>";
		}
	});
	
});
</script>
</head>
<body>

	<div class="container">
		<form>
			<input type="hidden" name="board_idx" value="<%=board.getBoard_idx()%>">
			<input type="text" name="title" value="<%=board.getTitle()%>"> 
			<input type="text" name="writer" value="<%=board.getWriter()%>">
			<textarea id="subject" name="content" style="height: 200px"><%=board.getContent()%></textarea>
			<input type="button" value="목록" id="bt_list">
			<input type="button" value="수정" id="bt_edit">
			<input type="button" value="삭제" id="bt_del">
		</form>
	</div>
	<%@ include file="/inc/footer.jsp" %>
</body>
</html>
