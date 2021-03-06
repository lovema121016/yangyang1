<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="com.model.User" scope="session"/>
<%@page import="com.dao.ArticleDao"%>
<%@page import="com.model.Article"%>
<%@page import="com.dao.UserDaoImpl"%>
<%@page import="com.model.User"%>
<%@page import="com.dao.GoodDao"%>
<%@page import="com.model.Good"%>
<%@page import="com.dao.BrandDao"%>
<%@page import="com.model.Brand"%>
<%@page import="com.dao.Good_comment_Dao"%>
<%@page import="com.model.Good_comment"%>
<%@page import="com.dao.Article_comment_Dao"%>
<%@page import="com.model.Article_comment"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Timestamp" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.dao.Good_type_dao"%>
<%@page import="com.model.Good_Type"%>
<%@page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta content="" name="description">
        <meta content="" name="keywords">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <title>商品详情页</title>
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
function addshoppingcart(goodid)
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
		    xmlHttp.open("GET", "AddGoodLike?goodid=" + goodid, true);
		    xmlHttp.send(null);
		    alert('收藏成功!')
		    }catch(exception){
		    alert("收藏失败!");
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
    </head>
    <body>
   
        <!-- Header -->
        <jsp:include page="header.jsp" />
        <!-- END header -->
        <!-- header slider -->
        <div class="wrapper">
            <article class="container articles">
                <div class="row">
                    <div class="col-sm-4 col-md-3 right_sidebar hidden-xs hidden-sm" data-spy="affix" data-offset-top="112" style="background-color:#F0F0F0" data-offset-bottom="80">
                      
                      <p style="color:black;font-size:20px;font-family:黑体;margin-top:20px">商品综合评价</p>
                       <%
                       UserDaoImpl userdao=new UserDaoImpl();
                       GoodDao gd=new GoodDao();
                       Good goo=new Good();
                       Good_comment_Dao gdao=new Good_comment_Dao();
                       List<Good_comment> good_comments=new ArrayList<Good_comment>();
                       Good_type_dao gtd=new Good_type_dao();
                       Good_Type gt=new Good_Type();
                       String id=request.getParameter("article_id"); 
                       try{
                                   int good_id=Integer.valueOf(id);//获取传来的商品id
                                   
                                   goo=gd.load(good_id);  //查询商品对应的信息
                                   
                                   
                                   good_comments=gdao.load(goo.getId());   //查询商品对应的评论
                                   //评论
                                  
                                   
                                   
                                   gt=gtd.loadID(goo.getType());//查询商品标签
                                   int i=1;
                       }catch (Exception e)//当捕捉的异常与代码发生的异常相同时，程序可继续执行catch里的代码，括号内放的是异常的对象
                       { 
                       	String a="index.jsp";
                       	PrintWriter out1 = response.getWriter();  //获取输出流
                       	out1.println("<script>window.location.href='error.jsp?id="+a+"'</script>");
                       	out1.close();
                       } finally
                       { 
                       	
                       }
                     %>
                    
                          <div id="container" style="height: 400px"></div> 
                          <div>
                             <p style="color:black;font-size:20px;font-family:黑体;margin-top:20px">好评率:<%=goo.getGood_rate() %></p>
                          </div>  
                          <div class="news-tabs">
                            <p class="news-tabs__title h2" style="color:black">点击此处购买</p>
                            <ul class="news-tabs__nav nav nav-tabs shadow_text" role="tablist">
                                 <li role="presentation" class="active">
                                    <a href="<%=goo.getLink() %>" >
                                        <span class="time">京东</span>
                                        <%=goo.getName() %>
                                    </a>
                                </li>
                            </ul>
                           </div> 
                    </div>
                    <div class="col-sm-12 col-md-9 p0 wrap-headline">
                        <img src="http://localhost:8080/yangyang/img/good/<%=goo.getImage() %>" alt="img" class="wrap-headline__img">
                        <div class="headline clearfix">
                            <div class="headline__data">
                                <a href="category.html" class="headline__category headline__category_orange"><%=goo.getShop() %></a>
                                <p class="headline__category"></p>
                            </div>
                            <div class="share">
                                <ul class="share__list">
                                    
                                   <li class="share__row">
                                        <a class="share__link share__link_bg-google" href="javascript:void(0);" onclick="addshoppingcart(<%=goo.getId() %>);return false;" style="font-size:20px">
                                            <i class="bg bg_google">&ensp;</i>
                                        </a>
                                        <span class="share__number"></span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-sm-12 col-md-9 article_text">
                        <div class="current">
                            <h1 class="text-center yel_line current__title"><%=goo.getName() %></h1>
                            <h3 class="current__text">店铺:<%=goo.getShop() %></h3>
                            <p class="current__text">¥:<%=goo.getPrice() %></p>
                            <p class="current__text"><%=goo.getContent() %></p>
                            
                            <!-- 
                              <img src="img/content/article2.jpg" alt="img" class="current__img">
                            <p class="current__text">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim
                                ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid
                                ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>
                            <blockquote class="quote current__quote">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</blockquote>
                            <p class="current__text">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>                  
                             -->
                            
                        </div>
                    </div>
                   
                    <div class="col-sm-12 col-md-9 tags">
                        <p>标签:</p>
                        <ul>
                            <li>
                                <a href="#" title="World" class="font"><%=goo.getBrand() %></a>
                            </li>
                            <li>
                                <a class="yellow font" href="#" title="Sport"><%=gt.getMiddle_type() %></a>
                            </li>
                            <li>
                                <a href="#" title="Cats" class="font"><%=gt.getSmall_type() %></a>
                            </li>
                        </ul>
                    </div>
                    
                    <div class="col-sm-9 col-md-8 col-lg-6 comments">
                        <p class="comments__title">评论</p>
                        <% 
                           for(Good_comment goo_com:good_comments)
                           {
                        	   User user1=userdao.load(goo_com.getUsername());
                        %>
                        <div class="comments__media">
                            <div class="media-middle">
                                <i class="media-object" style="background-image: url('images/header/<%=user1.getImage() %>')"></i>
                                <div class="comm_info">
                                    <h4 class="media-heading"><%=user1.getNickname() %></h4>
                                    <span class="time"><%=goo_com.getUp_time() %></span>
                                </div>
                            </div>
                            <p class="media-body"><%=goo_com.getContent() %></p>
                        </div>
                        <%
                           }
                        %>
                        <div class="comments__form">
                            <form action="UpGComment" method="POST">
                                <div class="form-group">
                                    <input type="hidden" name="good_id" value="<%=goo.getId() %>">
                                </div>
                                <div class="form-group">
                                    <textarea name="comment" id="input" class="form-control" placeholder="说出你的感想" rows="7" required="required"></textarea>
                                </div>
                                <button type="submit" class="btn btn-comment">发表</button>
                            </form>
                        </div>
                    </div>
                </div>
            </article>
        </div>
        
        <!-- END Footer -->
        <!-- All JavaScript libraries -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<!-- Custom JavaScript -->
        <script src="js/main.js"></script>
        <script type="text/javascript" src="js/echarts.min.js"></script>
 <%
    if(goo.getCipin()!=null&&goo.getId()!=0){
                     
 %>
<script type="text/javascript">
var dom = document.getElementById("container");
var myChart = echarts.init(dom);
var app = {};
option = null;
option = {
    title: {
        text: '商品评价',
        subtext: '',
        left: 'center'
    },
    tooltip: {
        trigger: 'item',
        formatter: '{a} <br/>{b} : {c} ({d}%)'
    },
    legend: {
        orient: 'vertical',
        left: 'left',
        data: ['直接访问', '邮件营销', '联盟广告', '视频广告', '搜索引擎']
    },
    series: [
        {
            name: '高热词频',
            type: 'pie',
            radius: '55%',
            center: ['50%', '60%'],
            data: [
               <%
                 String []cipin=goo.getCipin().split("&");
                 for(int j=0;j<cipin.length-1;j++)
                 {
                	 String []data=cipin[j].split(":");
               %>
               {value:<%=data[1]%>, name: '<%=data[0]%>'},
               <%
                 }
                 String []data=cipin[cipin.length-1].split(":");
               %>
                {value: <%=data[1]%>, name: '<%=data[0]%>'}
            ],
            emphasis: {
                itemStyle: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }
    ]
};
;
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
</script>
<%
}
%> 
    </body>
</html>

