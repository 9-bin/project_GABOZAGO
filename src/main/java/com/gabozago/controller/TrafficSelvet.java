package com.gabozago.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gabozago.dao.GuideDao;
import com.gabozago.dto.GuideVo;

@WebServlet("/traffic.do")
public class TrafficSelvet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuideDao gDao = GuideDao.getInstance();
	    List<GuideVo> guideList = gDao.selectAllGuides();
	    request.setAttribute("guideList", guideList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/PAGE/Traffic/traffic.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
