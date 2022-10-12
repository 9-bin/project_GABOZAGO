package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.MemberDao;
import com.beans.MemberVo;
import com.beans.Paging;

public class adminMemberCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		List<MemberVo> memberList = null;
		int page = 1;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
			
		Paging paging = new Paging();
		int count = 0;
			
		try {
			count = new MemberDao().getAllcount();
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		paging.setPage(page);
		paging.setTotalCount(count);
		
		
		try {
			memberList = new MemberDao().selectAllMember(paging);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("memberList", memberList);
		request.setAttribute("paging", paging);
	}
	
}
