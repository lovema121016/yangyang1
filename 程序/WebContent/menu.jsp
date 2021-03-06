<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="user" class="com.model.User" scope="session"/>
<%@page import="com.dao.ArticleDao"%>
<%@page import="com.model.Article"%>
<%@page import="com.dao.BrandDao"%>
<%@page import="com.model.Brand"%>
<%@page import="com.dao.GoodDao"%>
<%@page import="com.model.Good"%>
<%@page import="com.dao.Good_type_dao"%>
<%@page import="com.model.Good_Type"%>
<%@page import="com.dao.UserDaoImpl"%>
<%@page import="com.model.User"%>
<%@page import="com.dao.Article_comment_Dao"%>
<%@page import="com.model.Article_comment"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Timestamp" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
		<title>菜单</title>
		<link href="css/main2.css" rel="stylesheet" type="text/css" />	
        <style type="text/css">
          *{margin: 0;padding: 0;text-decoration: none;list-style-type: none;font-family: Times New Roman;}

img{border:none;}
a{border:none;text-decoration: none;color:#000;}
.border{border:1px solid red;}
.center{margin: 0 auto;}
.w{width: 1226px;margin: 0 auto;}
.fl{float: left;}
.fr{float: right;}
.clear{clear:both;}
.mt20{margin-top: 20px;}
.mt10{margin-top: 10px;}
.ml20{margin-left: 20px;}
.ml40{margin-left: 40px;}
.mr40{margin-right: 40px;}
.mb20{margin-bottom: 20px;}
.border2{border:2px solid #ff6700;}
.ft20{font-size: 20px;}
.ftbc{color: #ff6700;font-weight: bold;}
.pr{padding-right: 40px;}

.h3{font-size: 22px;font-weight: bold;}


/*header*/
header{width: 100%;height: 40px;background: #333}
header .top{width: 1226px;height: 40px;line-height: 40px;}
header .top .left ul li{float: left;font-size: 12px;color: #ccc;}
header .top .left ul li a{display:block;padding:0 8px;font-size: 12px;font-family: Times New Roman;color: #b0b0b0;}
header .top .left ul li a:hover{color:#fff;}
header .top .right ul li{float: left;font-size: 12px;color: #ccc;}
header .top .right ul li a{display:block;padding:0 8px;font-size: 12px;font-family: Times New Roman;color: #b0b0b0;}
header .top .right ul li a:hover{color:#fff;}
header .top .right .gouwuche a{color:#fff;}
header .top .right .gouwuche{margin:0 20px;background: #424242;width: 120px;text-align: center;font-size: 12px;cursor:pointer;background: #ff6700;color: #fff;}

header .top .right .gouwuche:hover{color:#000;background: #666;}
/*banner_x*/
.banner_x {width: 1226px;height: 100px;}
.banner_x .logo{background: url('../image/logo_top.png') no-repeat center center;width: 50px;height: 100px;}
.banner_x .ad_top{width: 180px;height: 100px;background: url('../image/yyymix.gif') no-repeat center center;}
.banner_x .nav ul li{float: left;height: 100px;line-height: 100px;}
.banner_x .nav ul li a{display:inline-block;color: #000;font-size: 16px;padding: 0 10px;}
.banner_x .nav ul li a:hover{color: rgb(255,103,0); }
.banner_x .search{width: 308px;height: 100px;line-height: 100px;}
.banner_x .search .text{width: 250px;height:50px;line-height: 50px;font-size: 12px;margin-top: 25px;border:1px solid #ccc;}
.banner_x .search .text:hover{border-color: #ff6700;}
.banner_x .search .text .shuru{border: none;width: 250px;height: 50px;}
.banner_x .search .submit{width: 50px;height:50px;line-height: 50px;text-align:center;font-size: 12px;margin-top: 25px;border:1px solid #ccc;}
.banner_x .search .submit .sousuo{letter-spacing:3px;text-align:center;width: 50px;height:50px;border: none;background: none;cursor:pointer;}
.banner_x .search .submit:hover{border-color: #ff6700;color:#ff6700;} 
/*banner_y*/
.banner_y{width:1226px;height:460px;background: url('image/banner2.jpg') no-repeat;}
.banner_y .nav{width: 234px;height: 460px;background: rgb(12,12,19);}
.banner_y .nav ul{padding: 20px 0;position:relative;}
.banner_y .nav ul li{display: block;width: 174px;height: 40px;line-height:40px;font-size: 14px;padding: 0 30px;}
.banner_y .nav ul li .pop{width: 800px;height: 460px;background: #fff;position:absolute;left:234px;top:0px;display: none;}
.banner_y .nav ul li:hover .pop{display: block;box-shadow: 2px 3px 5px #ccc; border-top: 1px solid #ccc;}
.banner_y .nav ul li .pop .left{width: 265px;height: 460px;background: #fff;}
.banner_y .nav ul li .pop .left div{margin-bottom: 3px;}
.banner_y .nav ul li .pop .left .xuangou_left{height: 40px;line-height:40px; font-size: 14px;margin-left: 10px;margin-top: 20px;}
.banner_y .nav ul li .pop .left .xuangou_left a{color: #000;}
.banner_y .nav ul li .pop .left .xuangou_left a img{valign:middle;}
.banner_y .nav ul li .pop .left .xuangou_left a span{display: inline-block;margin-left: 10px;font-size: 14px;}
.banner_y .nav ul li .pop .left .xuangou_left a span:hover{color:#ff6700;}
.banner_y .nav ul li .pop .left .xuangou_right{margin-top: 25px;height: 40px;line-height: 40px;}
.banner_y .nav ul li .pop .left .xuangou_right a{display: block;width: 60px;line-height:24px;height: 24px;text-align: center;font-size: 12px;color:#ff6700;border:1px solid #ff6700;}
.banner_y .nav ul li .pop .left .xuangou_right a:hover{display: block;background:#ff6700;color:#fff; }

.banner_y .nav ul li .pop .ctn{width: 265px;height: 460px;}
.banner_y .nav ul li .pop .ctn div{margin-bottom: 3px;}
.banner_y .nav ul li .pop .ctn .xuangou_left{height: 40px;line-height:40px; font-size: 14px;margin-left: 10px;margin-top: 20px;}
.banner_y .nav ul li .pop .ctn .xuangou_left a{color: #000;}
.banner_y .nav ul li .pop .ctn .xuangou_left a img{valign:middle;}
.banner_y .nav ul li .pop .ctn .xuangou_left a span{display: inline-block;margin-left: 10px;font-size: 14px;}
.banner_y .nav ul li .pop .ctn .xuangou_left a span:hover{color:#ff6700;}
.banner_y .nav ul li .pop .ctn .xuangou_right{margin-top: 25px;height: 40px;line-height: 40px;}
.banner_y .nav ul li .pop .ctn .xuangou_right a{display: block;width: 60px;line-height:24px;height: 24px;text-align: center;font-size: 12px;color:#ff6700;border:1px solid #ff6700;}
.banner_y .nav ul li .pop .ctn .xuangou_right a:hover{display: block;background:#ff6700;color:#fff; }

.banner_y .nav ul li .pop .right{width: 265px;height: 460px;margin-right: 5px;}
.banner_y .nav ul li .pop .right div{margin-bottom: 3px;}
.banner_y .nav ul li .pop .right .xuangou_left{height: 40px;line-height:40px; font-size: 14px;margin-left: 10px;margin-top: 20px;}
.banner_y .nav ul li .pop .right .xuangou_left a{color: #000;}
.banner_y .nav ul li .pop .right .xuangou_left a img{valign:middle;}
.banner_y .nav ul li .pop .right .xuangou_left a span{display: inline-block;margin-left: 10px;font-size: 14px;}
.banner_y .nav ul li .pop .right .xuangou_left a span:hover{color:#ff6700;}
.banner_y .nav ul li .pop .right .xuangou_right{margin-top: 25px;height: 40px;line-height: 40px;}
.banner_y .nav ul li .pop .right .xuangou_right a{display: block;width: 60px;line-height:24px;height: 24px;text-align: center;font-size: 12px;color:#ff6700;border:1px solid #ff6700;}
.banner_y .nav ul li .pop .right .xuangou_right a:hover{display: block;background:#ff6700;color:#fff; }

.banner_y .nav ul li:hover{background: #ff6700; }
.banner_y .nav ul li a{display:inline-block;margin-left:10px;color: #fff;}
.tlinks{text-indent:-9999px;height:0;line-height:0;font-size:0;overflow:hidden;}
</style>
        <!-- =====  CSS  ===== -->
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
                                    <a href="index.jsp">首页</a>
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="#">化妆品</a>
                                    <ul class="wsmenu-submenu">
                                        <%
                                        BrandDao bd=new BrandDao();
                                        try
                                        {
                                           
                                           List<Brand> brands=bd.loadType("护肤品");
                                           for(Brand brand:brands)
                                           {
                                        %>
                                        <li>
                                            <a href="brand_result.jsp?brand=<%=brand.getBrand() %>"><%=brand.getBrand() %></a>
                                        </li>
                                       <%
                                           }
                                        }catch (Exception e)//当捕捉的异常与代码发生的异常相同时，程序可继续执行catch里的代码，括号内放的是异常的对象
                                        { 
                                        	String a="login.jsp";
                                        	PrintWriter ou = response.getWriter();  //获取输出流
                                        	ou.println("<script>window.location.href='error.jsp?id="+a+"'</script>");
                                        	ou.close();
                                        } finally
                                        { 
                                        	
                                        }
                                       %>
                                    </ul>
                                    
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="#">运动</a>
                                    <ul class="wsmenu-submenu">
                                        <%
                                           List<Brand> brands1=bd.loadType("运动");
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
                                    <a href="shequ/communication.jsp">资讯社区</a>
                                </li>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="pai_top.jsp">排行榜</a>
                                </li>
                                <%
                                    if(user.getId() != 0)
                                    {
                                %>
                                <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="think_like.jsp">猜你喜欢</a>
                                </li>
                                <%
                                    }
                                %>
                               <li>
                                    <span class="wsmenu-click"></span>
                                    <a href="center/user.jsp">个人中心
        							<span class="arrow"></span>
                                </a>
                                    <%
                                    if(user.getId() != 0)
                                    {
                                    %>
                                    <ul class="wsmenu-submenu">
                                        <li>
                                            <a href="center/user.jsp">基本信息</a>
                                        </li>
                                        <li>
									         <a href="center/fabu_article.jsp">发布文章</a>
									       </li>
									       <li>
									         <a href="center/fabu_history.jsp">发布历史</a>
									       </li>
									       <li>
									         <a href="center/focus_users.jsp">关注用户</a>
									       </li>
                                    </ul>
                                    <%
                                    }
                                    else
                                    {
                                    %>
                                    <ul class="wsmenu-submenu">
                                        <li>
                                            <a href="login.jsp">你还未登录,去登录</a>
                                        </li>
                                    </ul>
                                    <%
                                    }
                                    %>
                                </li>
                                <li class="navbar-right hidden-xs">
                                    <form class="navbar-form" method="post" action="search.jsp" role="search">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="good_name" placeholder="查找商品">
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
	<!--end header -->

<!-- start banner_x -->
		<div class="banner_x center">
			<a href="./index.html" target="_blank"><div class="logo fl"></div></a>
			<a href=""><div class="ad_top fl"></div></a>
			<div class="nav fl">
				<ul>
					<li><a href="./liebiao.html" target="_blank"></a></li>
					<li><a href=""></a></li>
					<li><a href=""></a></li>
					<li><a href=""></a></li>
					<li><a href=""></a></li>
					<li><a href=""></a></li>
					<li><a href=""></a></li>
					<li><a href=""></a></li>
					<li><a href=""></a></li>
				</ul>
			</div>
		
		</div>
<!-- end banner_x -->
        <hr>
	<!-- start banner_y -->
		<div class="banner_y center" style="width:68.5%">
			<div class="nav">				
				<ul style="padding: 20px 0;position:relative;">
				 <%
				 
				   Good_type_dao gtd=new Good_type_dao();
				   List<String> middles=gtd.loadMidlle();
				   for(String middle:middles)
				   {
				 %>
					<li style="display: block;width: 234px;height: 40px;line-height:40px;font-size: 14px;padding: 0 30px;">
						<a href=""><%=middle %></a>
						<a href=""></a>
						<div class="pop">
							<div class="left fl">
							<%
							   List<Good_Type> types=gtd.load(middle);
							   int x=0;
							   for(Good_Type gt:types)
							   {
								   if(x/6==0)
								   {
							%>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="./image/xm6_80.png" alt=""></div>
											<span class="fl"><%=gt.getSmall_type() %></span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="search.jsp?catagory=<%=gt.getSmall_type() %>" target="_blank">详情</a></div>
									<div class="clear"></div>
								</div>
								<%
								   }
								   x++;
							   
							   }
								%>						
							</div>
							
							<div class="ctn fl">
							<%
						     x=0;
							 for(Good_Type gt:types)
							   {
								   if(x/6==1)
								   {
							%>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="./image/xm5-80.jpg" alt=""></div>
											<span class="fl"><%=gt.getSmall_type() %></span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="search.jsp?catagory=<%=gt.getSmall_type() %>">详情</a></div>
									<div class="clear"></div>
								</div>
								<%
								   }
								   x++;
							   }
								%>
								
							</div>
							<div class="right fl">
							  <%
						     x=0;
							 for(Good_Type gt:types)
							   {
								   if(x/6==2)
								   {
							  %>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="./image/compare.jpg" alt=""></div>
											<span class="fl"><%=gt.getSmall_type() %></span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="search.jsp?catagory=<%=gt.getSmall_type() %>">详情</a></div>
									<div class="clear"></div>
								</div>
								<%
								   }
								   x++;
							   }
								%>
								
							</div>
							<div class="clear"></div>
						</div>
					</li>
					<%
				   }
					%>
					
					
				
				</ul>
			</div>
		
		</div>	
		
	
	</body>
</html>