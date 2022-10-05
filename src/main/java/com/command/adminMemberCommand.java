package com.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.MemberDao;
import com.beans.MemberVo;

public class adminMemberCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		List<MemberVo> memberList = null;
		
		try {
			memberList = new MemberDao().selectAllMembers();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("memberList", memberList);
	}
	
}
