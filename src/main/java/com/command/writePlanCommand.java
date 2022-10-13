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

public class writePlanCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 가이드리스트에서 선택해서 가져올 정보 리스트에 담아서 보여줌
		GuideDao gDao = new GuideDao();
		
		List<GuideVo> list = null;
		int page = 1;
		HttpSession session = null;
		
		// 세션값 가져오기, 장소번호, 일정이름
        String userid = (String) request.getAttribute("userId");
        String placeNum = request.getParameter("placenum");
        int placeuum = Integer.parseInt(placeNum);
        String schedulename = request.getParameter("Sname");
        
		
        // 디버깅
		System.out.println("session id 2: "+ userid);
		System.out.println("getplacenum1: "+ placeNum);
		System.out.println("writePlanCom schedulename: "+ schedulename);
		
		ScheduleDao sDao = new ScheduleDao();
		ScheduleVo sVo = new ScheduleVo();
		
		sVo.setUserid(userid);
		sVo.setSchedulename(schedulename);
		sVo.setPlacenum(placeuum);	
		
		try {// 정보 받아서 스케줄DB에 입력받은 일정으로 정보 삽입해주기
			sDao.insertPlace(sVo);
			System.out.println("DB등록 성공");
		} catch (SQLException e) {
			e.printStackTrace();
		} 

		
		// 페이징
		list = null;
		page = 1;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
			
		Paging paging = new Paging();
		int cnt = 0;
		
		try {
			cnt = gDao.getPlanCnt(placeuum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		paging.setPage(page);
		paging.setTotalCount(cnt);
			
		try {	// 가이드 리스트 장소번호으로 가져오기 함수
			list = gDao.selectAllGuidesByNo(placeuum);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("placnum", placeuum);
		System.out.println("placnum2: "+placeuum);
		request.setAttribute("guideList", list);
		System.out.println("guideList"+ list.size());
		request.setAttribute("paging", paging);
	}

}
