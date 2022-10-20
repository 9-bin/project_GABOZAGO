package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.MemberDao;
import com.beans.MemberVo;
import com.beans.Paging;

public class adMemberSearchOKCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("memberSearchOKcom : " + request.getAttribute("type") + " | " + request.getAttribute("key"));
		
		String Type = (String)request.getAttribute("type");
		String Key = (String)request.getAttribute("key");
		
		List<MemberVo> list = null;
		int page = 1;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		Paging paging = new Paging();
		int count = 0;
		
		try {
			count = new MemberDao().getMemberCount(Type, Key);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		paging.setPage(page);
		paging.setTotalCount(count);
		
		try {
			list = new MemberDao().searchMember(paging, Type, Key);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("memberList", list);
		request.setAttribute("paging", paging);
		
	}

}
