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
import com.command.dbCheckCommand;
import com.command.deleteUserCommand;
import com.command.guideAllCommand;
import com.command.guideNextCommand;
import com.command.guidePlanCommand;
import com.command.guideResultCommand;
import com.command.joinCommand;
import com.command.loginCommand;
import com.command.memberListCommand;
import com.command.planListCommand;
import com.command.trafficCommand;
import com.command.trafficNextCommand;
import com.command.updateMemberCommand;


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
			if (session.getAttribute("userId") != null) {
				ViewPage = "/PAGE/main.jsp";
			}
			break;
			
		case "/loginOK.do":		// member
//			System.out.println("12");
			command = new loginCommand();
			command.execute(request, response);
			session.setAttribute("userId", request.getAttribute("userid"));
			session.setAttribute("admin", request.getAttribute("admin"));
			session.setAttribute("name", request.getAttribute("name"));
			session.setAttribute("email", request.getAttribute("email"));
			session.setAttribute("gender", request.getAttribute("gender"));
			session.setAttribute("phone", request.getAttribute("phone"));
//			System.out.println("controller : " + request.getAttribute("name") + " | " +  request.getAttribute("gender"));
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
			
		case "/dbCheckId.do" :
			command = new dbCheckCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Member/dbCheckId.jsp";
			break;
			
		case "/logout.do":
			session.invalidate();
			ViewPage = "index.jsp";
			break;
			
		case "/deleteUser.do":
			ViewPage = "/PAGE/Member/deleteUser.jsp";
			break;
			
		case "/deleteUserOK.do":
			command = new deleteUserCommand();
			command.execute(request, response);
			session.invalidate();		// 세션 삭제
			ViewPage = "/PAGE/Member/deleteUserOK.jsp";
			break;
			
		case "/correction.do" :		// 회원 정보 수정
			ViewPage = "/PAGE/Member/correctionUser.jsp";
			break;
			
		case "/updateMember.do" :
			command = new updateMemberCommand();
			command.execute(request, response);
			session.setAttribute("email", request.getAttribute("updateEmail"));
			session.setAttribute("phone", request.getAttribute("updatePhone"));
			ViewPage = "/PAGE/Member/updateOK.jsp";
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
			System.out.println("controller" + request.getParameter("place"));
			String[] places = request.getParameterValues("place"); 
			System.out.println(places);
			/* request.setAttribute("places", places); */
			session.setAttribute("places", places);
			ViewPage = "/PAGE/Schedule/writePlan.jsp";
			break;
		// plan.do 에서 일정 눌렀을때 다시 아래 페이지로 이동해야함
		case "":
			ViewPage = "/PAGE/Schedule/writePlan.jsp";
			break;
			
			
// 교통
		case "/traffic.do":
			ViewPage = "/PAGE/Traffic/traffic.jsp";
			break;
			
		case "/trafficNext.do":
			System.out.println("1 - controller : " + request.getParameter("local"));
			command = new trafficNextCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Traffic/trafficSearch.jsp";
			break;
			
		case "/trafficSearch.do":
			int local = (Integer)session.getAttribute("local");
			int placetype = (Integer)session.getAttribute("placetype");
			Object keyword = session.getAttribute("keyword");
			request.setAttribute("local", local);
			request.setAttribute("placetype", placetype);
			request.setAttribute("keyword", keyword);
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
