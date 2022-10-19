package com.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class adminMemberSearchCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String Type = (String)request.getAttribute("Type");
		String keyword = (String)request.getAttribute("keyword");
		
		System.out.println("adminMemberSearchCom : " + Type + " | " + keyword);
		
		request.setAttribute("type", Type);
		request.setAttribute("key", keyword);
		
	}

}
