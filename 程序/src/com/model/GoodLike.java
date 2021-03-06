package com.model;

public class GoodLike {
   private int id;
   private int user_id;
   private int good_id;
   private String good_name;
   private String focus_time;//关注时间
   private String brand;//品牌
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getUser_id() {
	return user_id;
}
public void setUser_id(int user_id) {
	this.user_id = user_id;
}
public int getGood_id() {
	return good_id;
}
public void setGood_id(int good_id) {
	this.good_id = good_id;
}
public String getFocus_time() {
	return focus_time;
}
public void setFocus_time(String focus_time) {
	this.focus_time = focus_time;
}
public String getGood_name() {
	return good_name;
}
public void setGood_name(String good_name) {
	this.good_name = good_name;
}
public String getBrand() {
	return brand;
}
public void setBrand(String brand) {
	this.brand = brand;
}
   
}
