package com.model;

public class Good {
   private int id;  //编号
   private String name;   //商品标题
   private String shop;  //店铺
   private float price;   //价格
   private int comment_number;   //评价条数
   private float good_rate;  //好评率
   private String link;   //链接
   private String brand; //品牌
   private String type;//类别
   private String image;
   private String content;
   private String cipin;//商品评价的词频
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
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getShop() {
	return shop;
}
public void setShop(String shop) {
	this.shop = shop;
}
public int getComment_number() {
	return comment_number;
}
public void setComment_number(int comment_number) {
	this.comment_number = comment_number;
}
public float getGood_rate() {
	return good_rate;
}
public void setGood_rate(float good_rate) {
	this.good_rate = good_rate;
}
public String getLink() {
	return link;
}
public void setLink(String link) {
	this.link = link;
}
public String getBrand() {
	return brand;
}
public void setBrand(String brand) {
	this.brand = brand;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public void setPrice(float price) {
	this.price = price;
}
public float getPrice() {
	return price;
}
public String getCipin() {
	return cipin;
}
public void setCipin(String cipin) {
	this.cipin = cipin;
}
   
}
