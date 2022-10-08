package com.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class trafficNextCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = null;
		int local = Integer.parseInt(request.getParameter("local"));
		int placetype = Integer.parseInt(request.getParameter("placetype"));
		String keyword = request.getParameter("keyword");

		request.setAttribute("local", local);
		request.setAttribute("placetype", placetype);
		request.setAttribute("keyword", keyword);
		
	}
}
