package com.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.A;

public class GuideDao {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public GuideDao() {
		try {
			Class.forName(A.driver);
			conn = DriverManager.getConnection(A.url, A.user, A.pwd);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void close() throws SQLException{
	      if (rs != null) rs.close();
	      if (pstmt != null) pstmt.close();
	      if (conn != null) conn.close();
	}
	
	public int getAllCount() throws SQLException {
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_GUIDE_COUNT);
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
		int endNum = paging.getEndNum(); 
		System.out.println(startNum + " | " + endNum);
		
		try {
			pstmt = conn.prepareStatement(A.SQL_GUIDE_ALL);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			
			rs = pstmt.executeQuery();
			list = getGuide(rs);
		} finally {
			close();
		}		
		return list;
	}
	
	public List<GuideVo> getGuide(ResultSet rs) throws SQLException {
		List<GuideVo> list = new ArrayList<>();
		
		while (rs.next()) {
			String name = rs.getString("placename");
			String adress = rs.getString("adress");
			
			System.out.println(name);
			
			GuideVo gVo = new GuideVo(name, adress);
			list.add(gVo);
		}
		return list;
	}
	
	public int getCount(int local) throws SQLException{
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_SELECT_COUNT);
			pstmt.setInt(1, local);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public List<GuideVo> selectGuide(Paging paging, int local) throws SQLException {
		List<GuideVo> list = null;
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		System.out.println("SN : " + startNum + " | EN : " + endNum);
		
		try {
			pstmt = conn.prepareStatement(A.SQL_GUIDE_SELECT);
			pstmt.setInt(1, local);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);
			
			rs = pstmt.executeQuery();
			list = getGuide(rs);
		} finally {
			close();
		}
		return list;
	}
	
	// 가이드 리스트 가져오기 함수
	   public List<GuideVo> selectAllGuides() throws SQLException {
		   String sql = "select * from guide order by placenum";
		   List<GuideVo> list = new ArrayList<GuideVo>();

		   try {
			   pstmt = conn.prepareStatement(sql);
			   rs=pstmt.executeQuery();
			   while(rs.next()) {
				   GuideVo gVo = new GuideVo();
				   gVo.setPlacenum(rs.getInt("placenum"));
				   gVo.setLocal(rs.getInt("local"));
				   gVo.setPlacetype(rs.getInt("placetype"));
				   gVo.setPlacename(rs.getString("placename"));
				   gVo.setPlacephone(rs.getString("placephone"));
				   gVo.setAdress(rs.getString("adress"));
				   gVo.setLatitude(rs.getFloat("latitude"));
				   gVo.setLongtiude(rs.getFloat("longtiude"));
				   
				   list.add(gVo);		   
			   }
		   }catch(Exception e) {
			   e.printStackTrace();
		   }finally {
			   close();
		   }
		   return list;
	   }

	//		검색된 가이드 리스트 가져오기
	public List<GuideVo> searchGuide(Paging paging, int local, int placetype, String keyword) throws SQLException {
		List<GuideVo> list = null;
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum(); 
		System.out.println(startNum + " | " + endNum);
		
		try {
			pstmt = conn.prepareStatement(A.SQL_SEARCH);
			pstmt.setInt(1, local);
			pstmt.setInt(2, placetype);
			pstmt.setString(3, "%"+keyword+"%");
			pstmt.setInt(4, startNum);
			pstmt.setInt(5, endNum);
			
			rs = pstmt.executeQuery();
			list = getGuide(rs);
		} finally {
			close();
		}		
		return list;
	}
	
	public int getSearchCount(int local, int placetype, String keyword) throws SQLException{
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_SEARCH_COUNT);
			pstmt.setInt(1, local);
			pstmt.setInt(2, placetype);
			pstmt.setString(3, "%"+keyword+"%");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
}

