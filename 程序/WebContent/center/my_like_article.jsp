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

<%@page import="com.dao.ArticleLikeDao"%>
<%@page import="com.model.ArticleLike"%>
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
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>发布历史</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
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
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
        
    <link rel="icon" href="../assets/img/icon.ico" type="image/x-icon"/>
	
	<!-- Fonts and icons -->
	<script src="../assets/js/plugin/webfont/webfont.min.js"></script>
	<link rel="stylesheet" href="../assets/css/azzara.min.css">
	<link href="../css/main.css" rel="stylesheet" type="text/css" />
	<script>
		WebFont.load({
			google: {"families":["Open+Sans:300,400,600,700"]},
			custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands"], urls: ['../../assets/css/fonts.css']},
			active: function() {
				sessionStorage.fonts = true;
			}
		});
	</script>
<style type="text/css">
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
</style>


<script type="text/javascript">
//创建ajax请求对象
 var xmlHttp;
function createXMLHttpRequest(){
   if(window.ActiveXObject){
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
   }
    else if(window.XMLHttpRequest){
        xmlHttp = new XMLHttpRequest();
  }
}

//取消收藏该文章
function deleteshoppingcart(article_id)
{
	var username=<%=user.getUsername() %>
	if(username==null)
		{
		  alert('请先登录!');
		}
	else
		{
	createXMLHttpRequest();
	//alert(goodid);
		
		try{
		    xmlHttp.onreadystatechange = handleStateChange;
		    xmlHttp.open("GET", "../DeleteArticleLike?article_id=" + article_id, true);
		    xmlHttp.send(null);
		    alert('取消成功!')
		    }catch(exception){
		    alert("取消失败!");
		    }
		}
}
//处理结果
function handleStateChange(){
  if(xmlHttp.readyState == 4){
    if (xmlHttp.status == 200 || xmlHttp.status == 0){
      var t = xmlHttp.responseText;
        jsonobj = eval('('+t+')');
    }
  }
}
</script> 

<script language="javascript">
	function sumbit_sure() {
		var username=<%=user.getUsername() %>
		if(username==null)
		{
			  alert('请先登录!');
			  return false;
		}
		else
			{
			 return true;
			}
	}
