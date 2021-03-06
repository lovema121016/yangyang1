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
<%@page import="com.model.User"%>
<%@page import="com.dao.Article_comment_Dao"%>
<%@page import="com.model.Article_comment"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Timestamp" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.model.Page"%>
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
               /* CSS 翻页代码 */ 
DIV.tres { 
PADDING-RIGHT: 7px; PADDING-LEFT: 7px; FONT-WEIGHT: bold; 
FONT-SIZE: 13.2pt; PADDING-BOTTOM: 7px; MARGIN: 3px; 
PADDING-TOP: 7px; FONT-FAMILY: Arial, Helvetica, sans-serif; TEXT-ALIGN: center 
} 
DIV.tres A { 
BORDER-RIGHT: #d9d300 2px solid; PADDING-RIGHT: 5px;
 BORDER-TOP: #d9d300 2px solid; PADDING-LEFT: 5px; PADDING-BOTTOM: 2px; 
MARGIN: 2px; BORDER-LEFT: #d9d300 2px solid; COLOR: #fff; PADDING-TOP: 2px;
 BORDER-BOTTOM: #d9d300 2px solid; BACKGROUND-COLOR: #d90; TEXT-DECORATION: none 
} 
DIV.tres A:hover { 
BORDER-RIGHT: #ff0 2px solid; BORDER-TOP: #ff0 2px solid; 
BORDER-LEFT: #ff0 2px solid; COLOR: #000; BORDER-BOTTOM: #ff0 2px solid;
 BACKGROUND-COLOR: #ff0 
} 
DIV.tres A:active { 
BORDER-RIGHT: #ff0 2px solid; BORDER-TOP: #ff0 2px solid; 
BORDER-LEFT: #ff0 2px solid; COLOR: #000; 
BORDER-BOTTOM: #ff0 2px solid; BACKGROUND-COLOR: #ff0 
} 
DIV.tres SPAN.current { 
BORDER-RIGHT: #fff 2px solid; PADDING-RIGHT: 5px; 
BORDER-TOP: #fff 2px solid; PADDING-LEFT: 5px; FONT-WEIGHT: bold;
 PADDING-BOTTOM: 2px; MARGIN: 2px; BORDER-LEFT: #fff 2px solid;
 COLOR: #000; PADDING-TOP: 2px; BORDER-BOTTOM: #fff 2px solid 
} 
DIV.tres SPAN.disabled { 
DISPLAY: none 
}



.container1 {
    height: 70px;
    width: 800px;
    margin: 100px auto 0 auto;
}
.parent1 {
    position: relative;
}
.search1 {
    width: 320px;
    height: 40px;
    border-radius: 18px;
    outline: none;
    border: 1px solid #ccc;
    padding-left: 20px;
    position: absolute;
}
.btn1 {
    height: 35px;
    width: 35px;
    position: absolute;
    background: url("img/sousuo.png") no-repeat ;
    top: 6px;
    left: 780px;
    border: none;
    outline: none;
    cursor: pointer;
}
        </style>
    </head>
    <body>
        <!-- Header -->
        <jsp:include page="header.jsp" />
        <!-- END header -->
        
        
        <!-- 搜索框 -->
        <%
                                   request.setCharacterEncoding("utf-8");
                                   String article_name=request.getParameter("article_name");
                                   if(article_name==null||article_name.equals(""))
                                   {
                                	   article_name="";
                                   }
         %>
        <div class="container1">
          <form  method="post" action="search_article.jsp" class="parent1">
        <%
            if(article_name=="")
             {
        %>
           <input type="text" name="article_name" class="search1" placeholder="查找文章">
        <%
             }
         else
             {
           %>
              <input type="text" class="search1" name="article_name" placeholder="查找文章"  value="<%=article_name %>">
             <%
            }
             %>
           <input type="button" name="" id="" class="btn1">
          </form>
        </div>
        
        <!-- top news-->
        <section>
            <!-- top news -->
            <!-- title -->
            <div class="wrap wrap_white">
                <div class="container title">
                       <%
                                           if(article_name.equals("")==false)
                                           {
                                        %>
                                           <h1 class="title__h1 underscore"><%=article_name %>查询结果</h1>
                                            <%
                                           }
                                           else
                                           {
                                        	   %>
                                          <h1 class="title__h1 underscore">所有文章</h1>                                        	   <%
                                           }
                                            %>
                </div>
            </div>
            <!-- END title -->
            <div class="wrap wrap_gray pt20">
                <div class="container">
                                  
                        
                    <div class="row">
                    <%
                    int pageIndex = 1;
                    int pageSize = 12;
                    try{
                        pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
                    }catch(Exception e){
                    }
                                       Page pager=null;
                                       ArticleDao ad=new ArticleDao();
                                       Article_comment_Dao acd=new Article_comment_Dao();
                                       List<Article> articles=null;
                                       if(article_name.equals(""))
                                       {
                                    	   pager = ad.load(pageIndex, pageSize);
                                           articles = pager.getDatas();
                                       }
                                       else
                                       {
                                    	   pager = ad.load_article_name(article_name,pageIndex, pageSize);
                                           articles = pager.getDatas();
                                       }
                                       for (Article article:articles)
                                       {
                                    	   String[] images=article.getImage().split(";");
                                    	   List<Article_comment> ac=acd.load(article.getId());
                                    %>
                         <div class="col-sm-3" style="height:360px">
                            <div class="thumbnail thumbnail_small">
                                <a href="../detail.jsp?article_id=<%=article.getId() %>" class="thumbnail__link">
                                    <img src="http://localhost:8080/yangyang/img/article/<%=images[0] %>" style="height:170px;weight:24%;float:left"  alt="News">
                                </a>
                                <div class="caption thumbnail__caption">
                                    <div class="news caption__news">
                                        <i class="icon-play"></i>
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
                        <%} %>
                        
                      
                    
                    </div>
                </div>
                <!-- btn load-->
             <div class="tres"> 
<span class="disabled">&lt; </span>
<a href="search_article.jsp?pageIndex=1&article_name=<%=article_name %>">首页</a>
<%
                    int totalPage = pager.getTotalPage();
                    if(pageIndex > 1){
                %>
                    <a href="search_article.jsp?pageIndex=<%=pageIndex-1 %>&article_name=<%=article_name %>">上一页</a>
                <%
                    }
                %>
<a href="search_article.jsp?pageIndex=2&article_name=<%=article_name %>">2</a>
<a href="search_article.jsp?pageIndex=3&article_name=<%=article_name %>">3</a>...
<a href="search_article.jsp?pageIndex=<%=totalPage-1 %>&article_name=<%=article_name %>"><%=totalPage-1 %></a>
<a href="search_article.jsp?pageIndex=<%=totalPage %>&article_name=<%=article_name %>"><%=totalPage %></a>

<%
                    if( pageIndex < totalPage){
                %>
                    <a href="search_article.jsp?pageIndex=<%=pageIndex + 1 %>&article_name=<%=article_name %>">下一页</a>
                <%
                    }
                %>
                    <a href="search_article.jsp?pageIndex=<%=totalPage%>&article_name=<%=article_name %>">尾页</a>
</div>
                <!-- END btn load-->
            </div>
            <!-- /container-->
        </section>
        <!-- /top news -->
       
       
        <!-- Footer -->
      
        <!-- END Footer -->
        <!-- All JavaScript libraries -->
		<script src="../js/jquery.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<!-- Custom JavaScript -->
        <script src="../js/main.js"></script>
    </body>
</html>
