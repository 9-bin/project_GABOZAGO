package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.GuideDao;
import com.beans.GuideVo;
import com.beans.Paging;
import com.beans.ScheduleDao;
import com.beans.ScheduleVo;


public class planAllCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
    	ScheduleDao sDao = new ScheduleDao();
		
		List<ScheduleVo> list = null;
		int page = 1;
		
		String userid = "";
			
		// 아이디 가져와
		try {
			userid = (String) request.getAttribute("userId");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
			
		Paging paging = new Paging();
		int count = 0;
			
		try {
			count = sDao.getAllCount(userid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		paging.setPage(page);
		paging.setTotalCount(count);

		try {
			list = sDao.selectIDSchedule(paging, userid);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("scheduleList", list);
		request.setAttribute("paging", paging);
		
	}

}
