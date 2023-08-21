<%@page import="java.util.List"%>
<%@page import="org.sp.mybatisApp.repository.BoardDAO"%>
<%@page import="org.sp.mybatisApp.util.Pager"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%!
	Pager pager=new Pager();
	BoardDAO boardDAO = new BoardDAO();
%>
<%
	//레코드 가져오기
	List boardList=boardDAO.selectAll();

	pager.init(boardList, request);
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	border: 1px solid #ddd;
}

th, td {
	text-align: left;
	padding: 16px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	//버튼에 이벤트 연결
	$("button").click(function(){
		$(location).attr("href", "/board/registform.jsp");
	});
});
</script>
</head>
<body>


	<table>
		<tr>
			<th>No</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
		<%int num=pager.getNum(); %>
		<% for(int i=1; i<pager.getPageSize();i++){ %>
		<%if(num<1)break; %>
		<tr>
			<td><%=num-- %></td>
			<td>Smith</td>
			<td>50</td>
			<td>50</td>
			<td>50</td>
		</tr>
		<%} %>
		
		<tr>
			<td colspan="5" align="center">
			<% for(int i=pager.getFirstPage(); i<=pager.getLastPage(); i++){ %>
				<%if(i>pager.getTotalPage())break; %>
				<a href="/board/list.jsp?currentPage=<%=i%>">[<%=i %>]</a>
			<%}%>
			</td>
		</tr>
		
		<tr>
			<td colspan="5"">
				<button>글쓰기</button>
			</td>
		</tr>

	</table>

</body>
</html>
