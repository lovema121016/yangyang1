<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="user" class="com.model.User" scope="session"/>
<%@page import="com.dao.ArticleDao"%>
<%@page import="com.model.Article"%>
<%@page import="com.dao.BrandDao"%>
<%@page import="com.model.Brand"%>
<%@page import="com.dao.GoodDao"%>
<%@page import="com.dao.GoodLikeDao"%>
<%@page import="com.dao.ArticleLikeDao"%>
<%@page import="com.model.Good"%>
<%@page import="com.dao.Article_comment_Dao"%>
<%@page import="com.model.Article_comment"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Timestamp" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="com.dao.Brand_Top_Dao"%>
<%@page import="com.model.Brand_Top"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.util.Java_Python_test"%>
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
        <link rel="shortcut icon" type="image/png" href="favicon.png" />
        <!--[if (gt IE 9)|!(IE)]><!-->
        <!-- custom CSS -->
        <link href="css/main.css" rel="stylesheet" type="text/css" />
        <!-- END custom CSS -->
        <!--<![endif]-->
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <title>猜你喜欢</title>
        <style>
             .line-limit-length {
                    overflow: hidden;
                    text-overflow: ellipsis;
                    white-space: nowrap; 
               }
        </style>
        <script type="text/javascript">
        $(function () {
            var pageStart = 1;
            var pageCounter = 10;
            var id = $("#convergeId").val();
            /*首次加载*/
            userJoinList(pageStart, pageCounter);
         
            function userJoinList(nextPage, pageSize) {
                $.ajax({
                    type: 'post',
                    url: app.base + 'xxx' + id,
                    data: {"pageView.currentPage": nextPage, "pageView.pageSize": pageSize},
                    dataType: 'json',
                    success: function (reponse) {
                        // console.log(reponse);
                        // alert(reponse.voList.length);
                        var data = reponse.voList;
                        $("#loanCurrentPage").val(reponse.currentPage);
                        var result = '';
                        for (var i = 0; i < data.length; i++) {
                            result += '<tr><td>' + data[i].rownum_ + '</td> <td>' + data[i].userId + '</td> <td>' + data[i].joinamount + '</td> <td>' + data[i].joinDate + '</td>  </tr>'
                        }
                        $('#userListTable tbody').append(result);
                        /*隐藏more*/
                        if (nextPage == reponse.pageCount) {
                            $(".js-load-more").hide();
                        } else {
                            $(".js-load-more").show();
                        }
                    }
                });
            }
         
            $("#userJoinListM").click(function () {
                var currentPage = $("#loanCurrentPage").val();
                var nextPage = parseInt(currentPage) + 1;
                // alert(currentPage+'-'+nextPage);
                userJoinList(nextPage, 10);
            });
        });
        </script>
    </head>
    <body>
        <!-- Header -->
      <jsp:include page="header.jsp" />
        <!-- END header -->

        <!-- top news-->
        <section>
            <!-- top news -->
            <!-- title -->
           
            <!-- END title -->
            <div class="wrap wrap_gray pt20">
                <div class="container">
                                  
                        
                    <div class="row">
                   <div class="block-title col-sm-12">
                                <h2 class="block-title__h2">猜你喜欢商品
                                <a class="block-title__view-all" href="shequ/search_article.jsp?article_name=" data-hover="See all">查看更多</a>
                            </h2>
                   </div>
                  <%
                  GoodDao gd=new GoodDao();
                  try
                  {
                   
                  if(user.getUsername()==null)
                  {
                	  %>
                	  <h1>登录后获取你想要的内容<a href="login.jsp">去登陆</a></h1>
                	  <%
                  }
                  else
                  {
                  Java_Python_test fit=new Java_Python_test();
                  String like_id= fit.best_fit(user.getId());
                  String [] like=like_id.split(";");
                  System.out.println(like_id);
                  for(String lik:like)    	 
                  {  
                	  Good good=gd.load(Integer.valueOf(lik));
                %>
                         <div class="col-sm-3" style="height:400px">
                            <div class="thumbnail thumbnail_small">
                                <a href="detail2.jsp?article_id=<%=good.getId() %>" class="thumbnail__link">
                                    <img src="http://localhost:8080/yangyang/img/good/<%=good.getImage() %>" style="height:230px;weight:24%;float:left"  alt="News">
                                </a>
                                <div class="caption thumbnail__caption">
                                    <div class="news caption__news">
                                        <i class="icon-play"></i>
                                        <p class="news__category yellow-line"><%=good.getBrand() %></p>
                                        <a href="detail2.jsp?article_id=<%=good.getId() %>" class="news__link">
                                            <p class="news__text"><%=good.getName() %></p>
                                        </a>
                                    </div>
                                    <div class="posted">
                                        <span class="posted__date">today, 12:37</span>
                                        <ul class="posted__icon">
                                            <li>
                                                <span>
                                                <i class="icon-comment-empty"></i><%=good.getComment_number() %>
                                            </span>
                                            </li>
                                            <li>
                                                <span>
                                                <i class="icon-eye"></i><% %>
                                            </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}
                  }
                  }catch(Exception e)
                  {
                	  GoodLikeDao gld=new GoodLikeDao();
                	  List<Good> goodss=gld.loadRecomment2(user.getId());
                	  for(Good good:goodss)
                	  {
                	  %>
                    <div class="col-sm-3" style="height:400px">
                            <div class="thumbnail thumbnail_small">
                                <a href="detail2.jsp?article_id=<%=good.getId() %>" class="thumbnail__link">
                                    <img src="http://localhost:8080/yangyang/img/good/<%=good.getImage() %>" style="height:230px;weight:24%;float:left"  alt="News">
                                </a>
                                <div class="caption thumbnail__caption">
                                    <div class="news caption__news">
                                        <i class="icon-play"></i>
                                        <p class="news__category yellow-line"><%=good.getBrand() %></p>
                                        <a href="detail2.jsp?article_id=<%=good.getId() %>" class="news__link">
                                            <p class="news__text"><%=good.getName() %></p>
                                        </a>
                                    </div>
                                    <div class="posted">
                                        <span class="posted__date">today, 12:37</span>
                                        <ul class="posted__icon">
                                            <li>
                                                <span>
                                                <i class="icon-comment-empty"></i><%=good.getComment_number() %>
                                            </span>
                                            </li>
                                            <li>
                                                <span>
                                                <i class="icon-eye"></i><% %>
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
                <!-- btn load-->
                <div class="ajax_load">
                    <i class="icon-arrows-cw"></i>加载更多
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
                            ArticleDao ad=new ArticleDao();
                            Article_comment_Dao acd=new Article_comment_Dao();
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
                           for(Brand_Top top1:brand_tops)
                           {
                        	   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                               String currentDate = dateFormat.format(new Date());//获取当前时间
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
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<!-- Custom JavaScript -->
        <script src="js/main.js"></script>
    </body>
</html>
