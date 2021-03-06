package com.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
 
public class Java_Python_test {
    public String best_fit(int user_id) {
        // TODO Auto-generated method stub
    	//int a = 104976;
    	//int b = 23;
    	String like_id="";
    	try {
    	    String[] args = new String[] { "python", "E:\\eclipse-workspace\\yangyang\\src\\com\\python\\tuijian.py", String.valueOf(user_id) };
    	    Process proc = Runtime.getRuntime().exec(args);// 执行py文件
    	 
    	    BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
    	    String line = null;
    	    
    	    while ((line = in.readLine()) != null) {
    	        System.out.println(line);
    	        like_id=like_id+line+";";
    	    }
    	    System.out.println(like_id);
    	    	
    	    in.close();
    	    proc.waitFor();
    	} catch (IOException e) {
    	    e.printStackTrace();
    	} catch (InterruptedException e) {
    	    e.printStackTrace();
    	}
    	return like_id;
    }
    
    public void UpdateData(String brand) {
        // TODO Auto-generated method stub
    	//int a = 104976;
    	//int b = 23;
    	String like_id="";
    	try {
    	    String[] args = new String[] { "python", "E:\\eclipse-workspace\\yangyang\\src\\com\\python\\updatedata.py", brand };
    	    Process proc = Runtime.getRuntime().exec(args);// 执行py文件
    
    	    BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
//    	    String line = null;
//    	    
//    	    while ((line = in.readLine()) != null) {
//    	        System.out.println(line);
//    	        like_id=like_id+line+";";
//    	    }
//    	    System.out.println(like_id);
    	    	
    	    in.close();
    	    proc.waitFor();
    	} catch (IOException e) {
    	    e.printStackTrace();
    	} catch (InterruptedException e) {
    	    e.printStackTrace();
    	}
    	//return like_id;
    }
    public static void main(String [] args)
    {
//    	Java_Python_test j=new Java_Python_test();
////    	System.out.print(j.best_fit(104976));
//    	String like=j.best_fit(104975);
//    	String[]lik=like.split(";");
//    	for(String l:lik)
//    	{
//    		System.out.println(l);
//    	}
//    	Java_Python_test j=new Java_Python_test();
//    	j.UpdateData("回力");
    }
}
