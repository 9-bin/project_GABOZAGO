package com.gabozago.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gabozago.dao.GuideDao;
import com.gabozago.dto.GuideVo;




@WebServlet("/guidePlanList.do")
public class GuidePlanListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();	//브라우저에 출력하는 함수
		
		// 가이드에서 선택한 장소를 여기서 받아옴
		String[] guideList = request.getParameterValues("guideList");
		for(String selectList : guideList) {
		     out.println("<br>selectList: " + selectList);
		}
		
		//리스트 페이지로 이동
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("../guide/writePlan.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 선택한 장소 정보 표시
		GuideDao gDao = GuideDao.getInstance();
		GuideVo gVo = new GuideVo();

		// 리스트 객체 만들기 : 클래스 타입 넣어주면 알아서 해당 타입으로 정의해서 사용가능
		// 선택한 장소 리스트를 디비로부터 조회하여 저장
	}

}
