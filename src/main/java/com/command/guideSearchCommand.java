package com.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class guideSearchCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int type = Integer.parseInt(request.getParameter("type"));
		String key = request.getParameter("key");
		
		request.setAttribute("type", type);
		request.setAttribute("key", key);
		
	}

}
