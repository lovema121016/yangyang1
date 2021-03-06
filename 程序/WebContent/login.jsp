<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>Login</title>
	<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
	<link rel="icon" href="assets/img/icon.ico" type="image/x-icon"/>

	<!-- Fonts and icons -->
	<script src="assets/js/plugin/webfont/webfont.min.js"></script>
	<script>
		WebFont.load({
			google: {"families":["Open+Sans:300,400,600,700"]},
			custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands"], urls: ['../assets/css/fonts.css']},
			active: function() {
				sessionStorage.fonts = true;
			}
		});
	</script>
  <script type="text/javascript">
  var xmlHttp;
  function createXMLHttpRequest(){
     if(window.ActiveXObject){
          xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
     }
      else if(window.XMLHttpRequest){
          xmlHttp = new XMLHttpRequest();
    }
  }

//处理结果
  function handleStateChange(){
	//alert('yao')
    if(xmlHttp.readyState == 4){
      if (xmlHttp.status == 200 || xmlHttp.status == 0){
        var t = xmlHttp.responseText;
        //alert(xmlHttp.responseText);
        if(t=="OK")
        	{
        	s_username.innerHTML = "用户已存在！";
		    isUsernameRight=false;
        	}
        else
        	{
        	s_username.innerHTML = "<img width='35' height='25' src='img/gou.png'/>";
		    isUsernameRight=true;  
        	}
      }
    }
  }
  
    var isUsernameRight = false;
    var isPassRight = false;
    var isSPassRight = false;
    var isNameRight = false;

    function load(){
    	checkAll();
    	if($("#username").val()!="")
    		checkUsername();
    	if($("#password").val()!="")
    		checkPass();
    	if($("#spassword").val()!="")
    		checkSPass();
    	if($("#nickname").val() != "")
    		checkNickName();
    };

    function checkUsername() 
    {
    	// 1.获取用户名的值
    	
        var username = document.getElementById("username1").value;
        //alert(username)
        // 2.定义正则表达式
        var reg_username = /^\w{6,12}$/;
        // 3.判断值是否符合正则的规则
        var flag = reg_username.test(username);
        // 4.提示信息
        var s_username = document.getElementById("s_username");
        if(flag){
            // 提示绿色对勾
            //s_username.innerHTML = "<img width='35' height='25' src='img/gou.png'/>";
            
            
            //判断用户是否已存在
            createXMLHttpRequest();
        	//alert(goodid);	
        	try{
        		    
        		    xmlHttp.open("GET", "PanDuanServlet?username=" + username, true);
        		    xmlHttp.onreadystatechange = handleStateChange;
        		    xmlHttp.send(null);
        		    //s_username.innerHTML = "用户已存在！";
        		    //isUsernameRight=false;
        		    }catch(exception){
        		    //s_username.innerHTML = "<img width='35' height='25' src='img/gou.png'/>";
        		    //isUsernameRight=true;
        	   }
        }else{
            // 提示红色用户名有误
            isUsernameRight=false;
            s_username.innerHTML = "用户名为6-12位数字或字符";
        }
        checkAll();
        return flag;
    }
    function checkPass(){
    	// 1.获取用户名的值
        var password = document.getElementById("pass").value;
        // 2.定义正则表达式
        var reg_password = /^\w{6,12}$/;
        // 3.判断值是否符合正则的规则
        var flag = reg_password.test(password);
        // 4.提示信息
        var s_password = document.getElementById("s_password");
        if(flag){
            // 提示绿色对勾
            s_password.innerHTML = "<img width='35' height='25' src='img/gou.png'/>";
            isPassRight=true;
        }else{
            // 提示红色用户名有误
            isPassRight=false;
            s_password.innerHTML = "请输入6-12位密码";
        }
        checkAll();
        return flag;
    }

    function checkSPass(){
    	//alert("cs");
    	if(isPassRight){
    		var pass = $("#pass").val();
    		var pass2 = $("#spassword").val();
    		//alert(pass);
    		//alert(pass2);
    		if(pass == pass2){
    			s_spassword.innerHTML = "<img width='35' height='25' src='img/gou.png'/>";
    			isSPassRight=true;
    		}
    		else
    		{
    			isSPassRight=false;
    			s_spassword.innerHTML = "两次输入不一致！";
    		}
    	}
    	checkAll();
    }

    function checkNickName(){
    	var str = $("#nickname").val();
    	//var patt = /([a-z]|[A-Z]|[0-9]|_)?/;
    	if($("#nickname").val()==null||$("#nickname").val()=="")
    	{
    		s_nickname.innerHTML = "昵称不能为空！";
    		isNameRight = false;
    	}
//    	else if(str.length > 10 || str.length < 6 || !patt.test(str))
//    	{
//    		$(".tip").eq(3).html("×");
//    		$(".tip").eq(3).css({"color":"red"});
//    		$(".tip").eq(3).attr("title",'显示名称由6-10个英文字符、数字或"_"组成');
//    		isUserRight = false;
//    	}
    	else{
    		s_nickname.innerHTML = "<img width='35' height='25' src='img/gou.png'/>";
    		isNameRight = true;
    	}
    	checkAll();
    }


    function checkAll(){
    	
    	var flag = isUsernameRight+isPassRight+isSPassRight+isNameRight;
    	//alert(flag)
    	if(flag == 4){
    		$("#regBtn").removeAttr("disabled");
    		$("#regBtn").css({"background-color":"#cfc723"});
    	}else{
    		//alert(flag)
    		$("#regBtn").attr("disabled",true);
    		$("#regBtn").css({"background-color":"#cf2323"});
    	}
    }
    </script>
	
	
	<!-- CSS Files -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/azzara.min.css">
	 
	    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Oleo+Script:400,700'>
        
        <link rel="stylesheet" href="assets/css/style.css">
