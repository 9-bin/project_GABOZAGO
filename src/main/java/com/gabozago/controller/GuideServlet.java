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
import javax.servlet.http.HttpSession;

import com.gabozago.dao.GuideDao;
import com.gabozago.dto.GuideVo;
import com.gabozago.dto.Paging;


@WebServlet("/guide.do")
public class GuideServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		GuideDao gDao = new GuideDao();
		
		List<GuideVo> list = null;
		int page = 1;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		Paging paging = new Paging();
		int count = 0;
		
		try {
			count = gDao.getAllCount();
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		paging.setPage(page);
		paging.setTotalCount(count);

		try {
			list = gDao.selectAllGuide(paging);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("guideList", list);
		request.setAttribute("paging", paging);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("PAGE/Guide/guide.jsp");
		dispatcher.forward(request, response);
		
	}
		


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

}
