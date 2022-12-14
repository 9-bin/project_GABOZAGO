package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.Command;
import com.command.adMemberSearchOKCommand;
import com.command.adminGuideDeleteCommand;
import com.command.adminGuideInsertCommand;
import com.command.adminGuideSearchCommand;
import com.command.adminGuideSearchOKCommand;
import com.command.adminMemberCommand;
import com.command.adminMemberSearchCommand;
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
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		HttpSession session = request.getSession();
		
		int ADMIN = 0; 	// ????????? ?????? 0?????? ??????(????????? ????????? ?????? ?????? ?????? ??????)
		Command command = null;
		String ViewPage = null;			// ????????? ?????????(jsp)
		
		String uri = request.getRequestURI();				// ?????? ??????(????????????+.do)
		String conPath = request.getContextPath();			// ???????????????
		String com = uri.substring(conPath.length());		// .do
		
		System.out.println(uri);
		System.out.println(conPath);
		System.out.println(com);
		
		switch (com) {
// ?????? / ?????????
		case "/index.do" :
			ViewPage = "index.jsp";
			break;
			
		case "/main.do":
			ViewPage = "/PAGE/main.jsp";
			break;
			
// ??????
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
			Object result = request.getAttribute("count");
			if (result.equals(1)) {
				session.invalidate();		// ?????? ??????
			}
			ViewPage = "/PAGE/Member/deleteUserOK.jsp";
			break;
			
		case "/correction.do" :		// ?????? ?????? ??????
			ViewPage = "/PAGE/Member/correctionUser.jsp";
			break;
			
		case "/updateMember.do" :
			command = new updateMemberCommand();
			command.execute(request, response);
			session.setAttribute("email", request.getAttribute("updateEmail"));
			session.setAttribute("phone", request.getAttribute("updatePhone"));
			ViewPage = "/PAGE/Member/updateOK.jsp";
			break;
			
			


// ?????????
		case "/guide.do":
			ViewPage = "/PAGE/Guide/guide.jsp";
			if (session.getAttribute("userId") == null) {
				writer.println("<script>alert('????????? ??? ?????? ???????????????.'); location.href='index.do'; </script>"); 
				writer.close();
			}
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
			
		case "/guideAllSearch.do":		// guideSearch.do??? ??????
			System.out.println("controller guideAllSearch : " + request.getParameter("guideSearch"));
			request.setAttribute("type", request.getParameter("guideSearch"));
			command = new guideAllSearchCommand();
			ViewPage = "/PAGE/Guide/guideAllSearchResult.jsp";
			break;

		case "/guideAllSearchOK.do":	// guideSearchOK.do??? ??????
			request.setAttribute("type", session.getAttribute("Type"));
			System.out.println("controller guideAllSearchOK : " + session.getAttribute("type"));
			command = new guideAllSearchOKCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Guide/guideAllSearch.jsp";
			break;
			
			
// ??????
		case "/schedule.do":
			if (session.getAttribute("userId") == null) {
				writer.println("<script>alert('????????? ??? ?????? ???????????????.'); location.href='index.do'; </script>"); 
				writer.close();
			}
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
			
		case "/scheduleDetail.do": // ??????????????? ????????? ?????? ??????(???????????????)
			request.setAttribute("userid", session.getAttribute("userId"));
			request.setAttribute("schedulename",session.getAttribute("schedulename"));
			System.out.println(session.getAttribute("schedulename"));
			System.out.println(session.getAttribute("userid"));
			command = new scheduleDetailCommand();	//????????? ?????????, paging ??????
			command.execute(request, response);
			ViewPage = "/PAGE/Schedule/scheduleDetail.jsp";	//????????? ?????? ?????? ???????????? ??????
			break;
			
			
		case "/scheduleList.do":	// ??????????????? ????????? ?????? ??????(???????????????)
			command = new planListCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Schedule/scheduleDetail.jsp";	//????????? ?????? ?????? ???????????? ??????
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
			
		// plan.do ?????? ?????? ???????????? ?????? ?????? ???????????? ???????????????
		case "":
			ViewPage = "/PAGE/Schedule/writePlan.jsp";
			break;
						
			
// ??????
		case "/traffic.do":
			ViewPage = "/PAGE/Traffic/traffic.jsp";
			if (session.getAttribute("userId") == null) {
				writer.println("<script>alert('????????? ??? ?????? ???????????????.'); location.href='index.do'; </script>"); 
				writer.close();
			}
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
		
			
//	?????????	
		case "/adminForbidden.do":
			ViewPage = "/PAGE/Admin/adminForbidden.jsp";
			break;
			
		case "/userInfo.do": // adminMember ??????????????? id??? ???????????? ???????????? ?????????
			command = new adminUserInfoCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Admin/userInfo.jsp";
			break;
			
		case "/adminUserDelete.do":	// ???????????? ?????? ??????
			System.out.println("controller-adminDelete : " + request.getParameter("id"));
			command = new adminUserDeleteCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Admin/adminUserDeleteOK.jsp";
			break;
			
		case "/adminUserUpdate.do":	// ???????????? ?????? ?????? ??????
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
			if (session.getAttribute("admin") != null) {
				ADMIN = Integer.parseInt(String.valueOf(session.getAttribute("admin")));
			}
			if (ADMIN != 1) { 
				writer.println("<script>alert('????????? ????????? ??? ?????? ???????????????.'); location.href='index.do'; </script>"); 
				writer.close();
				break;
			}
			command = new adminMemberCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Admin/adminMember.jsp";
			break;
			
		case "/memberSearch.do":
			System.out.println("controller memberSearch : " + request.getParameter("memberSearch") + " | " + request.getParameter("guideKeyword"));
			request.setAttribute("Type", request.getParameter("searchMember"));
			request.setAttribute("keyword", request.getParameter("memberKeyword"));
			command = new adminMemberSearchCommand();
			command.execute(request, response);
			session.setAttribute("Type", request.getAttribute("type"));
			session.setAttribute("Key", request.getAttribute("key"));
			System.out.println("controller memberSearch : " + session.getAttribute("Type"));
			request.getRequestDispatcher("memberSearchOK.do").forward(request, response);
			break;
			
		
		case "/memberSearchOK.do":	
			request.setAttribute("type", session.getAttribute("Type"));
			request.setAttribute("key", session.getAttribute("Key"));
			System.out.println("controller memberSearchOK se: " + request.getAttribute("type"));
			command = new adMemberSearchOKCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Admin/adminNextMember.jsp";
			break;
			
		// ????????? 
		case "/adminGuide.do":
			if (session.getAttribute("admin") != null) {
				ADMIN = Integer.parseInt(String.valueOf(session.getAttribute("admin")));
			}
			if (ADMIN != 1) {
				writer.println("<script>alert('????????? ????????? ??? ?????? ???????????????.'); location.href='index.do'; </script>"); 
				writer.close();
				break;
			}
			command = new guideAdminCommand();	// ????????? ?????? ??????
			command.execute(request, response);
			ViewPage = "/PAGE/Admin/adminGuide.jsp";
			break;
			
		case "/adminGuideInsert.do":
			ViewPage = "/PAGE/Admin/adminGuideInsert.jsp";	// ????????? ?????? ?????? ??????
			break;
			
		case "/GuideInsertOK.do":		// ????????? ??????????????? ??????
			command = new adminGuideInsertCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Admin/guideInsertOk.jsp";		// ????????? ?????? ??? 
			break;
			
		case "/deleteGuideOK.do":		// ????????? ?????? ??????
			command = new adminGuideDeleteCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Admin/deleteGuideOK.jsp";
			break;
			
		case "/adminGuideSearch.do":
			System.out.println("controller yuna adminkeword : " + request.getParameter("adminkeword") + " | " + request.getParameter("local"));
			request.setAttribute("placetype", request.getParameter("placetype"));
			request.setAttribute("key", request.getParameter("adminkeword"));
			request.setAttribute("location", request.getParameter("local"));
			command = new adminGuideSearchCommand();
			ViewPage = "/PAGE/Admin/adminGuideSearch.jsp";
			break;
			
		case "/adminGuideSearchOK.do":
			request.setAttribute("Local", session.getAttribute("Local"));
			request.setAttribute("type", session.getAttribute("Type"));
			request.setAttribute("key", session.getAttribute("Key"));
			System.out.println("controller yuna searchOK : " + session.getAttribute("Local") + " | " + 
												session.getAttribute("Type") + " | " + session.getAttribute("Key"));
			command = new adminGuideSearchOKCommand();
			command.execute(request, response);
			ViewPage = "/PAGE/Admin/adminNextGuide.jsp";
			break;
			
			
// ????????????
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
