<%@page import="com.util.IPTimeStampUtil"%>
<%@page import="com.jspsmart.upload.Files"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@page import="java.awt.print.Printable"%>
<%@page import="com.util.DaoFactory"%>
<%@page import="com.model.Article"%>
<%@page import="java.util.Date" %>
<%@page import="com.dao.Good_type_dao"%>
<%@page import="com.model.Good_Type"%>
<%@page import="com.dao.BrandDao"%>
<%@page import="com.model.Brand"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Timestamp" %>
<%@page import="com.dao.ArticleDao" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="com.model.User" scope="session"/>    
    <%
    //获取从客户端传递过来的参数
    String title = null; //文章标题
    String username = null;//用户名
    String content = null;//文章内容
    String catagory = null; //文章种类
	String images = null; //文章图片
	String brand=null;//文章所属品牌
	String type=null;
    try{
    	title=request.getParameter("title");
    	username=user.getUsername();
    	content=request.getParameter("content");
    	catagory=request.getParameter("catagory");
    	type=catagory+";";
    	Good_type_dao bd=new Good_type_dao();
    	List<Good_Type> gts=bd.loadAll();
    	for(Good_Type ttt:gts)
    	{
    		if(content.indexOf(ttt.getSmall_type())!=-1)
    		{
    			type=type+ttt.getSmall_type()+";";
    		}
    	}  
    	
    	//品牌
    	BrandDao bb=new BrandDao();
    	List<Brand> brands=bb.loadAll();
    	for(Brand br:brands)
    	{
    		if(title.indexOf(br.getBrand())!=-1||content.indexOf(br.getBrand())!=-1)
    		{
    			brand=br.getBrand();
    		}
    	}
    	
    	images=request.getParameter("nam");
    }catch(Exception e){
    	System.out.println(e.getMessage());
    	e.printStackTrace();
    }
        Date date = new Date();       
        Timestamp nousedate = new Timestamp(date.getTime());
        //添加进数据库        
    	Article article=new Article();
        article.setUser_username(username);
        article.setContent(content);
        article.setBrand(catagory);
        article.setType(type);
        article.setTitle(title);
        article.setBrand(brand);
        article.setUp_time(nousedate);
        article.setImage(images);
        ArticleDao ad=new ArticleDao();
    	try{
    		
    		ad.addArticle(article);
    		//重定向
    		response.sendRedirect("fabu_history.jsp");
    	%>
    		
    	<%
    		}catch(Exception e){
    	%>
    		<h2 style="color:red ; font-size:50px">发生错误 : <%=e.getMessage() %></h2>
    		<%
    		}
    		%>
