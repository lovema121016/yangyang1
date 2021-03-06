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
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>个人信息页</title>
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
<script type="text/javascript" src="../js/demo.js"></script>



<link rel="stylesheet" href="../assets/css/azzara.min.css">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
    <!-- navbar-->
    <jsp:include page="header.jsp" />
    <div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <!-- breadcrumb-->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">首页</a></li>
                  <li aria-current="page" class="breadcrumb-item active">个人信息</li>
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
                  <a href="user.jsp" class="nav-link active"><i class="fa fa-list"></i> 个人信息</a>
                  <a href="my_like_good.jsp" class="nav-link"><i class="fa fa-heart"></i> 我的收藏商品</a>
                  <a href="my_like_article.jsp" class="nav-link"><i class="fa fa-heart"></i> 我的收藏文章</a>
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
            <div class="col-lg-9">
              <div class="box">
                <h1>基本信息</h1>
                <p class="lead"></p>
                <p class="text-muted">修改个人基本信息或密码.</p>
                
                <h3 class="mt-5">个人信息</h3>
             
                  <div class="row">
                    <div class="col-md-6">
                      <div>
                        <label for="firstname">用户名：<%=user.getUsername() %></label>
                      </div>
                    </div>
                  
                  </div>
                  <!-- /.row-->
                  <div class="row">
                    <div class="col-md-6">
                      <div>
                        <label for="company">昵称：<%=user.getNickname() %></label>
                      </div>
                    </div>
                 
                  </div>
                  <!-- /.row-->
                  <div class="row">
                    <div class="col-md-6 col-lg-3">
                      <div>
                        <label for="city">头像</label>       
                        <form action="changeheader.jsp" method="post" enctype="multipart/form-data">
			               <input type="hidden" id="name" name="name1" value="" />
			               <input name="header" type="file" id="xdaTanFileImg" onchange="xmTanUploadImg(this)" accept="image/*" style="display:none;"/>
			               <input id="confirm1" style="display:none" type="submit" value="确定上传">
			                  <p style="background-color: #f8f8f8;">
			                     <%
				                    if(user.getImage()==null || user.getImage().equals("")){
			                     %>
			                        	<img id="xmTanImg" alt="" style="width:50px;" src="../images/header/head.JPG">
			                     <%
				                   }else{
			                     %>
			                        	<img id="xmTanImg" src="../images/header/<%=user.getImage() %>" style="width: 50px;height:50px;border-radius: 25px;"/>
			                     <%
			                      	}
			                     %>
				              <a href="javascript:;" style="float: right;color:#e37318" onclick="$('#xdaTanFileImg').click()">更改头像</a><br/>
				              <a href="javascript:;" id="confirm" style="display:none;float: right;" onclick="$('#confirm1').click()">确认上传</a>
			               </p>
		               </form>
                      </div>
                    </div>
                    <br>
                    <div class="col-md-6">
                      <div>
                        <label for="phone"></label>
                      </div>
                    </div>
                    <div class="col-md-6">
                      
                    </div>
                    <div class="col-md-6">
                      <div>
                        <label for="email"></label>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div>
                        <label for="email">密码：●●●●●●●●●●<a href="javascript:;" style="float: right;" onclick="change()">修改密码</a></label>
                      </div>
                    </div>
                    <div class="col-md-12 text-center">
                      <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> 保存修改</button>
                    </div>
                  </div>
                  
               <span><a onClick="closeChangeWindow()" style="float: right;" href="javascript:;">X</a></span>
               <div id="changepass" style="display:none;"> 
                <h3>修改密码</h3>
                <form action="changepassword.jsp" align="center">
                  <div class="row">
                    <div class="col-md-6">
                      <div>
                        <label for="password_old">旧密码</label>
                        <input type="password" id="oldpassword" name="oldpassword" oninput="checkOldPass()" placeholder="原密码" class="form-control">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div>
                      <div>
                        <label for="password_1">新密码</label>
                        <input type="password" id="newpassword" name="newpassword" oninput="checkNewPass()" placeholder="新密码" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div>
                        <label for="password_2">确认密码</label>
                        <input type="password" id="newpassword2" name="newpassword2" oninput="checkNewPass2()" placeholder="确认密码" class="form-control">
                      </div>
                    </div>
                  </div>
                  <!-- /.row-->
                  <div class="col-md-12 text-center">
                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> 保存新密码</button>
                  </div>
                </form>
                </div>
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
    <div id="cover"></div>
    <!-- 修改密码框 -->
   
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
    
    <script>
	//选择图片，马上预览
	function xmTanUploadImg(obj) {
		var file = obj.files[0];
	    console.log(obj);console.log(file);
	    console.log("file.size = " + file.size);  //file.size 单位为byte
	    var reader = new FileReader();
	    //读取文件过程方法
	    reader.onloadstart = function (e) {
	        console.log("开始读取....");
	    }
	    reader.onprogress = function (e) {
	        console.log("正在读取中....");
	    }
	    reader.onabort = function (e) {
	        console.log("中断读取....");
	    }
	    reader.onerror = function (e) {
	        console.log("读取异常....");
	    }
	    reader.onload = function (e) {
	        console.log("成功读取....");
	        var img = document.getElementById("xmTanImg");
	        img.src = e.target.result;
	        var x = document.getElementById("xdaTanFileImg").value;
	        var y = x.substring(x.lastIndexOf('\\')+1);
	        document.getElementById("name").value = y;
	       	var confirm = document.getElementById("confirm");
	       	confirm.style.display="block";
	        //或者 img.src = this.result;  //e.target == this
	    }
	   reader.readAsDataURL(file);
	}
	function changealipay(){
		layer.open({
			type:2,
			content:['changealipayInput.jsp'],
			area:['400px','500px']
		});
	}
	function changeQq(){
		layer.open({
			type:2,
			content:['changeqqInput.jsp'],
			area:['200','300']
		});
	}
