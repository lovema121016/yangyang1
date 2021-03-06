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
<%@page import="com.model.Focus_Users"%>
<%@page import="com.dao.Focus_UserDao"%>
<%@page import="com.model.Brand"%>
<%@page import="com.dao.Article_comment_Dao"%>
<%@page import="com.model.Article_comment"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Timestamp" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <title>文章详情</title>
        <style>
        ol {
            position: absolute;
            height: 20px;
            right: 20px;
            bottom: 20px;
            text-align: center;
            padding: 5px;
        }
        ol li{
            display: inline-block;
            width: 20px;
            height: 20px;
            line-height: 20px;
            background-color: #fff;
            margin: 5px;
            cursor: pointer;
 
        }
        ol .current{
            background-color: red;
        }
        #arr{
            display: none;
        }
        #arr span{
            width: 40px;
            height: 40px;
            position: absolute;
            left: 5px;
            top: 50%;
            margin-top: -20px;
            background: #fff;
            cursor: pointer;
            line-height: 40px;
            text-align: center;
            font-weight: bold;
            font-family: '黑体';
            font-size: 30px;
            color: #000;
            opacity: 0.5;
            border: 1px solid #fff;
        }
        #arr #right {
            right: 5px;
            left: auto;
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
function add_focus(article_username)
{
	//alert(article_username)
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
		    xmlHttp.open("GET", "AddFocusUserServlet?article_username=" + article_username, true);
		    xmlHttp.send(null);
		    alert('关注成功!')
		    }catch(exception){
		    alert("关注失败!");
		    }
	}
}

//收藏该文章
function addshoppingcart(article_id)
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
		    xmlHttp.open("GET", "AddArticleLike?article_id=" + article_id, true);
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
    </head>
    <body>
        <!-- Header -->
        <jsp:include page="header.jsp" />
        <!-- END header -->
        <!-- header slider -->
        <div class="wrapper">
            <article class="container articles">
                <div class="row">
                    <div class="col-sm-4 col-md-3 right_sidebar hidden-xs hidden-sm" data-spy="affix" data-offset-top="112" data-offset-bottom="80">
                        <div class="news-tabs">
                            <p class="news-tabs__title h2">品牌相关热门国货</p>
                            <ul class="news-tabs__nav nav nav-tabs shadow_text" role="tablist">
                                <%
                                   String id=request.getParameter("article_id"); 
                                   int article_id=Integer.valueOf(id);
                                   ArticleDao ad=new ArticleDao();
                                   Article_comment_Dao acd=new Article_comment_Dao();
                                   Article article=ad.load(article_id);
                                   
                                   //浏览量增加1
                                   ad.update(article_id);
                                   
                                   UserDaoImpl userdao=new UserDaoImpl();
                                   User article_user=userdao.load(article.getUser_username());
                                   GoodDao gd=new GoodDao();
                                   List<Good> goods=gd.load(article.getBrand());
                                   
                                   //图片
                                   String []images=article.getImage().split(";");
                                   //评论
                                   List<Article_comment> art_coms=acd.load(article_id);
                                   int i=1;
                                   for(Good good:goods)
                                   {
                                	   if(i==1)
                                	   {
                                   
                                %>
                                <li role="presentation" class="active">
                                    <a href="<%=good.getLink() %>" >
                                        <span class="time">最佳国货</span>
                                        <%=good.getName() %>
                                    </a>
                                </li>
                                <%
                                	   }
                                	   else if(i>1&&i<=10)
                                	   {
                                		   %>
                                  <li role="presentation">
                                    <a href="<%=good.getLink() %>" >
                                        <span class="time">热度第<%=i %></span>
                                        <%=good.getName() %>
                                    </a>
                                </li>   
                                		   <%
                                		}
                                	   i++;
                                   }
                                %>
                                
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-9 p0 wrap-headline">
                        <!-- 图片播放 -->
<div style="width: 812px;height: 612px;border: 1px solid #ccc;margin: 100px auto;padding: 5px;" id="box">
    <div style="width: 800px;height: 600px;position: relative;overflow: hidden;">
        <!--轮播图-->
        <ul style="width: 1000%;position: absolute;list-style: none;left:0;top: 0;">
           <%
              for(String image:images)
              {
            	  
           %>
            <li style="float: left;"><a href="#"><img style="width:800px; height:600px;vertical-align:top" src="http://localhost:8080/yangyang/img/article/<%=image %>" alt=""></a></li>
          <%
              }
          %>
        </ul>
 
        <ol style="position: absolute;
            height: 20px;
            right: 20px;
            bottom: 20px;
            text-align: center;
            padding: 5px;">
 
        </ol>
        <!--左右焦点-->
        <div id="arr">
                    <span id="left">
                        <
                    </span>
            <span id="right">
                        >
                    </span>
        </div>
 
    </div>
