package org.sp.mybatisApp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sp.mybatisApp.domain.Board;
import org.sp.mybatisApp.repository.MySQLBoardDAO;

//글쓰기 요청을 처리하는 서블릿(jsp로 작성해도 상관 없지만, 공부목적)
public class RegistServlet extends HttpServlet{
	MySQLBoardDAO boardDAO = new MySQLBoardDAO();
	
	//파라미터 받기
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8"); //마인 타입
		
		String title=request.getParameter("title");
		String writer=request.getParameter("writer");
		String content=request.getParameter("content");
		
		//입력 시도
		Board board = new Board();
		board.setTitle(title);
		board.setWriter(writer);
		board.setContent(content);
		
		boardDAO.insert(board);
		
		PrintWriter out = response.getWriter();
		
		out.print("제목은 "+title+"<br>");
		out.print("작성자는 "+writer+"<br>");
		out.print("내용은 "+content+"<br>");
		
		//list.jsp를 재요청하도록 응답정보를 구성하자
		//클라이언트 웹브라우저로 하여금, 지정한 URL로 재접속을 유도..
		response.sendRedirect("/board/list.jsp"); //location.href="";
	}
}
