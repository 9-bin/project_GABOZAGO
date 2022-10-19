package com.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class adminGuideSearchCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		request.getAttribute("placetype");
		request.getAttribute("key");
		request.getAttribute("location");
		
		request.setAttribute("placetype", request.getAttribute("placetype"));
		request.setAttribute("key", request.getAttribute("key"));
		request.setAttribute("location", request.getAttribute("location"));
	}

}
