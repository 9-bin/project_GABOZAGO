package com.gabozago.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gabozago.dao.MemberDao;
import com.gabozago.dto.MemberVo;


@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/PAGE/Member/login.jsp";		// 현재 url
		
		// 세션 설정
		HttpSession session = request.getSession();
		
		// 세션 속성 유지 -> index 페이지로 이동 ( 페이지 설정 다시!!)
		if ( session.getAttribute("loginUser") != null) {		// 로그인한 회원 정보가 세션에 잘 저장되어있는지 확인
			url = "PAGE/Schedule/planList.jsp";
		}
		
		// 페이지 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher(url); // 세션에 따라 다른 이동경로
		dispatcher.forward(request, response); // + request 내부 속성값
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String url = "PAGE/Member/login.jsp";	// 현재 경로
		MemberDao mDao = MemberDao.getInstance();	// DB연동
		
		// 입력받은 아이디, 비밀번호
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		
		// 입력한 아이디, 비밀번호로 DB조회 - 사용자 확인
		int result = mDao.checkUser(userid, password);
		
		System.out.println("id : " + userid);		// 디버깅
		System.out.println("pwd : " + password);
		
		if (result == 1) {
			System.out.println("ok");
			url = "PAGE/Schedule/planList.jsp";		
			
			// 로그인 성공시 정보 넘김
			MemberVo mVo = mDao.getMember(userid);
			
			// 세션 설정
			HttpSession session = request.getSession();	// 생성된 세션 객체 호출
			session.setAttribute("loginUser", mVo);		// 세션 값 저장
			
			session.setAttribute("name", mVo.getName());
			session.setAttribute("userid", mVo.getUserid());
			
		} else if (result == 0) {
			System.out.println("fail");
		} else {
			System.out.println("not exist");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
	
	
}
