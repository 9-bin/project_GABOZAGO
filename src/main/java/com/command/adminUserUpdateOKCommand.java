package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.MemberDao;
import com.beans.MemberVo;

public class adminUserUpdateOKCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		MemberVo mVo = new MemberVo();
		
		String userid = request.getParameter("Userid");
		String name = request.getParameter("Name");
		String phone = request.getParameter("Phone");
		String email = request.getParameter("Email");
		String gender = request.getParameter("ch_gender");
		String admin = request.getParameter("ch_admin");
		
		System.out.println("adminapdateOKCommand : " + gender + " | " + admin);
		
		mVo.setUserid(userid);
		mVo.setName(name);
		mVo.setPhone(phone);
		mVo.setEmail(email);
		mVo.setGender(gender);
		mVo.setAdmin(Integer.parseInt(admin));
		
		System.out.println("adminapdateOKCommand : " + mVo.getAdmin());
		
		try {
			cnt = new MemberDao().updateAdmin(mVo);
			System.out.println("adminupdateCommand cnt : " + cnt); 
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("cnt", cnt);
	}

}
