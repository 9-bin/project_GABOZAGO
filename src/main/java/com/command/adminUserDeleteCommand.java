package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.MemberDao;

public class adminUserDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		String userid = request.getParameter("id");
		
		System.out.println("admindeleteCommand id : " + userid);
		
		try {
			cnt = new MemberDao().deleteMember(userid);
			System.out.println("adminDeleteCommand cnt : " + cnt);
			if (cnt == -1) {
				cnt = 0;	
			}
//			System.out.println("adminDeleteCommand cnt2 : " + cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			request.setAttribute("count", cnt);
		}
	}

}
