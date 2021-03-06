<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="user" class="com.model.User" scope="session"/>
<%@page import="com.dao.ArticleDao"%>
<%@page import="com.model.Article"%>
<%@page import="com.dao.BrandDao"%>
<%@page import="com.model.Brand"%>
<%@page import="com.dao.GoodDao"%>
<%@page import="com.model.Good"%>
<%@page import="com.dao.GoodLikeDao"%>
<%@page import="com.model.GoodLike"%>
<%@page import="com.dao.UserDaoImpl"%>
<%@page import="com.model.User"%>
<%@page import="com.dao.Article_comment_Dao"%>
<%@page import="com.model.Article_comment"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Page"%>
<%@page import="java.sql.Timestamp" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.model.Page"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>发布历史</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Google fonts - Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700">
    <!-- owl carousel-->
    <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.theme.default.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="../css/user/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="../css/user/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="favicon.png">
	<!-- CSS Files -->
	<!-- CSS Just for demo purpose, don't include it in your project -->
  </head>
  <body>
    <!-- navbar-->
    <!-- =====  HEADER START  ===== -->
    <!-- Header -->
    <jsp:include page="header.jsp" />
    
    <!--
    *** FOOTER ***
    _________________________________________________________
    -->
     
    <!-- /#footer-->
    <!-- *** FOOTER END ***-->
    <%
       int user_id=Integer.valueOf(request.getParameter("user_id"));
       //int user_id=104975;
       UserDaoImpl userdao=new UserDaoImpl();
       User use=userdao.load(user_id);
       
       //查询用户的所有文章并分页
       ArticleDao ad=new ArticleDao();
       //List<Article> articles=ad.loadUser(use.getUsername());
       Article_comment_Dao acd=new Article_comment_Dao();
       int pageIndex = 1;
       int pageSize = 3;
       try{
           pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
       }catch(Exception e){
       }
       Page pager=null;
       pager = ad.load_article(use.getUsername(),pageIndex, pageSize);
       List<Article> articles = pager.getDatas();
    %>
    <div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <!-- breadcrumb-->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#"><%=use.getNickname() %></a></li>
                  <li aria-current="page" class="breadcrumb-item active">动态</li>
                </ol>
              </nav>
            </div>
          </div>
          <div class="row">
            <!--
            *** LEFT COLUMN ***
            _________________________________________________________
            -->
            <div id="blog-listing" class="col-lg-9">
              <%
                for(Article article:articles)
                {
                	List<Article_comment> ac=acd.load(article.getId());
              %>
              <!-- post-->
              <div class="post">
                <h2><a href="post.html"><%=article.getTitle() %></a></h2>
                <p class="author-category">品牌: <a href="../brand_result.jsp?brand=<%=article.getBrand() %>"><%=article.getBrand() %></a></p>
                <hr>
                <p class="date-comments"><a href=""><i class="fa fa-calendar-o"></i> <%=article.getUp_time() %></a><a href=""><i class="fa fa-comment-o"></i><%=ac.size() %></a></p>
                <div class="image"><a href="../detail.jsp?article_id=<%=article.getId() %>"><img src="<%=article.getImage() %>" alt="Example blog post alt" class="img-fluid"></a></div>
                <p class="intro" style="width:95%; overflow:hidden; white-space:nowrap; text-overflow:ellipsis;"><%=article.getContent() %></p>
                <p class="read-more"><a href="../detail.jsp?article_id=<%=article.getId() %>" class="btn btn-primary">查看详情</a></p>
              </div>
              <%
                }
              %>
              <div class="pager d-flex justify-content-between">
              <%
                int totalPage = pager.getTotalPage();
                if(pageIndex==0)
                {
                %>
                <div class="previous disabled"><a href="" class="btn btn-outline-secondary disabled">← 前一页</a></div>
                <%
                }
                if(pageIndex > 0){
              %>
                <div class="previous"><a href="user_article.jsp?pageIndex=<%=pageIndex-1 %>&user_id=<%=use.getId() %>" class="btn btn-outline-primary">← 前一页</a></div>
                <%
                }
                if( pageIndex < totalPage){
                %>
                <div class="next"><a href="user_article.jsp?pageIndex=<%=pageIndex+1 %>&user_id=<%=use.getId() %>" class="btn btn-outline-primary">下一页 →</a></div>
                <%
                }
                if(pageIndex==totalPage)
                {
                %>
                <div class="next disabled"><a href="" class="btn btn-outline-secondary disabled">下一页 →</a></div>
                <%
                }
                %>
              </div>
            </div>
            <!-- /.col-lg-9-->
            <!-- *** LEFT COLUMN END ***-->
            
            <div class="col-lg-3">
              <!--
              *** BLOG MENU ***
              _________________________________________________________
              -->
              <div class="card sidebar-menu mb-4">
                <div class="card-header">
                  <h3 class="h4 panel-title">用户</h3>
                </div>
                <div class="card-body">
                  <ul class="nav flex-column nav-pills">
                    <li><a href="#" class="nav-link active">文章动态</a></li>
                    <li><a href="his_focus.jsp?user_id=<%=user_id %>" class="nav-link">他的关注</a></li>
                  </ul>
                </div>
              </div>
              <!-- /.col-lg-3-->
              <!-- *** BLOG MENU END ***-->
              <div class="banner"><a href="#"><img src="../images/header/<%=use.getImage() %>" alt="sales 2014" class="img-fluid"></a></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--
    *** COPYRIGHT ***
    _________________________________________________________
    -->
    
    <!-- *** COPYRIGHT END ***-->
    <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.js"></script>
    <script src="../js/user/front.js"></script>
   
  </body>
</html> 