</script>

<script>
var oldpassword = false;
var newpassword = false;
var newpassword2 = false;
var newpass = null;
function checkOldPass()
{
	var rightp = $("#rightpass").html();
	var oldpass = $("#oldpassword").val();
	if($("#oldpassword").val()==null||$("#oldpassword").val()==""){
		$(".tip").eq(0).html("×");
		$(".tip").eq(0).css({"color":"red"});
		$(".tip").eq(0).attr("title",'请输入原密码');
	}
	else if(oldpass!=rightp){
		$(".tip").eq(0).html("×");
		$(".tip").eq(0).css({"color":"red"});
		$(".tip").eq(0).attr("title",'密码不正确');
	}
	else{
		oldpassword = true;
		$(".tip").eq(0).html("√");
		$(".tip").eq(0).css({"color":"green"});
		$(".tip").eq(0).attr("title",'');
	}
	checkAll();
}
function checkNewPass()
{
	newpass = $("#newpassword").val();
	if($("#newpassword").val()==null||$("#newpassword").val()==""){
		$(".tip").eq(1).html("×");
		$(".tip").eq(1).css({"color":"red"});
		$(".tip").eq(1).attr("title",'请输入新密码');
	}
	else if(newpass.length<6||newpass.length>16){
		$(".tip").eq(1).html("×");
		$(".tip").eq(1).css({"color":"red"});
		$(".tip").eq(1).attr("title",'请输入6-16位密码');
	}
	else{
		newpassword = true;
		$(".tip").eq(1).html("√");
		$(".tip").eq(1).css({"color":"green"});
		$(".tip").eq(1).attr("title",'');
	}
	checkAll();
}
function checkNewPass2()
{
	if(newpassword){
		var newpass2 = $("#newpassword2").val();
		if($("#newpassword2").val()==null||$("#newpassword2").val()==""){
			$(".tip").eq(2).html("×");
			$(".tip").eq(2).css({"color":"red"});
			$(".tip").eq(2).attr("title",'请确认原密码');
		}
		else if(newpass2!=newpass){
			$(".tip").eq(2).html("×");
			$(".tip").eq(2).css({"color":"red"});
			$(".tip").eq(2).attr("title",'两个新密码不一致');
		}
		else{
			newpassword2=true;
			$(".tip").eq(2).html("√");
			$(".tip").eq(2).css({"color":"green"});
			$(".tip").eq(2).attr("title",'');
		}
	}
	else{
		$(".tip").eq(2).html("×");
		$(".tip").eq(2).css({"color":"red"});
		$(".tip").eq(2).attr("title",'请检查新密码的有效性');
	}
	checkAll();
}
function checkAll() {
	var flag = oldpassword+newpassword+newpassword2;
	if(flag == 3){
		$("#chanbtn").removeAttr("disabled");
	}else{
		$("#chanbtn").attr("disabled");
	}
}
</script>
  </body>
</html>