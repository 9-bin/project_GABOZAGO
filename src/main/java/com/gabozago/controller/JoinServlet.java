package com.gabozago.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gabozago.dao.MemberDao;
import com.gabozago.dto.MemberVo;


@WebServlet("/join.do")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/member/join.jsp"); // 회원가입 페이지로 이동
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서블릿 환경 설정..?
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// join.jsp 에서 작성한 데이터를 데이터 베이스에 넣기
		String name = request.getParameter("name");
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
//		int gender = 0; 
		
//		try {
//			gender = Integer.parseInt(request.getParameter("gender"));					
//		} catch (NumberFormatException e) {
//			e.printStackTrace();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}

		// 만약 admin을 사용한다면 주석 해제
//		int admin = Integer.parseInt(request.getParameter("admin"));
		
		// 디버깅 - 콘솔 출력
		System.out.println("name " + name);
		System.out.println("phone " + phone);
		System.out.println("gender " + gender);
		
		// 데이터 베이스 연동(싱글톤)
		MemberDao mDao = MemberDao.getInstance();

		// 객체화
		MemberVo mVo = new MemberVo();
		
		// 각각의 개체에 저장 - mVo에 setter로 저장
		mVo.setName(name);
		mVo.setUserid(userid);
		mVo.setPassword(password);
		mVo.setEmail(email);
		mVo.setPhone(phone);
		mVo.setGender(gender);
		
		int result = mDao.insertMember(mVo); // DB에 정보 삽입
		
		if (result == 1) {
			System.out.println("ok");
		} else {
			System.out.println("failed");
		}
	
		RequestDispatcher dispatcher = request.getRequestDispatcher("/member/login.jsp");
		dispatcher.forward(request, response);
	}
	
	
}
