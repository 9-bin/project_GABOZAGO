package com.beans;

import java.lang.annotation.AnnotationTypeMismatchException;

public class MemberVo {
	// 담아야 할 정보/ 보호해야함(private)
	// DTO(VO) 사용 장점
	// 1. 중요한 정보 보안 강화 (필드 직접 접근 차단)
	// 2. 데이터 관리의 일원화 (객체를 통해서만 데이터 접근)
	// 3. 데이터 값 검증 (유효한 값만 사용)
	
	private int userno;
	private String name;
	private String userid;
	private String password;
	private String email;
	private String phone;
	private String gender;
//	private int gender;
	private int admin; // - 관리자 여부 사용시 주석 해제
	
	public MemberVo() {
	}

	public MemberVo(int userno2, String name2, String userid2, String email2, String phone2, String gender2, int admin2) {
		this.userno = userno2;
		this.name = name2;
		this.userid = userid2;
		this.email = email2;
		this.phone = phone2;
		this.gender = gender2;
		this.admin = admin2;
	}
	
	public MemberVo(String name2, String userid2, String email2, String phone2, String gender2, int admin2) {
		this.name = name2;
		this.userid = userid2;
		this.email = email2;
		this.phone = phone2;
		this.gender = gender2;
		this.admin = admin2;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "MemberVo [userno=" + userno + ", name=" + name + ", userid=" + userid + ", password=" + password
				+ ", email=" + email + ", phone=" + phone + ", gender=" + gender + ", admin=" + admin + "]";
	}
	
	

	
	
}
