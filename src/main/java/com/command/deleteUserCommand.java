package com.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.MemberDao;
import com.beans.MemberVo;

public class deleteUserCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		MemberVo mVo = new MemberVo();
		
		String userid = (String)request.getParameter("userid");
		
		System.out.println("delUserCommand : " + userid);
		
		try {
			cnt = new MemberDao().deleteMember(userid);
			System.out.println("delUserCommand2 : " + cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("count", cnt);
		
	}
}
