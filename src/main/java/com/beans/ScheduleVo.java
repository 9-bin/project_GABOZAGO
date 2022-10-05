package com.beans;

public class ScheduleVo {
	private int schedulenum;
	private String userid;
	private int placenum;
	private String schedulename;
	public int getSchedulenum() {
		return schedulenum;
	}
	public void setSchedulenum(int schedulenum) {
		this.schedulenum = schedulenum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getPlacenum() {
		return placenum;
	}
	public void setPlacenum(int placenum) {
		this.placenum = placenum;
	}
	public String getSchedulename() {
		return schedulename;
	}
	public void setSchedulename(String schedulename) {
		this.schedulename = schedulename;
	}
	
	
	@Override
	public String toString() {
		return "ScheduleVo [schedulenum=" + schedulenum + ", userid=" + userid + ", placenum=" + placenum
				+ ", schedulename=" + schedulename + "]";
	}
	
	

}
