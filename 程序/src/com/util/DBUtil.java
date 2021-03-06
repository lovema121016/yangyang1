package com.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil { 
    
	 /** Oracle数据库连接URL*/ 
   private final static String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
    
   /** Oracle数据库连接驱动*/ 
   private final static String DB_DRIVER = "oracle.jdbc.driver.OracleDriver"; 
    
   /** 数据库用户名*/ 
   private final static String DB_USERNAME = "C##CHINA_GOOD"; 
    
   /** 数据库密码*/ 
   private final static String DB_PASSWORD = "bishe"; 
    
   /** 
    * 获取数据库连接 
    * @return 
    */ 
   public static Connection getConnection(){ 
       /** 声明Connection连接对象*/ 
       Connection conn = null; 
       try{ 
           /** 使用Class.forName()方法自动创建这个驱动程序的实例且自动调用DriverManager来注册它*/ 
           Class.forName(DB_DRIVER); 
           /** 通过DriverManager的getConnection()方法获取数据库连接*/ 
           conn = DriverManager.getConnection(DB_URL,DB_USERNAME,DB_PASSWORD); 
           System. out.println("数据库连接成功！" );  
       }catch(Exception ex){ 
       	System. out.println("数据库连接失败！" );  
           ex.printStackTrace(); 
       } 
       return conn; 
   } 
    
   /** 
    * 关闭数据库连接 
    *  
    * @param conn 
    */ 
   public static void close(Connection conn){ 
       try{ 
           if(conn != null){ 
               /** 判断当前连接连接对象如果没有被关闭就调用关闭方法*/ 
               if(!conn.isClosed()){ 
                   conn.close(); 
               } 
           } 
       }catch(Exception ex){ 
           ex.printStackTrace(); 
       } 
   } 
   
   public static void close(PreparedStatement preparedStatement ) {
		try {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void close(ResultSet resultSet ) {
		try {
			if (resultSet != null) {
				resultSet.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
   
   
   public static void main(String[] args) {  
       // TODO Auto-generated method stub  
	DBUtil c = new DBUtil();  
       c.getConnection(); 
}

}