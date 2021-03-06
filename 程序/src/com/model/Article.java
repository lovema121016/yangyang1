package com.model;

import java.sql.Timestamp;

public class Article {
    private int id;  //编号
    private String user_username;   //用户名
    private String title;  //文章标题
    private String image;   //文章图片
    private String content;   //文章内容
    private String article_number;//文章编号
    private String type;   //类型
    private String brand;//文章所属品牌
    private int look;  //浏览量
    private Timestamp up_time;   //发表日期
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getLook() {
		return look;
	}
	public void setLook(int look) {
		this.look = look;
	}
	public Timestamp getUp_time() {
		return up_time;
	}
	public void setUp_time(Timestamp up_time) {
		this.up_time = up_time;
	}
	public String getUser_username() {
		return user_username;
	}
	public void setUser_username(String user_username) {
		this.user_username = user_username;
	}
	public String getArticle_number() {
		return article_number;
	}
	public void setArticle_number(String article_number) {
		this.article_number = article_number;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	
//	public static void main(String args[]) throws ParseException
//	{
//		Date date = new Date();       
//		Timestamp ctime = new java.sql.Timestamp(date.getTime());
//        System.out.println(ctime);
//
//	}
    
}
