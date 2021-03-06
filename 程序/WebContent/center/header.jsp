<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.dao.BrandDao"%>
<%@page import="com.model.Brand"%>
<jsp:useBean id="user" class="com.model.User" scope="session"/>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="../css/main.css" rel="stylesheet" type="text/css" />	
</head>
<body>
   <header id="header" class="header" style="height:150px">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="wrap-logo">
                                <a href="../index.jsp" class="brand-logo">
									<img src="../img/logo1.PNG" style="height:80px; border-radius:100%; overflow:hidden;" alt="brand-logo">
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
                                        <em>未登录</em>
                                        <div class="weather__city__list">
                                            <ul>
                                                <li class="active">
                                                    <a href="login.jsp">去登录</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <%
                                       }
                                       else
                                       {
                                    	   %>
                                    	<em>已登录</em>
                                    	<div class="weather__city__list">
                                            <ul>
                                                <li class="active">
                                                    <a href="Logout">退出登录</a>
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
                                    <p class="exchange__name">国货潮</p>
                                    <p class="exchange__course">
                                        ·<span>护肤品</span>·<span>穿搭</span>
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
                                    <a href="../index.jsp">首页</a>
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="category.html">化妆品</a>
                                    <ul class="wsmenu-submenu">
                                        <%
                                           BrandDao bd=new BrandDao();
                                           List<Brand> brands=bd.loadType("护肤品");
                                           for(Brand brand:brands)
                                           {
                                        %>
                                        <li>
                                            <a href="../brand_result.jsp?brand=<%=brand.getBrand() %>"><%=brand.getBrand() %></a>
                                        </li>
                                       <%
                                           }
                                       %>
                                    </ul>
                                    
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="category.html">运动</a>
                                    <ul class="wsmenu-submenu">
                                        <%
                                           List<Brand> brands1=bd.loadType("运动");
                                           for(Brand brand:brands1)
                                           {
                                        %>
                                        <li>
                                            <a href="../brand_result.jsp?brand=<%=brand.getBrand() %>"><%=brand.getBrand() %></a>
                                        </li>
                                       <%
                                           }
                                       %>
                                    </ul>
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="../shequ/communication.jsp">资讯社区</a>
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="../pai_top.jsp">排行榜</a>
                                </li>
                                 <%
                                    if(user.getUsername()!=null)
                                    {
                                    %>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="../think_like.jsp">猜你喜欢</a>
                                </li>
                                <%
                                    }
                                %>
                               <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="user.jsp">个人中心
        							<span class="arrow"></span>
                                </a>
                                    <%
                                    if(user.getUsername()!=null)
                                    {
                                    %>
                                    <ul class="wsmenu-submenu">
                                        <li>
                                            <a href="user.jsp">基本信息</a>
                                        </li>
                                        <li>
									         <a href="fabu_article.jsp">发布文章</a>
									       </li>
									       <li>
									         <a href="fabu_history.jsp">发布历史</a>
									       </li>
									       <li>
									         <a href="focus_users.jsp">关注用户</a>
									       </li>
                                    </ul>
                                    <%
                                    }
                                    else
                                    {
                                    %>
                                    <ul class="wsmenu-submenu">
                                        <li>
                                            <a href="../login.jsp">你还未登录,去登录</a>
                                        </li>
                                    </ul>
                                    <%
                                    }
                                    %>
                                </li>
                                <li class="navbar-right hidden-xs">
                                    <form class="navbar-form" role="search">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="查找文章">
                                        </div>
                                        <button type="submit" class="btn btn-search">
                                            <i class="icon-search"></i>
                                            <br/>查找
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
</body>
</html>