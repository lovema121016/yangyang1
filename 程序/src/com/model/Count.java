package com.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Count {
   private int count;//该日期的关注人数
   private String date;//日期
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
   public static void main(String []args)
   {
	   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
       String currentDate = dateFormat.format(new Date());//获取当前时间
       System.out.print(currentDate);
   }
}
