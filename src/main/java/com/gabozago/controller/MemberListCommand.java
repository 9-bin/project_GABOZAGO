package com.gabozago.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gabozago.dao.MemberDao;
import com.gabozago.dto.MemberVo;
import com.gabozago.dto.Paging;

/**
 * Servlet implementation class MemberListCommand
 */
@WebServlet("/memList.do")
public class MemberListCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		testdo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		testdo(request, response);
	}
	
	protected void testdo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDao dao = new MemberDao();
		
		List<MemberVo> list = null;
		int page = 1;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		Paging paging = new Paging();
		int count = 0;
		
		try {
			count = dao.getAllcount();
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		paging.setPage(page);
		paging.setTotalCount(count);

		try {
			list = dao.selectAllMember(paging);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("memList", list);
		request.setAttribute("paging", paging);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("MemberList.jsp");
		dispatcher.forward(request, response);
	}

}
