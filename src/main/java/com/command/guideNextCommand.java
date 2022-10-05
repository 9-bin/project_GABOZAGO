package com.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class guideNextCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = null;
		int local = Integer.parseInt(request.getParameter("local"));
		System.out.println("2 - guideNextCommand : " + local);
//		System.out.println("123");
		request.setAttribute("sendLocal", local);
		
	}

}
