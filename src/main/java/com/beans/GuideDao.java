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
			int num = rs.getInt("placenum");
			int local = rs.getInt("local");
			int placetype = rs.getInt("placetype");
			
			System.out.println(name);
			
			GuideVo gVo = new GuideVo(name, adress,num,local,placetype);
			list.add(gVo);
		}
		return list;
	}
	
	public List<GuideVo> getAllGuide(ResultSet rs) throws SQLException {
		List<GuideVo> list = new ArrayList<>();
		
		while (rs.next()) {
			int placenum = rs.getInt("placenum");
			int local = rs.getInt("local");
			int placetype = rs.getInt("placetype");
			String placename = rs.getString("placename");
			String placephone = rs.getString("placephone");
			String adress = rs.getString("adress");
			float latitude = rs.getFloat("latitude");
			float longtiude = rs.getFloat("longtiude");

			GuideVo gVo = new GuideVo(placenum, local, placetype, placename, placephone, adress, latitude, longtiude);
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
			list = getAllGuide(rs);
		} finally {
			close();
		}		
		return list;
	}
	
	//	검색된 가이드 리스트 가져오기(전체목록에서)
	public List<GuideVo> searchGuide(Paging paging, int placetype) throws SQLException {
		List<GuideVo> list = null;
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum(); 
		System.out.println(startNum + " | " + endNum);
		
		try {
			pstmt = conn.prepareStatement(A.SQL_ALL_SEARCH);
			pstmt.setInt(1, placetype);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);
			
			rs = pstmt.executeQuery();
			list = getGuide(rs);
		} finally {
			close();
		}		
		return list;
	}
	
	// 검색한 가이드 리스트 개수 가져오기(페이징)
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
		
	// 검색한 가이드 리스트 개수 가져오기
	public int getSearchGuideCount(int placetype) throws SQLException{
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_ALL_SEARCH_COUNT);
			pstmt.setInt(1, placetype);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	// 가이드 리스트 장소번호으로 가져오기 함수
    public List<GuideVo> selectAllGuidesByNo(int placenum) throws SQLException {
	   String sql = "select * from guide where placenum =?";
	   List<GuideVo> list = null;
	   
	   try {
		   pstmt = conn.prepareStatement(sql);
		   pstmt.setInt(1, placenum);
		   rs=pstmt.executeQuery();
		   list = getGuide(rs);
		   
	   }catch(Exception e) {
		   e.printStackTrace();
	   }finally {
		   close();
	   }
	   return list;
   }
   
    // 일정 선택 갯수세기
    public int getPlanCnt(int placenum) throws SQLException{
	   
	   int cnt = 0;
	   
	   try {
			pstmt = conn.prepareStatement(A.SQL_PLAN_CNT);
			pstmt.setInt(1, placenum);
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
    
    // 선택된 일정의 장소 갯수 세기
	public int getScheduleCount(String userid, String placename) throws SQLException{
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_SCHEDULE_ID_PN_COUNT);
			pstmt.setString(1, userid);
			pstmt.setString(2, placename);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
    
	
	// 스케쥴이름과 아이디를 조건으로 가이드장소 select
	public List<GuideVo> selectSchedulePlace(Paging paging, String userid, String placename) throws SQLException {
		List<GuideVo> list = null;
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum(); 
		System.out.println(startNum + " | " + endNum);
		
		try {
			pstmt = conn.prepareStatement(A.SQL_SCHEDULE_ID_PN);
			pstmt.setString(1, userid);
			pstmt.setString(2, placename);
			pstmt.setInt(3, startNum);
			pstmt.setInt(4, endNum);
			
			rs = pstmt.executeQuery();
			list = getAllGuide(rs);
		} finally {
			close();
		}		
		return list;
	}
	
	// 가이드 장소 등록 ( DB에 장소 정보 삽입 )
	public int insertGuide(GuideVo gVo) throws SQLException {
		int result = -1;

		// DB연동
		try {
			pstmt = conn.prepareStatement(A.SQL_INSERT_GUIDE);
			pstmt.setInt(1, gVo.getLocal());
			pstmt.setInt(2, gVo.getPlacetype());
			pstmt.setString(3, gVo.getPlacename());
			pstmt.setString(4, gVo.getPlacephone());
			pstmt.setString(5, gVo.getAdress());
			pstmt.setFloat(6, gVo.getLatitude());
			pstmt.setFloat(7, gVo.getLongtiude());		
			
			System.out.println("getLocal : " +  gVo.getLocal());
			System.out.println("getPlacename : " + gVo.getPlacename());
			System.out.println("getAdress : " + gVo.getAdress());
			
			// 쿼리 수행 
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	// 장소 삭제
	public int deleteGuide(int placenum) throws SQLException {
		int result = -1;
		
		try {
			pstmt = conn.prepareStatement(A.SQL_DELETE_GUIDE);
			pstmt.setInt(1, placenum);
			
			// 쿼리 수행
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

}

