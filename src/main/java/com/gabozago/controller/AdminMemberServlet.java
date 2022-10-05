package com.gabozago.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gabozago.dao.MemberDao;
import com.gabozago.dto.MemberVo;

@WebServlet("/adminMember.do")
public class AdminMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao mDao = MemberDao.getInstance();

	    List<MemberVo> memberList = mDao.selectAllMembers();
	    request.setAttribute("memberList", memberList);
	   
		// 리스트 페이지로 이동
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/PAGE/Admin/adminMember.jsp");
	    dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}