package com.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.ScheduleDao;
import com.beans.ScheduleVo;

public class planListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 쿼리스트링으로 전달 받은 placenum 획득
		int placenum = Integer.parseInt(request.getParameter("placenum"));
		
		// 상품 삭제 클릭시 삭제할 상품 정보 표시
		// 데이터베이스에서 수정할 데이터 정보 확인
		ScheduleVo sVo = new ScheduleVo();
		try {
			sVo = new ScheduleDao().selectPlaceByNum(placenum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 정보를 가지고 (request)
		request.setAttribute("placenum", sVo);
	}

}
