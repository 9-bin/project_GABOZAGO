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
import com.command.adminGuideDeleteCommand;
import com.command.adminGuideInsertCommand;
import com.command.adminMemberCommand;
import com.command.adminUserDeleteCommand;
import com.command.adminUserInfoCommand;
import com.command.adminUserUpdateCommand;
import com.command.adminUserUpdateOKCommand;
import com.command.dbCheckCommand;
import com.command.deleteUserCommand;
import com.command.guideAdminCommand;
import com.command.guideAllCommand;
import com.command.guideAllSearchCommand;
import com.command.guideAllSearchOKCommand;
import com.command.guideNextCommand;
import com.command.guideResultCommand;
import com.command.guideSearchCommand;
import com.command.guideSearchOKCommand;
import com.command.joinCommand;
import com.command.loginCommand;
import com.command.planAllCommand;
import com.command.planListCommand;
import com.command.scheduleAddCommand;
import com.command.scheduleAddSearchCommand;
import com.command.scheduleAddSearchNextCommand;
import com.command.scheduleDeleteCommand;
import com.command.scheduleDetailCommand;
import com.command.scheduleNextCommand;
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
			session.setAttribute("userno", request.getAttribute("userno"));
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
			
		case "/guideSearch.do":
			System.out.println("controller guideSearch : " + request.getParameter("guideSearch") + " | " + request.getParameter("guideKeyword"));
			request.setAttribute("type", request.getParameter("guideSearch"));
			request.setAttribute("key", request.getParameter("guideKeyword"));
			command = new guideSearchCommand();
			ViewPage = "/PAGE/Guide/guideSelectType.jsp";
			break;
			
		case "/guideSearchOK.do":
			int searchLocal = (Integer)session.getAttribute("Local");
			request.setAttribute("Local", searchLocal);
			request.setAttribute("type", session.getAttribute("Type"));
			request.setAttribute("key", session.getAttribute("Key"));
			System.out.println("controller searchOK : " + session.getAttribute("Local") + " | " + 
												session.getAttribute("Type") + " | " + session.getAttribute("Key"));
			command = new guideSearchOKCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Guide/guideSearch.jsp";
			break;
			
		case "/guideAllSearch.do":		// guideSearch.do와 비슷
			System.out.println("controller guideAllSearch : " + request.getParameter("guideSearch"));
			request.setAttribute("type", request.getParameter("guideSearch"));
			command = new guideAllSearchCommand();
			ViewPage = "/PAGE/Guide/guideAllSearchResult.jsp";
			break;

		case "/guideAllSearchOK.do":	// guideSearchOK.do와 비슷
			request.setAttribute("type", session.getAttribute("Type"));
			System.out.println("controller guideAllSearchOK : " + session.getAttribute("type"));
			command = new guideAllSearchOKCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Guide/guideAllSearch.jsp";
			break;
			
			
			// 일정
					case "/schedule.do":
						request.setAttribute("userId", session.getAttribute("userId"));
						command = new planAllCommand();
						command.execute(request, response);
						ViewPage = "/PAGE/Schedule/scheduleList.jsp";
						break;
						
					case "/scheduleNext.do":
						request.setAttribute("userid", session.getAttribute("userId"));
						request.setAttribute("schedulename",request.getParameter("schedulename"));
						System.out.println(session.getAttribute("userId"));
						command = new scheduleNextCommand();
						command.execute(request, response);
						ViewPage = "/PAGE/Schedule/scheduleNext.jsp";
						break;
						
					case "/scheduleDetail.do": // 가이드에서 선택한 장소 목록(일정만들기)
						request.setAttribute("userid", session.getAttribute("userId"));
						request.setAttribute("schedulename",session.getAttribute("schedulename"));
						System.out.println(session.getAttribute("schedulename"));
						System.out.println(session.getAttribute("userid"));
						command = new scheduleDetailCommand();	//스케쥴 리스트, paging 필요
						command.execute(request, response);
						ViewPage = "/PAGE/Schedule/scheduleDetail.jsp";	//선택된 장소 목록 페이지로 이동
						break;
						
						
					case "/scheduleList.do":	// 가이드에서 선택한 일정 목록(일정만들기)
						command = new planListCommand();
						command.execute(request, response);
						ViewPage = "/PAGE/Schedule/scheduleDetail.jsp";	//선택된 일정 목록 페이지로 이동
						break;
						
					case"/scheduleAddPlace.do":
						command = new guideAllCommand();
						command.execute(request, response);
						ViewPage = "/PAGE/Schedule/scheduleAddPlace.jsp";
						break;
						
					case "/scheduleAddSearchNext.do":
						request.setAttribute("local", request.getParameter("local"));
						request.setAttribute("placetype", request.getParameter("placetype"));
						request.setAttribute("keyword", request.getParameter("keyword"));
						command = new scheduleAddSearchNextCommand();
						command.execute(request, response);
						ViewPage = "/PAGE/Schedule/scheduleAddPlaceNext.jsp";
						break;
						
					case "/scheduleAddSearch.do":
						System.out.println("controller guideSearch : " + session.getAttribute("keyword") + " | " + request.getAttribute("keyword"));
						request.setAttribute("local", session.getAttribute("local"));
						request.setAttribute("placetype", session.getAttribute("placetype"));
						request.setAttribute("keyword", session.getAttribute("keyword"));
						command = new scheduleAddSearchCommand();
						command.execute(request, response);
						ViewPage = "/PAGE/Schedule/scheduleAddPlace.jsp";
						break;
						
					case"/scheduledeletePlace.do":
						request.setAttribute("userid",request.getParameter("userid"));
						request.setAttribute("placenum",request.getParameter("placenum"));
						request.setAttribute("schedulename",request.getParameter("schedulename"));
						command = new scheduleDeleteCommand();
						command.execute(request, response);
						ViewPage = "/PAGE/Schedule/scheduleNext.jsp";
						break;
						
					case"/scheduleAdding.do":
						request.setAttribute("userid",request.getParameter("userid"));
						request.setAttribute("placenum",request.getParameter("placenum"));
						request.setAttribute("schedulename",request.getParameter("schedulename"));
						command = new scheduleAddCommand();
						command.execute(request, response);
						ViewPage = "/PAGE/Schedule/scheduleNext.jsp";
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
			System.out.println("1 - controller : " + request.getParameter("startplace"));
			System.out.println("1 - controller : " + request.getParameter("endplace"));
			command = new trafficNextCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Traffic/trafficSearch.jsp";
			break;
			
		case "/trafficSearch.do":