</head>
<body class="login">
    <div class="header">
            <div class="container">
                <div class="row">
                    <div class="logo span4">
                        <h1><a href="">泱泱国货 <span class="red">.</span></a></h1>
                    </div>
                    <div class="links span8">
                        <a class="home" href="" rel="tooltip" data-placement="bottom" data-original-title="Home"></a>
                        <a class="blog" href="" rel="tooltip" data-placement="bottom" data-original-title="Blog"></a>
                    </div>
                </div>
            </div>
        </div>
     
    <div class="register-container container" style="float:left;margin-left:300px;width:40%">
            <div class="row">
                <div class="iphone span5">
                    <img src="assets/img/iphone.png" alt="">
                </div>
               
            </div>
    </div>
	<div class="wrapper wrapper-login" style="margin-right:150px;width:30%">
		<div class="container container-login animated fadeIn">
			<h3 class="text-center">登录泱泱</h3>
			<form action="Login" method="post">
			<div class="login-form">
				<div class="form-group form-floating-label">
					<input id="username" name="username" type="text" class="form-control input-border-bottom" required>
					<label for="username" class="placeholder">用户名</label>
				</div>
				<div class="form-group form-floating-label">
					<input id="password" name="password" type="password" class="form-control input-border-bottom" required>
					<label for="password" class="placeholder">密码</label>
					<div class="show-password">
						<i class="flaticon-interface"></i>
					</div>
				</div>
				<div class="row form-sub m-0">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="rememberme">
						<label class="custom-control-label" for="rememberme">记住我</label>
					</div>					
					<a href="#" class="link float-right">忘记密码 ?</a>
				</div>
				<div class="form-action mb-3">
					<input type="submit" class="btn btn-primary btn-rounded btn-login" value="登录" style="float:center">
				</div>
				<div class="login-account">
					<span class="msg">现在还没有账号 ?</span>
					<a href="#" id="show-signup" class="link">去注册</a>
				</div>
			</div>
			</form>
		</div>

		<div class="container container-signup animated fadeIn">
			<h3 class="text-center">注册</h3>
			<form action="RegisterServlet" method="post">
			<div class="login-form">
				<div class="form-group form-floating-label">
					<input id="username1" type="text" oninput="checkUsername()"  name="username1"  class="form-control input-border-bottom" required>
					<label for="fullname" class="placeholder">用户名</label>
					<span id="s_username" style="color:red;font-size:13px" class="error"></span>
				</div>
				<div class="form-group form-floating-label">
					<input id="nickname"  name="nickname" oninput="checkNickName()" type="text" class="form-control input-border-bottom" required>
					<label for="email" class="placeholder">昵称</label>
					<span id="s_nickname" style="color:red;font-size:13px" class="error"></span>
				</div>
				<div class="form-group form-floating-label">
					<input id="pass" name="pass" oninput="checkPass()" type="password" class="form-control input-border-bottom" required>
					<label for="passwordsignin" class="placeholder">密码</label>
					<span id="s_password" style="color:red;font-size:13px" class="error"></span>
				</div>
				<div class="form-group form-floating-label">
					<input id="spassword" name="spassword" type="password" oninput="checkSPass()" class="form-control input-border-bottom" required>
					<label for="confirmpassword" class="placeholder">确认密码</label>
					<span id="s_spassword" style="color:red;font-size:13px" class="error"></span>
				</div>
				
				<div class="row form-sub m-0">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" name="agree" id="agree">
						<label class="custom-control-label" for="agree">我同意这些条款并注册</label>
					</div>
				</div>
				<div class="form-action">
					<input type="reset" class="btn btn-danger btn-rounded btn-login mr-3" value="重置">
					<input type="submit" id="regBtn" disabled="disabled" class="btn btn-primary btn-rounded btn-login" value="注册">
				</div>
			</div>
			</form>
		</div>
	</div>
	<script src="assets/js/core/jquery.3.2.1.min.js"></script>
	<script src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="assets/js/core/popper.min.js"></script>
	<script src="assets/js/core/bootstrap.min.js"></script>
	<script src="assets/js/ready.js"></script>
	
	<script src="assets/js/jquery-1.8.2.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.backstretch.min.js"></script>
    <script src="assets/js/scripts.js"></script>
</body>
</html>