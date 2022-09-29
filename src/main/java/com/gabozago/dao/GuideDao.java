package com.gabozago.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gabozago.dto.GuideVo;
import com.gabozago.dto.Paging;
import com.gabozago.util.DBManager;

public class GuideDao {
	
	// 싱글톤  - 필드 생성
	static GuideDao instance = new GuideDao();

	// 생성자
	public GuideDao() {
	}
	
	// 싱글톤 - 메소드 생성
	public static GuideDao getInstance() {
		return instance;
	}
	
	
	// 메소드
	// 지도 정보 확인
	// 입력값: 가이드 화면에서 입력받은 장소
	// 반환값: 입력받은 장소 주소 정보
//	public GuideVo getLocal(String placename) {
//		// DB에서 가져오는 내용 쿼리문으로 작성
//		// 변수 사용 시 안에서 적으면 그 안에서만 사용되니까 꼭 밖에다가 써주기
//		int result = -1;
//		String sql = "select * from guide where placenum=?";   // 쿼리문
//		GuideVo gVo = null;
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			conn = DBManager.getConnection();
//			
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, placename);
//			
//			rs = pstmt.executeQuery();
//			
//			if (rs.next()) {
//				gVo = new GuideVo();
//				
//				gVo.setPlacenum(rs.getInt();
//				gVo.setLocal(result);
//				gVo.setPlacetype(result);
//				gVo.setPlacename(placename);
//				gVo.setPlacephone(sql);
//				gVo.setAdress(sql);
//				gVo.setLatitude(result);
//				gVo.setLongtiude(result);
//			}
//			
//			
//			
//			
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		
//	}
	
	public int getAllCount() throws SQLException {
		int count = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select COUNT(*) as count from GUIDE";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public List<GuideVo> selectAllGuide(Paging paging) throws SQLException {
		List<GuideVo> list = null;
		int startNum = paging.getStartNum();
		System.out.println("start num : " + startNum);
		int endNum = paging.getEndNum();
		System.out.println("end num : " + endNum);
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM (SELECT * FROM ( SELECT ROWNUM row_num, guide.* from guide) where row_num >= ? ) where row_num <= ?";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			
			rs = pstmt.executeQuery();
			list = getGuide(rs);
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	public List<GuideVo> getGuide(ResultSet rs) throws SQLException {
		List<GuideVo> list = new ArrayList<>();
		
		while (rs.next()) {
			String name = rs.getString("placename");
			String adress = rs.getString("adress");
			
//			System.out.println(name);
//			System.out.println(adress);
			
			GuideVo gVo = new GuideVo(name, adress);
//			System.out.println(gVo);
			list.add(gVo);
		}
		return list;
	}

}
