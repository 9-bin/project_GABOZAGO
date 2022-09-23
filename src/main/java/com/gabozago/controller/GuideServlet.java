package com.gabozago.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gabozago.dao.GudieDao;



@WebServlet("/guide.do")
public class GuideServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String place_name = request.getParameter("place_name");
//		System.out.println(userid);	// 디버깅
		
		// 입력한 아이디를 DB에서 조회하여 동일한 아이디가 없는지 확인
		GudieDao mDao = new GudieDao();
		int result = mDao.checkLocal(place_name);
			
		// forward로 페이지 이동(존나 중요 외우자)
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("tese/guid.jsp");	// 페이지로 이동 시켜줌
		dispatcher.forward(request, response);
	}
		


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
