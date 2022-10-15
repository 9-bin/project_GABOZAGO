package com.util;

public class A {

// 오라클 드라이버 연결
	public static final String driver = "oracle.jdbc.driver.OracleDriver";
	
	public static final String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	public static final String user = "ora_user";
	
	public static final String pwd =  "1234";

// 멤버
	public static final String SQL_INSERT_MEMBER = "insert into Member1 values(ppap.nextval,?,?,?,?,?,?,?)";

	public static final String SQL_USER_CHECK = "select * from member1 where userid = ? and password=?";
	
	public static final String SQL_GET_MEMBER = "select * from member1 where userid=?";
	
	public static final String SQL_MEMBER_COUNT = "select count(*) as count from member1";
	
	public static final String SQL_MEMBER_ALL = "select * from ( select * from ( SELECT ROWNUM row_num, member1.* FROM member1 order by userno ) where row_num >= ? ) where row_num <= ? ";
	
	public static final String SQL_SELECT_MEMBER_LIST = "select * from member1 order by userno";
	
	public static final String SQL_DELETE_MEMBER = "DELETE from member1 where userid=?";
	
	public static final String SQL_UPDATE_MEMBER = "update member1 set password=?, email=?, phone=? where userid=?";	
	
	public static final String SQL_SELECT_ID = "SELECT userid FROM member1 WHERE userid=?";		// 중복체크
	
	

// 가이드
	public static final String SQL_GUIDE_COUNT =  "select COUNT(*) as count from GUIDE";
	
	public static final String SQL_GUIDE_ALL = "SELECT * FROM (SELECT * FROM ( SELECT ROWNUM row_num, guide.* from guide) where row_num >= ? ) where row_num <= ?";

	public static final String SQL_GUIDE_SELECT = "SELECT * FROM (SELECT * FROM ( SELECT ROWNUM row_num, guide.* from guide WHERE local = ?) where row_num >= ? ) where row_num <= ?";
	
	public static final String SQL_SELECT_COUNT = "select COUNT(*) as count from GUIDE where LOCAL=?";
	
	public static final String SQL_SEARCH = "SELECT * FROM (SELECT * FROM ( SELECT ROWNUM row_num, guide.* from guide WHERE local = ? and placetype = ? and placename like ?) where row_num >= ? ) where row_num <= ?";
	
	public static final String SQL_SEARCH_COUNT = "select COUNT(*) as count from GUIDE where LOCAL=? and placetype = ? and placename like ?";

	public static final String SQL_ALL_SEARCH_COUNT = "select COUNT(*) as count from GUIDE where placetype = ?";
	
	public static final String SQL_ALL_SEARCH = "SELECT * FROM (SELECT * FROM ( SELECT ROWNUM row_num, guide.* from guide WHERE placetype = ?) where row_num >= ? ) where row_num <= ?";
	
// 일정
	public static final String SQL_SELECT_PNO = "select * from guide where placenum=?";
	
	public static final String SQL_PLAN_CNT = "select COUNT(*) as count from GUIDE where placenum=?";
	
	public static final String SQL_SCHEDULE_ID = "SELECT * FROM (SELECT * FROM (select Rownum row_num, schedulename from (select scheduleName scheduleName from schedule group by schedulename, userid having userid=? order by schedulename)) where row_num >= ?) where row_num <= ?";
	
	public static final String SQL_SCHEDULE_ID_COUNT = "select count(count) as count from (select count(scheduleName) as count from schedule group by schedulename, userid having userid=? order by schedulename)";
	
	public static final String SQL_SCHEDULE_ID_PN = "SELECT * FROM (SELECT * FROM ( SELECT ROWNUM row_num, guide.* from guide where guide.placenum in (select placenum from schedule where userid=? and schedulename=?)) where row_num >= ? ) where row_num <= ?";
	
	public static final String SQL_SCHEDULE_ID_PN_COUNT = "select COUNT(*) as count from guide a where a.placenum in (select placenum from schedule where userid=? and schedulename=?)";
	
// 관리자
	public static final String SQL_ADMIN_MEMBER = "update member1 set name=?, email=?, phone=?, gender=?, admin=? where userid=?";	

}
