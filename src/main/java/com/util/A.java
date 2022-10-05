package com.util;

public class A {

	public static final String driver = "oracle.jdbc.driver.OracleDriver";
	
	public static final String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	public static final String user = "ora_user";
	
	public static final String pwd =  "1234";
	
	public static final String SQL_GUIDE_COUNT =  "select COUNT(*) as count from GUIDE";
	
	public static final String SQL_GUIDE_ALL = "SELECT * FROM (SELECT * FROM ( SELECT ROWNUM row_num, guide.* from guide) where row_num >= ? ) where row_num <= ?";

	public static final String SQL_GUIDE_SELECT = "SELECT * FROM (SELECT * FROM ( SELECT ROWNUM row_num, guide.* from guide WHERE local = ?) where row_num >= ? ) where row_num <= ?";
	
	public static final String SQL_SELECT_COUNT = "select COUNT(*) as count from GUIDE where LOCAL=?";
	
}