</div>
<!-- 图片播放 -->
                        <div class="headline clearfix">
                            <div class="headline__data">
                                <a href="center/his_focus.jsp?user_id=<%=article_user.getId() %>" class="headline__category headline__category_orange"><%=article_user.getNickname() %></a>
                                <p class="headline__category">发布日期:<%=article.getUp_time() %></p>
                            </div>
                            <div class="share">
                                <ul class="share__list">
                                    <li class="share__row">
                                        <a class="share__link share__link_bg-facebook" href="#">
                                            <i class="bg bg_facebook">&ensp;</i>
                                        </a>
                                        <span class="share__number">评论：<%=art_coms.size() %></span>
                                    </li>
                                    <li class="share__row">
                                        <a class="share__link share__link_bg-twitter" href="#">
                                            <i class="bg bg_twitter">&ensp;</i>
                                        </a>
                                        <span class="share__number">浏览：<%=article.getLook() %></span>
                                    </li>
                                    <li class="share__row">
                                        <a class="share__link share__link_bg-google" href="javascript:void(0);" onclick="addshoppingcart(<%=article.getId() %>);return false;" style="font-size:20px">
                                            <i class="bg bg_google">&ensp;</i>
                                        </a>
                                        <span class="share__number"></span>
                                    </li>
                                    <%
                                      Focus_UserDao fd=new Focus_UserDao();
                                      if(user.getUsername()!=null)
                                      {
                                    	 if(user.getUsername().equals(article.getUser_username()))
                                    	 {}
                                    	 else
                                    	 {
                                            Focus_Users focus=fd.load(user.getId(), article.getUser_username());
                                            if(focus!=null)
                                            {
                                        	 %>
                                     <li class="share__row">
                                        <a class="share__link share__link_bg-twitter" href="javascript:void(0);" onclick="reset_focus(<%=article.getUser_username() %>);return false;">
                                            <i class="bg bg_google">&ensp;</i>
                                        </a>
                                        <span class="share__number">已关注</span>
                                    </li>
                                        	 <%
                                            }
                                            else
                                             {
                                        	 %>
                                          <li class="share__row">
                                             <a class="share__link share__link_bg-google" href="javascript:void(0);" onclick="add_focus('<%=article.getUser_username() %>');return false;">
                                                 <i class="bg bg_google">&ensp;</i>
                                             </a>
                                             <span class="share__number">关注他</span>
                                         </li>  
                                         <%    	 
                                             }
                                    	 }
                                      }
                                     else
                                     {
                                    %>
                                    <li class="share__row">
                                        <a class="share__link share__link_bg-google" href="javascript:void(0);" onclick="add_focus('<%=article.getUser_username() %>');return false;">
                                            <i class="bg bg_google">&ensp;</i>
                                        </a>
                                        <span class="share__number">关注他</span>
                                    </li>
                                    <%
                                      }
                                    %>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-sm-12 col-md-9 article_text">
                        <div class="current">
                            <h1 class="text-center yel_line current__title"><%=article.getTitle() %></h1>   
                        </div>
                        <p ><%=article.getContent() %></p>
                    </div>
                    <div class="col-sm-12 col-md-9 tags">
                        <p>标签:</p>
                        <ul>
                            <%
                              String []types=article.getType().split(";");
                              int c=0;
                              for(String type:types)
                              {
                            	  if(c==0)
                            	  {
                            %>
                            <li>
                                <a href="#" title="World" class="yellow font"><%=type %></a>
                            </li>
                            <%
                            	  }
                            	  else
                            	  {
                            		  %>
                                      <li>
                                          <a href="#" title="World" class="font"><%=type %></a>
                                      </li>
                                    
                                      <%
                            	  }
                            	  c++;
                              }
                            %>
                        </ul>
                    </div>
                    <div class="col-sm-9 col-md-8 col-lg-6 comments">
                        <p class="comments__title">评论</p>
                        <%
                           
                           
                           for(Article_comment art_com:art_coms)
                           {
                        	   User user1=userdao.load(art_com.getUsername());
                        %>
                        <div class="comments__media">
                            <div class="media-middle">
                                <i class="media-object" style="background-image: url('img/<%=user1.getImage() %>')"></i>
                                <div class="comm_info">
                                    <h4 class="media-heading"><%=user1.getNickname() %></h4>
                                    <span class="time"><%=art_com.getUp_time() %></span>
                                </div>
                            </div>
                            <p class="media-body"><%=art_com.getContent() %></p>
                        </div>
                        <%
                           }
                        %>
                        <div class="comments__form">
                            <form action="AddArticleCommentServlet" method="POST" onsubmit="return sumbit_sure()">
                                <div class="form-group">
                                     <input type="hidden" name="article_id" value="<%=article_id %>">
                                </div>
                                <div class="form-group">
                                    <textarea name="content" id="input" class="form-control" placeholder="说出你的感想" rows="7" required="required"></textarea>
                                </div>
                                <button type="submit" class="btn btn-comment">发表</button>
                            </form>
                        </div>
                    </div>
                </div>
            </article>
        </div>
        <!-- Footer -->
        <!-- END Footer -->
        <!-- All JavaScript libraries -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<!-- Custom JavaScript -->
        <script src="js/main.js"></script>
        <script>
    /**
     *
     * @param id  传入元素的id
     * @returns {HTMLElement | null}  返回标签对象，方便获取元素
     */
    function my$(id) {
        return document.getElementById(id);
    }
 
    //获取各元素，方便操作
    var box=my$("box");
    var inner=box.children[0];
    var ulObj=inner.children[0];
    var list=ulObj.children;
    var olObj=inner.children[1];
    var arr=my$("arr");
    var imgWidth=inner.offsetWidth;
    var right=my$("right");
    var pic=0;
    //根据li个数，创建小按钮
    for(var i=0;i<list.length;i++){
        var liObj=document.createElement("li");
 
        olObj.appendChild(liObj);
        liObj.innerText=(i+1);
        liObj.setAttribute("index",i);
 
        //为按钮注册mouseover事件
        liObj.οnmοuseοver=function () {
            //先清除所有按钮的样式
 
            for (var j=0;j<olObj.children.length;j++){
                olObj.children[j].removeAttribute("class");
            }
            this.className="current";
            pic=this.getAttribute("index");
            animate(ulObj,-pic*imgWidth);
        }
 
    }
 
 
    //设置ol中第一个li有背景颜色
    olObj.children[0].className = "current";
    //克隆一个ul中第一个li,加入到ul中的最后=====克隆
    ulObj.appendChild(ulObj.children[0].cloneNode(true));
 
    var timeId=setInterval(onmouseclickHandle,1000);
    //左右焦点实现点击切换图片功能
    box.οnmοuseοver=function () {
        arr.style.display="block";
        clearInterval(timeId);
    };
    box.οnmοuseοut=function () {
        arr.style.display="none";
        timeId=setInterval(onmouseclickHandle,1000);
    };
 
    right.οnclick=onmouseclickHandle;
    function onmouseclickHandle() {
        //如果pic的值是5,恰巧是ul中li的个数-1的值,此时页面显示第六个图片,而用户会认为这是第一个图,
        //所以,如果用户再次点击按钮,用户应该看到第二个图片
        if (pic == list.length - 1) {
            //如何从第6个图,跳转到第一个图
            pic = 0;//先设置pic=0
            ulObj.style.left = 0 + "px";//把ul的位置还原成开始的默认位置
        }
        pic++;//立刻设置pic加1,那么此时用户就会看到第二个图片了
        animate(ulObj, -pic * imgWidth);//pic从0的值加1之后,pic的值是1,然后ul移动出去一个图片
        //如果pic==5说明,此时显示第6个图(内容是第一张图片),第一个小按钮有颜色,
        if (pic == list.length - 1) {
            //第五个按钮颜色干掉
            olObj.children[olObj.children.length - 1].className = "";
            //第一个按钮颜色设置上
            olObj.children[0].className = "current";
        } else {
            //干掉所有的小按钮的背景颜色
            for (var i = 0; i < olObj.children.length; i++) {
                olObj.children[i].removeAttribute("class");
            }
            olObj.children[pic].className = "current";
        }
    }
    left.οnclick=function () {
        if (pic==0){
            pic=list.length-1;
            ulObj.style.left=-pic*imgWidth+"px";
        }
        pic--;
        animate(ulObj,-pic*imgWidth);
        for (var i = 0; i < olObj.children.length; i++) {
            olObj.children[i].removeAttribute("class");
        }
        //当前的pic索引对应的按钮设置颜色
        olObj.children[pic].className = "current";
    };
 
    //设置任意的一个元素,移动到指定的目标位置
    function animate(element, target) {
        clearInterval(element.timeId);
        //定时器的id值存储到对象的一个属性中
        element.timeId = setInterval(function () {
            //获取元素的当前的位置,数字类型
            var current = element.offsetLeft;
            //每次移动的距离
            var step = 30;
            step = current < target ? step : -step;
            //当前移动到位置
            current += step;
            if (Math.abs(current - target) > Math.abs(step)) {
                element.style.left = current + "px";
            } else {
            	
                //清理定时器
                clearInterval(element.timeId);
                //直接到达目标
                element.style.left = target + "px";
            }
        }, 30);
    }
</script>
    </body>
</html>

