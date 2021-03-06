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
<%@page import="com.dao.Brand_Top_Dao"%>
<%@page import="com.model.Brand_Top"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <title>品牌文章查询结果</title>
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
       
        <!-- /top news -->
       
        <section class="wrap wrap_gray">
            <div class="container">
                <div class="row">
                    <div class="col-sm-9">
                        <div class="row">
                            <div class="block-title col-sm-12">
                                <h2 class="block-title__h2">商品排行榜
                                <a class="block-title__view-all" href="search.jsp" data-hover="See all">查看更多</a>
                            </h2>
                            </div>
                            <%
                            GoodDao gd=new GoodDao();
                            List<Good> good_mosts=gd.loadGood();
                            int i=1;
                            for(Good good:good_mosts)    	 
                           {
                            %>
                            <div class="col-sm-4" style="height:400px">
                                <div class="thumbnail thumbnail_small" style="width:270px;height:390px">
                                    <a href="detail2.jsp?article_id=<%=good.getId() %>" class="thumbnail__link">
                                        <img src="http://localhost:8080/yangyang/img/good/<%=good.getImage() %>" style="height:200px" alt="News">
                                    </a>
                                    <div class="caption thumbnail__caption">
                                        <div class="news caption__news">
                                            <p class="news__category yellow-line">Top&nbsp;&nbsp;<%=i %></p>
                                            <a href="detail2.jsp?article_id=<%=good.getId() %>" class="news__link">
                                                <p class="news__text"><%=good.getName() %></p>
                                            </a>
                                        </div>
                                         <div class="redaction redaction_line">
                                            <a class="redaction__title">评论数:<%=good.getComment_number() %></a>
                                            <p class="redaction__text">好评率:<%=good.getGood_rate() %></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                            i++;
                           }
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
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<!-- Custom JavaScript -->
        <script src="js/main.js"></script>
    </body>
</html>
