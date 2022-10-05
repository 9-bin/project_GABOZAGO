package com.command;

import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.MemberDao;
import com.beans.MemberVo;

public class joinCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		
		// join.jsp 에서 작성한 데이터를 데이터 베이스에 넣기
		String name = request.getParameter("name");
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		
		MemberVo mVo = new MemberVo();
		// 각각의 개체에 저장 - mVo에 setter로 저장
		mVo.setName(name);
		mVo.setUserid(userid);
		mVo.setPassword(password);
		mVo.setEmail(email);
		mVo.setPhone(phone);
		mVo.setGender(gender);
		
		if (userid != null && userid.trim().length() > 0) {
			try {
				cnt = new MemberDao().insertMember(mVo);
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}
		
		request.setAttribute("cnt", cnt);
	}

}
