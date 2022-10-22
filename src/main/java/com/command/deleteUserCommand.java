package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.MemberDao;
import com.beans.MemberVo;

public class deleteUserCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		
		String userid = (String)request.getParameter("userid");
		
		System.out.println("delUserCommand : " + userid);
		
		try {
			cnt = new MemberDao().deleteMember(userid);
			System.out.println("delUserCommand2 : " + cnt);
			if (cnt == -1) {
				cnt = 0;	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			request.setAttribute("count", cnt);
		}
		
	}
}
