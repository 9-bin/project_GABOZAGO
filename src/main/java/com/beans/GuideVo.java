package com.beans;

public class GuideVo {

	private int placenum;
	private int local;
	private int placetype;
	private String placename;
	private String placephone;
	private String adress;
	private float latitude;
	private float longtiude;
	
	public GuideVo() {
		
	}
	
	public GuideVo(String placename, String adress, int placenum, int local, int placetype) {
		this.placenum = placenum;
		this.local = local;
		this.placetype = placetype;
		this.placename = placename;
		this.adress = adress;
	}
	
	public GuideVo(int placenum, int local, 
		int placetype, String placename, String placephone, 
		String adress, float latitude, float longtiude) {
		this.placenum = placenum;
		this.local = local;
		this.placetype = placetype;
		this.placename = placename;
		this.placephone = placephone;
		this.adress = adress;
		this.latitude = latitude;
		this.longtiude = longtiude;
	}
	
	public GuideVo(String placename, String adress, int placenum) {
		this.placename = placename;
		this.adress = adress;
		this.placenum = placenum;
	}
	
	public GuideVo(String placename, String adress) {
		this.placename = placename;
		this.adress = adress;
	}

	public GuideVo(String placename) {
		this.placename = placename;
	}
	
	
	public int getPlacenum() {
		return placenum;
	}
	public void setPlacenum(int placenum) {
		this.placenum = placenum;
	}
	public int getLocal() {
		return local;
	}
	public void setLocal(int local) {
		this.local = local;
	}
	public int getPlacetype() {
		return placetype;
	}
	public void setPlacetype(int placetype) {
		this.placetype = placetype;
	}
	public String getPlacename() {
		return placename;
	}
	public void setPlacename(String placename) {
		this.placename = placename;
	}
	public String getPlacephone() {
		return placephone;
	}
	public void setPlacephone(String placephone) {
		this.placephone = placephone;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public float getLatitude() {
		return latitude;
	}
	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}
	public float getLongtiude() {
		return longtiude;
	}
	public void setLongtiude(float longtiude) {
		this.longtiude = longtiude;
	}
	
	@Override
	public String toString() {
		return "GuideVo [placenum=" + placenum + ", local=" + local + ", placetype=" + placetype + ", placename="
				+ placename + ", placephone=" + placephone + ", adress=" + adress + ", latitude=" + latitude
				+ ", longtiude=" + longtiude + "]";
	}
	
	
}
