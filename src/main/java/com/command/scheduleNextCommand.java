package com.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class scheduleNextCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = null;
		
		String userid = (String)request.getAttribute("userid");
		String schedulename = request.getParameter("schedulename");
		
		request.setAttribute("userid", userid);
		request.setAttribute("schedulename", schedulename);
		
	}
}
