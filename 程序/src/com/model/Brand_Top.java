package com.model;

public class Brand_Top {
   private String brand;//品牌名称
   private int focus_good_number;//用户关注商品数
   private int related_article_number;//用户发布关于该商品的文章数
public String getBrand() {
	return brand;
}
public void setBrand(String brand) {
	this.brand = brand;
}
public int getFocus_good_number() {
	return focus_good_number;
}
public void setFocus_good_number(int focus_good_number) {
	this.focus_good_number = focus_good_number;
}
public int getRelated_article_number() {
	return related_article_number;
}
public void setRelated_article_number(int related_article_number) {
	this.related_article_number = related_article_number;
}
   
}
