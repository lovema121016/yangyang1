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
<html lang="zxx">

	<head>

		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<title>社区首页</title>

		<!-- css include -->
		<link rel="stylesheet" type="text/css" href="css/materialize.css">
		<link rel="stylesheet" type="text/css" href="css/icofont.css">
		<link rel="stylesheet" type="text/css" href="css/owl.carousel.min.css">
		<link rel="stylesheet" type="text/css" href="css/owl.theme.default.min.css">

		<!-- my css include -->
		<link rel="stylesheet" type="text/css" href="css/custom-menu.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<link rel="stylesheet" type="text/css" href="css/responsive.css">

	</head>


	<body>
		<div class="thetop"></div>
		<!-- for back to top -->

		<div class='backToTop'>
			<a href="#" class='scroll'>
				<span>T</span>
				<span>O</span>
				<span>P</span>
				<span class="go-up">
					<i class="icofont icofont-long-arrow-up"></i>
				</span>
			</a>
		</div>
		<!-- backToTop -->




		<!-- ==================== header-section Start ==================== -->
		<header id="header-section" class="header-section w100dt navbar-fixed">

			<nav class="nav-extended main-nav">
				<div class="container">
					<div class="row">
						<div class="nav-wrapper w100dt" >
							<div class="logo left">
								<a href="../index.jsp" class="brand-logo">
									<img src="../img/logo1.PNG" style="height:80px; border-radius:100%; overflow:hidden;" alt="brand-logo">
								</a>
							</div>
							<!-- logo -->

							<div>
								<a href="#" data-activates="mobile-demo" class="button-collapse">
									<i class="icofont icofont-navigation-menu"></i>
								</a>
								<ul id="nav-mobile" class="main-menu center-align hide-on-med-and-down">
									<li class="active"><a href="communication.jsp">资讯首页</a></li>
									<li><a href="../index.jsp">国货商品</a></li>
									<li class="dropdown">
										<a href="#">所有文章 <i class="icofont icofont-simple-down"></i></a>
										<ul class="dropdown-container">
										<%
                                           BrandDao bd=new BrandDao();
                                           List<Brand> brands=bd.loadType("护肤品");
                                           for(Brand brand:brands)
                                           {
                                        %>
                                        <li>
                                            <a href="search_article.jsp?article_name=<%=brand.getBrand() %>"><%=brand.getBrand() %></a>
                                        </li>
                                       <%
                                           }
                                       %>
										</ul>
										<!-- /.dropdown-container -->
									</li>
									
									<%
									  if(user.getUsername()==null)
									  {
									%>
									<li class="dropdown">
									    <a href="#">个人中心 <i class="icofont icofont-simple-down"></i></a>
									    <ul class="dropdown-container"> 
									       <li>
									         <a href="../login.jsp">你还未登录,去登录</a>
									       </li>
									   </ul>
									</li>
									<%
									  }
									  else
									  {
									%>
									   <li class="dropdown">
									    <a href="../center/user.jsp">个人中心 <i class="icofont icofont-simple-down"></i></a>
									    <ul class="dropdown-container"> 
									       <li>
									         <a href="../center/user.jsp">基本信息</a>
									       </li>
									       <li>
									         <a href="../center/fabu_article.jsp">发布文章</a>
									       </li>
									       <li>
									         <a href="../center/fabu_history.jsp">发布历史</a>
									       </li>
									       <li>
									         <a href="../center/focus_users.jsp">关注用户</a>
									       </li>
									   </ul>
									</li>
									<%
									  }
									%>
								</ul>
								<!-- /.main-menu -->

								<!-- ******************** sidebar-menu ******************** -->
								
							</div>
							<!-- main-menu -->

							
							<!-- search -->
							

						</div>
						<!-- /.nav-wrapper -->
					</div>
					<!-- row -->
				</div>
				<!-- container -->
			</nav>

		</header>
		<!-- my custom js -->
		

		<script type="text/javascript">
		</script>


	</body>

</html>