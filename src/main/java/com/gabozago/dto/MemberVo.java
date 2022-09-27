package com.gabozago.dto;

public class MemberVo {
	// 담아야 할 정보/ 보호해야함(private)
	// DTO(VO) 사용 장점
	// 1. 중요한 정보 보안 강화 (필드 직접 접근 차단)
	// 2. 데이터 관리의 일원화 (객체를 통해서만 데이터 접근)
	// 3. 데이터 값 검증 (유효한 값만 사용)
	
	private String name;
	private String userid;
	private String password;
	private String email;
	private String phone;
	private String gender;
//	private int gender;
	private int admin; // - 관리자 여부 사용시 주석 해제
	

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
	
//	public int getGender() {
//		return gender;
//	}
//	public void setGender(int gender) {
//		this.gender = gender;
//	}

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
	
	// admin 사용 할 때 사용
	@Override
	public String toString() {
		return "MemberVo [name=" + name + ", userid=" + userid + ", password=" + password + ", email=" + email
				+ ", phone=" + phone + ", gender=" + gender + ", admin=" + admin + "]";
	}
	

//	// admin 사용 안할때 사용
//	@Override
//	public String toString() {
//		return "MemberVo [name=" + name + ", userid=" + userid + ", password=" + password + ", email=" + email
//				+ ", phone=" + phone + ", gender=" + gender + "]";
//	}

	
	
}
