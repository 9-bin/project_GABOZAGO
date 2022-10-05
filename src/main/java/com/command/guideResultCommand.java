package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.beans.GuideDao;
import com.beans.GuideVo;
import com.beans.Paging;

import oracle.jdbc.internal.XSSessionNamespace;


public class guideResultCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
  		GuideDao gDao = new GuideDao();
		List<GuideVo> list = null;
		int page = 1;
		HttpSession session = null;
  		
		System.out.println("3 - guideResultCommand : " + request.getAttribute("Local"));
		int local = (Integer)request.getAttribute("Local");		//여기서 강제 형변환 오류 발생
		System.out.println("3-1 - guideResultCommand : " + local);
		
//  		int local = (Integer)request.getAttribute("local");
  		System.out.println("4 - guideResultCommand : " + local);
  		
		list = null;
		page = 1;
			
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
			
		Paging paging = new Paging();
		int count = 0;
			
		try {
			count = gDao.getCount(local);
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		paging.setPage(page);
		paging.setTotalCount(count);

		try {
			list = gDao.selectGuide(paging, local);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("guideList", list);
		request.setAttribute("paging", paging);
		System.out.println("local : " + local);
//		local += 1;
		request.setAttribute("local", local);

		
		

	}

	
}
