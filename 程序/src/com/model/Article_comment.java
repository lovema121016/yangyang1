package com.model;

import java.sql.Timestamp;

public class Article_comment {
   private int id;  
   private int article_id;  //文章编号
   private String username;   //评论用户名
   private String content;   //评论的内容
   private String up_time;   //发表日期
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}

public int getArticle_id() {
	return article_id;
}
public void setArticle_id(int article_id) {
	this.article_id = article_id;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getUp_time() {
	return up_time;
}
public void setUp_time(String up_time) {
	this.up_time = up_time;
}

   
}
