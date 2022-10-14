package com.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class guideAllSearchCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int type = Integer.parseInt(request.getParameter("type"));
		
		request.setAttribute("type", type);
	}

}
