package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.beans.MemberDao;
import com.beans.MemberVo;
import com.beans.ScheduleDao;

public class scheduleDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = -1;
		String userid = request.getParameter("userid");
		String placenum = request.getParameter("placenum");
		String schedulename = request.getParameter("schedulename");
		
		//delete만해
		
		System.out.println("admindeleteCommand id : " + userid);
		
		try {
			cnt = new ScheduleDao().deleteSchedule(userid,placenum,schedulename);
			System.out.println("adminDeleteCommand cnt : " + cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("count", cnt);
		request.setAttribute("userid", userid);
		request.setAttribute("placenum", placenum);
		request.setAttribute("schedulename", schedulename);
	}

}
