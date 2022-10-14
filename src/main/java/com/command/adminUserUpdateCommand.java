package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.MemberDao;
import com.beans.MemberVo;

public class adminUserUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = (String)request.getParameter("id");
		
		System.out.println("adminUserUpdateCom : " + userId); // ok
		List<MemberVo> list = null;
		
		try {
			list = new MemberDao().readByUser(userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("id", userId);
		request.setAttribute("mVo", list);
	}
	

}
