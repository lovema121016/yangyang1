<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="user" class="com.model.User" scope="session"/>
<%@page import="com.dao.ArticleDao"%>
<%@page import="com.model.Article"%>
<%@page import="com.dao.BrandDao"%>
<%@page import="com.model.Brand"%>
<%@page import="com.dao.GoodDao"%>
<%@page import="com.model.Good"%>
<%@page import="com.dao.Article_comment_Dao"%>
<%@page import="com.model.Article_comment"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Timestamp" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />	
</head>
<body>
   <!-- start header -->
		 <header id="header" class="header">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="wrap-logo">
                                <a href="index.jsp" class="brand-logo">
									<img src="img/logo1.PNG" style="height:80px; border-radius:100%; overflow:hidden;" alt="brand-logo">
								</a>
                            </div>
                        </div>
                        <div class="col-sm-offset-2 col-md-offset-5 col-sm-6 col-md-4 hidden-xs">
                            <div class="col-xs-4 col-sm-5">
                                <div class="weather">
                                    <div class="weather__temperature">
                                        <span class="icon-sun"></span>
                                        <em class="active">+8 C</em>
                                        <em>+2 C</em>
                                        <em>+3 C</em>
                                    </div>
                                    <div class="weather__city">
                                        <%
                                       if(user.getId() == 0)
                                       {
                                     %>
                                        <em>?????????</em>
                                        <div class="weather__city__list">
                                            <ul>
                                                <li class="active">
                                                    <a href="login.jsp">?????????</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <%
                                       }
                                       else
                                       {
                                    	   %>
                                    	<em>?????????</em>
                                    	<div class="weather__city__list">
                                            <ul>
                                                <li class="active">
                                                    <a href="Logout">????????????</a>
                                                </li>
                                            </ul>
                                        </div>
                                    	   <%
                                       }
                                        %>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-7">
                                <div class="exchange">
                                    <p class="exchange__name">?????????</p>
                                    <p class="exchange__course">
                                        ??<span>?????????</span>??<span>??????</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="wsmenucontent overlapblackbg"></div>
            <div class="wsmenuexpandermain slideRight">
                <a id="navToggle" class="animated-arrow slideLeft">
                    <span></span>
                </a>
            </div>
            <div class="header_down">
                <div class="container">
                    <div class="wrapper clearfix bigmegamenu">
                        <!--Main Menu HTML Code-->
                        <nav class="wsmenu slideLeft clearfix">
                            <ul class="mobile-sub wsmenu-list">
                                <li class="visible-xs">
                                    <form class="navbar-form mob_search" role="search">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Search">
                                        </div>
                                        <button type="submit" class="btn btn-search">
                                            <i class="icon-search"></i>
                                        </button>
                                    </form>
                                </li>

                                <li class="active">
                                    <span class="wsmenu-click"></span>
                                    <a href="index.jsp">??????</a>
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="#">?????????</a>
                                    <ul class="wsmenu-submenu">
                                        <%
                                           BrandDao bd=new BrandDao();
                                           List<Brand> brands=bd.loadType("?????????");
                                           for(Brand brand:brands)
                                           {
                                        %>
                                        <li>
                                            <a href="brand_result.jsp?brand=<%=brand.getBrand() %>"><%=brand.getBrand() %></a>
                                        </li>
                                       <%
                                           }
                                       %>
                                    </ul>
                                    
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="#">??????</a>
                                    <ul class="wsmenu-submenu">
                                        <%
                                           List<Brand> brands1=bd.loadType("??????");
                                           for(Brand brand:brands1)
                                           {
                                        %>
                                        <li>
                                            <a href="brand_result.jsp?brand=<%=brand.getBrand() %>"><%=brand.getBrand() %></a>
                                        </li>
                                       <%
                                           }
                                       %>
                                    </ul>
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="shequ/communication.jsp">????????????</a>
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="pai_top.jsp">?????????</a>
                                </li>
                                <%
                                    if(user.getUsername()!=null)
                                    {
                                    %>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="think_like.jsp">????????????</a>
                                </li>
                                <%
                                    }
                                %>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="center/user.jsp">????????????
        							<span class="arrow"></span>
                                </a>
                                    <%
                                    if(user.getId() != 0)
                                    {
                                    %>
                                    <ul class="wsmenu-submenu">
                                        <li>
                                            <a href="center/user.jsp">????????????</a>
                                        </li>
                                        <li>
									         <a href="center/fabu_article.jsp">????????????</a>
									       </li>
									       <li>
									         <a href="center/fabu_history.jsp">????????????</a>
									       </li>
									       <li>
									         <a href="center/focus_users.jsp">????????????</a>
									       </li>
                                    </ul>
                                    <%
                                    }
                                    else
                                    {
                                    %>
                                    <ul class="wsmenu-submenu">
                                        <li>
                                            <a href="login.jsp">???????????????,?????????</a>
                                        </li>
                                    </ul>
                                    <%
                                    }
                                    %>
                                </li>
                                <li class="navbar-right hidden-xs">
                                    <form class="navbar-form" method="post" action="search.jsp" role="search">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="good_name" placeholder="????????????">
                                        </div>
                                        <button type="submit" class="btn btn-search">
                                            <i class="icon-search"></i>
                                            <br/>??????
                                        </button>
                                    </form>
                                </li>
                                <li>
                                    <div class="visible-xs col-sm-offset-5 col-sm-4">
                                        <div class="col-sm-5">
                                            <div class="weather">
                                                <div class="weather__temperature">
                                                    <span class="icon-sun"></span>
                                                    <em>+8 C</em>
                                                </div>
                                                <div class="weather__city">
                                                    <em>London</em>
                                                    <div class="weather__city__list">
                                                        <ul>
                                                            <li class="active">
                                                                <a href="#">London</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">Moscow</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">Kiev</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-7">
                                            <div class="exchange">
                                                <p class="exchange__name">Central Bank Rate</p>
                                                <p class="exchange__course">
                                                    $<span>32.32</span>&#8364;<span>28.23</span>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </nav>
                        <!--Menu HTML Code-->
                    </div>
                </div>
            </div>
        </header>
	<!--end header -->
</body>
</html>