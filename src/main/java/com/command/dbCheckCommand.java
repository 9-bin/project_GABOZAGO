package com.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.MemberDao;

public class dbCheckCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("userid");
		int result = 0;
		
		try {
			result = new MemberDao().selectID(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("result", result);
		
	}

}
