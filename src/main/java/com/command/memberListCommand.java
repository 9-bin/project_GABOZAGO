package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.MemberDao;
import com.beans.MemberVo;
import com.beans.Paging;


public class memberListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		MemberDao dao = new MemberDao();
		
		List<MemberVo> list = null;
		int page = 1;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		Paging paging = new Paging();
		int count = 0;
		
		try {
			count = dao.getAllcount();
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		paging.setPage(page);
		paging.setTotalCount(count);

		try {
			list = dao.selectAllMember(paging);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("memList", list);
		request.setAttribute("paging", paging);
	}

}
