package com.gabozago.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gabozago.dao.GudieDao;



@WebServlet("/guide.do")
public class GuideServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "guide/guide.jsp";
		   // 세션 설명 
		   HttpSession session = request.getSession();		// 생성된 세션 객체 호출
		   // 만약, 세션 속성이 유지되고 있는 동안(즉, 로그인이 되어있는 상대)에는 main.jsp 페이지로 이동
		   if(session.getAttribute("loginUser") != null) {	//값이 있다면 이미 로그인이 되었단얘기/세션에 로그인한 회원정보가 잘저장되어 있는지 확인하여
			   url = "guide/plan1.jsp";	// 있다면 해당 페이지로 가져와   //session.setAttribute("loginUser", mVo);에서 저장(아래코드)

		   }
		   // a태그는 get방식
		   // 페이지 이동(forward 방식) : 주소창 변화 없이 이동
	      RequestDispatcher dispatcher;
	      dispatcher = request.getRequestDispatcher(url);
	      dispatcher.forward(request,response);
	      // request 안에 내용도 같이 이동
	}
		


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