//			System.out.println("gu - controller : " + session.getAttribute("local").getClass().getTypeName());
//			System.out.println("gu - controller : " + session.getAttribute("placetype"));
//			System.out.println("gu - controller : " + session.getAttribute("keyword"));
			System.out.println("gu - controller : " + session.getAttribute("startplace"));
			System.out.println("gu - controller : " + session.getAttribute("endplace"));
			
			int local = (Integer)session.getAttribute("local");
			int placetype = (Integer)session.getAttribute("placetype");
			Object keyword = session.getAttribute("keyword");
			Object startplace = session.getAttribute("startplace");
			Object endplace = session.getAttribute("endplace");
			
			request.setAttribute("local", local);
			request.setAttribute("placetype", placetype);
			request.setAttribute("keyword", keyword);
			request.setAttribute("startplace", startplace);
			request.setAttribute("endplace", endplace);
			command = new trafficCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Traffic/traffic.jsp";
			break;
		
			
//	관리자	
		case "/adminForbidden.do":
			ViewPage = "/PAGE/Admin/adminForbidden.jsp";
			break;
			
		case "/userInfo.do": // adminMember 페이지에서 id값 눌렀을때 이동하는 페이지
			command = new adminUserInfoCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Admin/userInfo.jsp";
			break;
			
		case "/adminUserDelete.do":	// 관리자가 회원 삭제
			System.out.println("controller-adminDelete : " + request.getParameter("id"));
			command = new adminUserDeleteCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Admin/adminUserDeleteOK.jsp";
			break;
			
		case "/adminUserUpdate.do":	// 관리자가 회원 정보 수정
			command = new adminUserUpdateCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Admin/adminUserUpdate.jsp";
			break;
														
		case "/adminUpdateOK.do":
			command = new adminUserUpdateOKCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Admin/adminUserUpdateOK.jsp";
			break;
		
		case "/adminMember.do":
			command = new adminMemberCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Admin/adminMember.jsp";
			break;
			
		// 가이드 목록
		case "/adminGuide.do":
			command = new guideAdminCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Admin/adminGuide.jsp";
			break;
			
		case "/adminGuideInsert.do":
			ViewPage = "/PAGE/Admin/adminGuideInsert.jsp";	// 가이드 장소 정보 입력
			break;
			
		case "/GuideInsertOK.do":		// 가이드 입력받은거 전송
			command = new adminGuideInsertCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Admin/guideInsertOk.jsp";		// 입력값 확인 창 
			break;
			
		case "/deleteGuideOK.do":		// 가이드 정보 삭제
			command = new adminGuideDeleteCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Admin/deleteGuideOK.jsp";
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
