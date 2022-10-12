package com.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.MemberDao;

public class adminUserDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = -1;
		String userid = request.getParameter("id");
		
		System.out.println("admindeleteCommand id : " + userid);
		
		try {
			cnt = new MemberDao().deleteMember(userid);
			System.out.println("adminDeleteCommand cnt : " + cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("count", cnt);
	}

}
