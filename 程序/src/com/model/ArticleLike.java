package com.model;

public class ArticleLike {
	   private int id;
	   private int user_id;
	   private int article_id;  //用户喜欢的文章
	   private String article_name;  //用户喜欢的文章的名称
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
	public int getArticle_id() {
		return article_id;
	}
	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}
	public String getArticle_name() {
		return article_name;
	}
	public void setArticle_name(String article_name) {
		this.article_name = article_name;
	}
	public String getFocus_time() {
		return focus_time;
	}
	public void setFocus_time(String focus_time) {
		this.focus_time = focus_time;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	   
}
