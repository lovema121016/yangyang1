<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="user" class="com.model.User" scope="session"/>
<%@page import="com.dao.ArticleDao"%>
<%@page import="com.model.Article"%>
<%@page import="com.dao.BrandDao"%>
<%@page import="com.model.Brand"%>
<%@page import="com.dao.GoodDao"%>
<%@page import="com.model.Good"%>
<%@page import="com.dao.UserDaoImpl"%>
<%@page import="com.dao.ArticleLikeDao"%>
<%@page import="com.model.User"%>
<%@page import="com.dao.Article_comment_Dao"%>
<%@page import="com.model.Article_comment"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Timestamp" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="com.dao.Brand_Top_Dao"%>
<%@page import="com.model.Brand_Top"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.util.Java_Python_test2"%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta content="" name="description">
        <meta content="" name="keywords">
        <meta name="viewort" content="width=device-width, initial-scale=1">
        <meta name="HandheldFriendly" content="true">
        <meta content="telephone=no" name="format-detection">
        <!-- favicon -->
        <link rel="shortcut icon" type="../image/png" href="../favicon.png" />
        <!--[if (gt IE 9)|!(IE)]><!-->
        <!-- custom CSS -->
        <link href="../css/main.css" rel="stylesheet" type="text/css" />
        <!-- END custom CSS -->
        <!--<![endif]-->
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <title>首页</title>
        <style>
             .line-limit-length {
                    overflow: hidden;
                    text-overflow: ellipsis;
                    white-space: nowrap; 
               }
        </style>
    </head>
    <body>
        <!-- Header -->
        <jsp:include page="header.jsp" />
        <!-- END header -->
        <!-- header slider -->
        <div class="slate_gray">
            <div class="container">
                <div class="row header_news_panel">
                    <!-- Tab panes -->
                    <div class="col-sm-8 tab-content tab-content_mob-p0">
                        <div role="tabpanel" class="tab-pane fade in active" id="home">
                            <img src="../img/content/slide1.jpg" alt="main img" class="tab-pane__img">
                            <div class="header_news_text tab-pane__block">
                            <%
                               UserDaoImpl userdao=new UserDaoImpl();
                               List<User> users=userdao.loadAll();
                            %>
                                <p class="tab-pane__category yel_line">泱泱</p>
                                <a class="tab-pane__title">最优国货全在这里</a>
                                <p class="tab-pane__text">目前为止，已有<%=users.size() %>用户都在使用“泱泱”</p>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="profile">
                            <img src="../img/content/slide2.jpg" alt="main img" class="tab-pane__img">
                            <div class="header_news_text tab-pane__block">
                                <p class="tab-pane__category yel_line">泱泱</p>
                                <a class="tab-pane__title">The Visions's Rainbow</a>
                                <p class="tab-pane__text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="messages">
                            <img src="../img/content/slide1.jpg" alt="main img" class="tab-pane__img">
                            <div class="header_news_text tab-pane__block">
                                <p class="tab-pane__category yel_line">People</p>
                                <a class="tab-pane__title">The Visions's Rainbow</a>
                                <p class="tab-pane__text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="settings">
                            <img src="../img/content/slide2.jpg" alt="main img" class="tab-pane__img">
                            <div class="header_news_text tab-pane__block">
                                <p class="tab-pane__category yel_line">People</p>
                                <a class="tab-pane__title">The Visions's Rainbow</a>
                                <p class="tab-pane__text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                            </div>
                        </div>
                    </div>
                    <!-- END Tab panes -->
                    <!-- Nav tabs -->
                    <div class="col-sm-4 news-tabs">
                        <p class="news-tabs__title h2">最新资讯</p>
                        <ul class="news-tabs__nav nav nav-tabs shadow_text" role="tablist">
                            <li role="presentation" class="active">
                                <a href="#home" role="tab" data-toggle="tab">
                                    <span class="time">today, 10:11</span>
                                    百雀羚隔离太好用了吧！
                                </a>
                            </li>
                            <li role="presentation">
                                <a href="#profile" role="tab" data-toggle="tab">
                                    <span class="time">today, 11:22</span>
                                    “泱泱”国货推荐平台被人民日报夸赞
                                 </a>
                            </li>
                            <li role="presentation">
                                <a href="#messages" role="tab" data-toggle="tab">
                                    <span class="time">today, 12:33</span>
                               震惊！李佳琦竟然不知道相宜本草这个潜在优质品牌，口红一哥被质疑品牌感知水平
                                </a>
                            </li>
                            <li role="presentation">
                                <a href="#settings" role="tab" data-toggle="tab">
                                    <span class="time">today, 14:44</span>
                                    著名服装设计师薇娅力挺上海女人老国货品牌
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- END Nav tabs -->
                </div>
            </div>
        </div>
        <!-- END header slider -->
        <div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>
        <!-- top news-->
        <section>
            <!-- top news -->
            <!-- title -->
            <div class="wrap wrap_white">
                <div class="container title">
                    <h1 class="title__h1 underscore">热门·文章</h1>
                </div>
            </div>
            <!-- END title -->
            <div class="wrap wrap_gray pt20">
                <div class="container">
                    <div class="row">
                                  <%
                                       ArticleDao ad=new ArticleDao();
                                       Article_comment_Dao acd=new Article_comment_Dao();
                                       List<Article> articles=ad.loadHot();
                                       int top=1;
                                       for (Article article:articles)
                                       {
                                    	   String[] images=article.getImage().split(";");
                                    	   if(top==1)
                                    	   {
                                    	   List<Article_comment> ac=acd.load(article.getId());
                                    %>
                        <div class="col-sm-6">
                            <div class="thumbnail thumbnail_big">
                                <img src="http://localhost:8080/yangyang/img/article/<%=images[0] %>" style="height:450px" width="560" alt="News">
                                <div class="caption thumbnail__caption">
                                   
                                    <div class="news caption__news">
                                         <%
                                         String []types=article.getType().split(";");
                                         int c=0;
                                         for(String type:types)
                                          {
                            	            if(c==0)
                            	            {
                                        %>
                                        <p class="news__category yellow-line"><%=article.getBrand() %></p>
                                        <%
                            	            }
                            	            c++;
                                          }
                                         
                                        %>
                                        <a href="../detail.jsp?article_id=<%=article.getId() %>" class="news__head"><%=article.getTitle() %></a>
                                        <p class="line-limit-length" style="color:gray" ><%=article.getContent() %> </p>
                                    </div>                                   
                                    <div class="posted">
                                        <span class="posted__date"><%=article.getUp_time() %></span>
                                        <ul class="posted__icon">
                                            <li>
                                                <span>
                                                <i class="icon-comment-empty"></i><%=ac.size() %>
                                            </span>
                                            </li>
                                            <li>
                                                <span>
                                                <i class="icon-eye"></i><%=article.getLook() %>
                                            </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}
                                    	   else
                                    	   {
                                    		   List<Article_comment> ac=acd.load(article.getId());
                                    		   %>
                         <div class="col-sm-3" style="height:370px">
                            <div class="thumbnail thumbnail_small">
                                <a href="news.html" class="thumbnail__link">
                                    <img src="http://localhost:8080/yangyang/img/article/<%=images[0] %>" style="height:170px;float:left" width="270" alt="News">
                                </a>
                                <div class="caption thumbnail__caption">
                                    <div class="news caption__news">
                                        <p class="news__category yellow-line"><%=article.getBrand() %></p>
                                        <a href="../detail.jsp?article_id=<%=article.getId() %>" class="news__link">
                                            <p class="news__text"><%=article.getTitle() %></p>
                                        </a>
                                    </div>
                                    <div class="posted">
                                        <span class="posted__date"><%=article.getUp_time() %></span>
                                        <ul class="posted__icon">
                                            <li>
                                                <span>
                                                <i class="icon-comment-empty"></i><%=ac.size() %>
                                            </span>
                                            </li>
                                            <li>
                                                <span>
                                                <i class="icon-eye"></i><%=article.getLook() %>
                                            </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div> 
                                    		   <%
                                    	   }
                                    	   
                                    	top++;   
                    } %>
                                       
                        
                        
                        
                       
                    </div>
                    
                </div>
                <!-- btn load-->
                <div class="ajax_load">
                    <i class="icon-arrows-cw"></i>Load more
                    <svg width="128" height="40" viewBox="0 0 128 40" xmlns="http://www.w3.org/2000/svg">
                        <rect x='0' y='0' fill='none' width='128' height='40'></rect>
                    </svg>
                </div>
                <!-- END btn load-->
            </div>
            <!-- /container-->
        </section>
        <!-- /top news -->
       
        <section class="wrap wrap_gray">
            <div class="container">
                <div class="row">
                    <div class="col-sm-9">
                        <div class="row">
                            <div class="block-title col-sm-12">
                                <h2 class="block-title__h2">猜你喜欢的文章
                                <a class="block-title__view-all" href="shequ/search_article.jsp?article_name=<% %>" data-hover="See all">查看更多</a>
                            </h2>
                            </div>
                            
                            <%
                          try{
                            if(user.getUsername()==null)
                            {
                          	  %>
                          	  <h1>登录后获取你想要的内容<a href="login.jsp">去登陆</a></h1>
                          	  <%
                            }
                            else
                            {
                            Java_Python_test2 fit2=new Java_Python_test2();
                            String like_id2= fit2.best_fit(user.getId());
                            String [] like2=like_id2.split(";");
                            System.out.println(like_id2);
                            
                            for(String lik:like2)    	 
                            {  
                          	   Article article=ad.load(Integer.valueOf(lik));
                               String[] images=article.getImage().split(";");
                               List<Article_comment> ac=acd.load(article.getId());
                            %>
                            <div class="col-sm-4" style="height:400px">
                                <div class="thumbnail thumbnail_small" style="width:270px;height:370px">
                                    <a href="detail.jsp?article_id=<%=article.getId() %>" class="thumbnail__link">
                                        <img src="http://localhost:8080/yangyang/img/article/<%=images[0] %>"  style="height:200px" alt="News">
                                    </a>
                                    <div class="caption thumbnail__caption">
                                        <div class="news caption__news">
                                            <p class="news__category yellow-line"><%=article.getType() %></p>
                                            <a href="detail.jsp?article_id=<%=article.getId() %>" class="news__link">
                                                <p class="news__text"><%=article.getTitle() %></p>
                                            </a>
                                        </div>
                                        <div class="posted">
                                            <span class="posted__date"><%=article.getUp_time() %></span>
                                            <ul class="posted__icon">
                                                <li>
                                                    <span>
                                                    <i class="icon-comment-empty"></i><%=ac.size() %>
                                                </span>
                                                </li>
                                                <li>
                                                    <span>
                                                    <i class="icon-eye"></i><%=article.getLook() %>
                                                </span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                             }
                            }
                          }catch(Exception e)
                          {
                        	  ArticleLikeDao ald=new ArticleLikeDao();
                        	  List<Article> articless=ald.loadRecommend2(user.getId());
                        	  for(Article article:articless)
                        	  {
                        		  String[] images=article.getImage().split(";");
                        		  List<Article_comment> ac=acd.load(article.getId());
                        	  %>
                        <div class="col-sm-4" style="height:400px">
                                <div class="thumbnail thumbnail_small" style="width:270px;height:370px">
                                    <a href="detail.jsp?article_id=<%=article.getId() %>" class="thumbnail__link">
                                        <img src="http://localhost:8080/yangyang/img/article/<%=images[0] %>" style="height:200px" alt="News">
                                    </a>
                                    <div class="caption thumbnail__caption">
                                        <div class="news caption__news">
                                            <p class="news__category yellow-line"><%=article.getType() %></p>
                                            <a href="detail.jsp?article_id=<%=article.getId() %>" class="news__link">
                                                <p class="news__text"><%=article.getTitle() %></p>
                                            </a>
                                        </div>
                                        <div class="posted">
                                            <span class="posted__date"><%=article.getUp_time() %></span>
                                            <ul class="posted__icon">
                                                <li>
                                                    <span>
                                                    <i class="icon-comment-empty"></i><%=ac.size() %>
                                                </span>
                                                </li>
                                                <li>
                                                    <span>
                                                    <i class="icon-eye"></i><%=article.getLook() %>
                                                </span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        	  <%
                        	  }
                          }finally{}
                            %>
                           
                        </div>
                     
                    </div>
                    <div class="col-sm-3">
                        <div class="block-title">
                            <h2 class="block-title__h2">品牌排行榜</h2>
                        </div>
                        <div class="wrap-redaction wrap-redaction_white">
                        <%
                           Brand_Top_Dao btd=new Brand_Top_Dao();
                           List<Brand_Top> brand_tops=btd.load_top();
                           SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                           String currentDate = dateFormat.format(new Date());//获取当前时间
                           for(Brand_Top top1:brand_tops)
                           {
                        %>
                            <div class="redaction redaction_line">
                                <p class="redaction__category yel_line"><%=top1.getBrand() %></p>
                                <a class="redaction__title">用户收藏该品牌商品数:<%=top1.getFocus_good_number() %></a>
                                <p class="redaction__time">更新时间:<%=currentDate %></p>
                            </div>
                           <%
                           }
                           %>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- All JavaScript libraries -->
		<script src="../js/jquery.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<!-- Custom JavaScript -->
        <script src="../js/main.js"></script>
    </body>
</html>
