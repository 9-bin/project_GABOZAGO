package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.MemberDao;
import com.beans.MemberVo;

public class updateMemberCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		
		MemberDao mDao = new MemberDao();
		MemberVo mVo = new MemberVo();
		
		String userid = request.getParameter("userid");
		String pwd =  request.getParameter("password");
		String email =  request.getParameter("email");
		String phone =  request.getParameter("phone");
		
		System.out.println("updateCommand userid : " + userid);
		
		mVo.setPassword(pwd);
		mVo.setEmail(email);
		mVo.setPhone(phone);
		mVo.setUserid(userid);
		
		System.out.println("updatecommand1 : " +  mVo.getUserid() + " | " + mVo.getPassword());
		
		try {
			cnt = mDao.updateMember(mVo);
			System.out.println("updatecnt : " + cnt);
			System.out.println("updatecommand2 : " + mVo.getAdmin() + " | " + mVo.getUserid());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("updateEmail", email);
		request.setAttribute("updatePhone", phone);
		request.setAttribute("cnt", cnt);
	}

}
