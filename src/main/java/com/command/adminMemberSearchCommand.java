package com.command;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.MemberDao;
import com.beans.MemberVo;
import com.beans.Paging;

public class adminMemberSearchCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String Type = (String)request.getAttribute("Type");
		String keyword = (String)request.getAttribute("keyword");
		
		System.out.println("adminMemberSearchCom : " + Type + " | " + keyword);
		
		List<MemberVo> list = null;
		int page = 1;
		
		if (request.getParameter("Page") != null) {
			page = Integer.parseInt(request.getParameter("Page"));
		}
		
		Paging paging = new Paging();
		int count = 0;
		
		try {
			count = new MemberDao().getMemberCount(Type, keyword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		paging.setPage(page);
		paging.setTotalCount(count);
		
		try {
			list = new MemberDao().searchMember(paging, Type, keyword);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("type", Type);
		request.setAttribute("key", keyword);
		
		request.setAttribute("memberList", list);
		request.setAttribute("paging", paging);

	}

}