</script>
	<!-- CSS Files -->
	<!-- CSS Just for demo purpose, don't include it in your project -->
  </head>
  <body>
    <!-- navbar-->
    <div id="subscribe-me" class="modal animated fade in" role="dialog" data-keyboard="true" tabindex="-1">
      <div class="newsletter-popup">
        <img class="offer" src="images/newsbg.jpg" alt="offer">
        <div class="newsletter-popup-static newsletter-popup-top">
          <div class="popup-text">
            <div class="popup-title">50% <span>off</span></div>
            <div class="popup-desc">
              <div>Sign up and get 50% off your next Order</div>
            </div>
          </div>
          <form onsubmit="return  validatpopupemail();" method="post">
            <div class="form-group required">
              <input type="email" name="email-popup" id="email-popup" placeholder="Enter Your Email" class="form-control input-lg" required />
              <button type="submit" class="btn btn-default btn-lg" id="email-popup-submit">Subscribe</button>
              <label class="checkme">
                <input type="checkbox" value="" id="checkme" />Dont show again</label>
            </div>
          </form>
        </div>
      </div>
    </div>
    <!-- =====  HEADER START  ===== -->
    <!-- Header -->
    <jsp:include page="header.jsp" />
    <div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <!-- breadcrumb-->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="../index.jsp">首页</a></li>
                  <li aria-current="page" class="breadcrumb-item active">我的收藏</li>
                </ol>
              </nav>
            </div>
            <div class="col-lg-3">
              <!--
              *** CUSTOMER MENU ***
              _________________________________________________________
              -->
              <div class="card sidebar-menu">
                <div class="card-header">
                  <h3 class="h4 card-title">用户模块</h3>
                </div>
                <div class="card-body">
                  <ul class="nav nav-pills flex-column">
                  <a href="user.jsp" class="nav-link"><i class="fa fa-list"></i> 个人信息</a>
                  <a href="my_like_good.jsp" class="nav-link"><i class="fa fa-heart"></i> 我的收藏商品</a>
                  <a href="my_like_article.jsp" class="nav-link active"><i class="fa fa-heart"></i> 我的收藏文章</a>
                  <a href="focus_users.jsp" class="nav-link"><i class="fa fa-heart"></i> 我的关注</a>
                  <a href="fabu_article.jsp" class="nav-link"><i class="fa fa-user"></i> 发布文章</a>
                  <a href="fabu_history.jsp" class="nav-link"><i class="fa fa-user"></i> 发布历史</a>
                  <a href="../Logout" class="nav-link"><i class="fa fa-sign-out"></i> 退出登录</a>
                  </ul>
                </div>
              </div>
              <!-- /.col-lg-3-->
              <!-- *** CUSTOMER MENU END ***-->
            </div>
            <div id="wishlist" class="col-lg-9">
              <ul class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li>我的收藏文章</li>
              </ul>
              <div class="row products">
              <%
              int pageIndex = 1;
              int pageSize = 5;
              try{
                  pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
              }catch(Exception e){
              }
                  
                  String content = request.getParameter("content");
                  if(content == null || "".equals(content)){
                      content = "";        
                  }
                  //List<User> users = userDao.load(content);
                  ArticleLikeDao ald=new ArticleLikeDao();
                  //获得pager中保存的list集合
                  List<ArticleLike> articles=new ArrayList<ArticleLike>();
                  Page pager=null;
                  ArticleDao ad=new ArticleDao();
                  pager=ald.load_article(user.getId(), pageIndex, pageSize);
                  
                  articles = pager.getDatas();
                  for(ArticleLike like:articles)
                  {
                	  Article article=ad.load(like.getArticle_id());
                	  String []images=article.getImage().split(";");
                	  %>
                <div class="col-lg-3 col-md-4">
                  <div class="product">
                    <div class="flip-container">
                      <div class="flipper">
                        <div class="front"><a href="../detail.jsp?article_id=<%=article.getId() %>"><img src="http://localhost:8080/yangyang/img/article/<%=images[0] %>" alt="" class="img-fluid"></a></div>
                        <div class="back"><a href="../detail.jsp?article_id=<%=article.getId() %>"><img src="http://localhost:8080/yangyang/img/article/<%=images[0] %>" alt="" class="img-fluid"></a></div>
                      </div>
                    </div><a href="../detail.jsp?article_id=<%=article.getId() %>" class="invisible"><img src="http://localhost:8080/yangyang/img/article/<%=images[0] %>" alt="" class="img-fluid"></a>
                    <div class="text">
                      <h3><a href="../detail.jsp?article_id=<%=article.getId() %>"><%=article.getTitle() %></a></h3>
                      <p class="price"> 
                        <del></del><%=article.getUp_time() %>
                      </p>
                      <p class="buttons"><a href="../detail.jsp?article_id=<%=article.getId() %>" class="btn btn-outline-secondary">查看详情</a><a href="javascript:void(0);" onclick="deleteshoppingcart(<%=article.getId() %>);return false;" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>取消收藏</a></p>
                    </div>
                    <!-- /.text-->
                  </div>
                  <!-- /.product            -->
                </div>
                	  <%
                  }
              %>
                <!-- /.products-->
              </div>
<div class="tres"> 
<span class="disabled">&lt; </span>
<a href="my_like_good.jsp?pageIndex=1">首页</a>
<%
                    int totalPage = pager.getTotalPage();
                    if(pageIndex > 1){
                %>
                    <a href="my_like_good.jsp?pageIndex=<%=pageIndex-1 %>">上一页</a>
                <%
                    }
                %>
<a href="my_like_good.jsp?pageIndex=2">2</a>...

<%
                    if( pageIndex < totalPage){
                %>
                    <a href="my_like_good.jsp?pageIndex=<%=pageIndex + 1 %>">下一页</a>
                <%
                    }
                %>
                    <a href="my_like_good.jsp?pageIndex=<%=totalPage%>">尾页</a>
</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--
    *** FOOTER ***
    _________________________________________________________
    -->
    
    <!-- /#footer-->
    <!-- *** FOOTER END ***-->
    
    
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
    <script src="../assets/js/core/jquery.3.2.1.min.js"></script>
	<script src="../assets/js/core/popper.min.js"></script>
	<script src="../assets/js/core/bootstrap.min.js"></script>
	<!-- jQuery UI -->
	<script src="../assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="../assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
	<!-- Bootstrap Toggle -->
	<script src="../assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
	<!-- jQuery Scrollbar -->
	<script src="../assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
	<!-- Datatables -->
	<script src="../assets/js/plugin/datatables/datatables.min.js"></script>
	<!-- Azzara JS -->
	<script src="../assets/js/ready.min.js"></script>
	<!-- Azzara DEMO methods, don't include it in your project! -->
	<script src="../assets/js/setting-demo.js"></script>
   
  </body>
</html> 