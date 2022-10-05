package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.Command;
import com.command.adminMemberCommand;
import com.command.guideAllCommand;
import com.command.guideNextCommand;
import com.command.guidePlanCommand;
import com.command.guideResultCommand;
import com.command.joinCommand;
import com.command.loginCommand;
import com.command.memberListCommand;
import com.command.planListCommand;
import com.command.trafficCommand;


@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Controller() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		Command command = null;
		String ViewPage = null;			// 넘겨줄 페이지(jsp)
		
		String uri = request.getRequestURI();				// 주소 전체(프로젝트+.do)
		String conPath = request.getContextPath();			// 프로젝트명
		String com = uri.substring(conPath.length());		// .do
		
		System.out.println(uri);
		System.out.println(conPath);
		System.out.println(com);
		
		switch (com) {
// 메인 / 첫화면
		case "/index.do" :
			ViewPage = "index.jsp";
			break;
			
		case "/main.do":
			ViewPage = "/PAGE/main.jsp";
			break;
			
// 멤버
		case "/login.do":		// member
			ViewPage = "/PAGE/Member/login.jsp";
			break;
			
		case "/loginOK.do":		// member
//			System.out.println("12");
			command = new loginCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Member/loginOK.jsp";
			break;
			
		case "/join.do":		// member
			ViewPage = "/PAGE/Member/join.jsp";
			break;
		case "/joinOK.do":		// member
			command = new joinCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Member/joinOK.jsp";
			break;


// 가이드
		case "/guide.do":
			ViewPage = "/PAGE/Guide/guide.jsp";
			break;
		case "/guideAll.do":
			command = new guideAllCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Guide/guideAll.jsp";
			break;
		case "/guideNext.do":
			System.out.println("1 - controller : " + request.getParameter("local"));
			command = new guideNextCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Guide/guideSelectLocation.jsp";
			break;
		case "/guideResult.do" :
			System.out.println("1.1 - controller : " + session.getAttribute("Local"));
			int resultLocal = (Integer)session.getAttribute("Local");
			request.setAttribute("Local", resultLocal);
			command = new guideResultCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Guide/guideResult.jsp";
			break;
			
			
// 일정
		case "/plan.do":
			ViewPage = "/PAGE/Schedule/planList.jsp";
			break;
			
		case "/planList.do":
			request.getParameterValues("guideList");
			request.setAttribute("List", request.getParameterValues("guideList"));
			command = new planListCommand();
			command.execute(request, response);
			ViewPage = "";									/// 경로 수정 필요 합니당!!!!!
			break;
			
			
// 교통
		case "/traffic.do":
			command = new trafficCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Traffic/traffic.jsp";
			break;
			
//	관리자
		case "/memList.do": 
			command = new memberListCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Admin/memberadmin.jsp";
			break;
			
		case "/adminForbidden.do":
			ViewPage = "/PAGE/Admin/adminForbidden.jsp";
			break;
			
		case "/userInfo.do": // memList 페이지에서 id값 눌렀을때 이동하는 페이지
			ViewPage = "";
			break;
		
		case "/adminMember.do":
			command = new adminMemberCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Admin/adminMember.jsp";
			break;
			
		case "/adminGuide.do":
			ViewPage = "/PAGE/Admin/adminGuide.jsp";
			break;
			
// 커뮤니티
		case "community.do":
			ViewPage = "/PAGE/Community/community.jsp";
			break;
			
			
		}


		
		if (ViewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(ViewPage);
			dispatcher.forward(request, response);
		}
	}
	
	

}
