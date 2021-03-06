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
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>发布文章</title>
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
	 
	 
	 <link rel="stylesheet" href="../layui/css/layui.css" />
	 <script type="text/javascript" src="../layui/layui.js"></script>
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
    <script src="release/wangEditor.min.js"></script>
    <script src="release/wangEditor.js"></script>
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
                  <li class="breadcrumb-item"><a href="#">首页</a></li>
                  <li aria-current="page" class="breadcrumb-item active">发布历史</li>
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
                  <a href="my_like_article.jsp" class="nav-link"><i class="fa fa-heart"></i> 我的收藏文章</a>
                  <a href="focus_users.jsp" class="nav-link"><i class="fa fa-heart"></i> 我的关注</a>
                  <a href="fabu_article.jsp" class="nav-link active"><i class="fa fa-user"></i> 发布文章</a>
                  <a href="fabu_history.jsp" class="nav-link"><i class="fa fa-user"></i> 发布历史</a>
                  <a href="../Logout" class="nav-link"><i class="fa fa-sign-out"></i> 退出登录</a>
                  </ul>
                </div>
              </div>
              <!-- /.col-lg-3-->
              <!-- *** CUSTOMER MENU END ***-->
            </div>
            
            <div class="col-lg-9">
              <div id="contact" class="box">
                <h2>写文章</h2>
                <hr>
           <form id="goodform" class="layui-form" action="release_info.jsp" method="get" >
			<div class="layui-form-item">
				<label class="layui-form-label">文章标题</label>
				<div class="layui-inline" style="width:67%;">
					<input  type="text" name="title" class="layui-input" required>
				</div>
				<label class="tip"></label>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">文章类别</label>
				<div class="layui-inline" style="width:67%;">
					<select name="catagory" style="height:30px;width:150px;">	
						<option>护肤品</option>
						<option>运动</option>
						<option>其他</option>					
					</select>
				</div>
			</div>
			<div id="imgframe"></div>
			<div class="layui-form-item">
    			<label class="layui-form-label">商品图片</label>
    			 <img id="xmTanImg" style="width:200px;height:200px" src="../img/49573c62ab5cd23.jpg" onclick="F_Open_dialog()" />
    			<input style="display:none" name="header" type="file" id="xdaTanFileImg" onchange="xmTanUploadImg(this)" accept="image/*"/>
    			<input type="hidden" size="60" id="name" name="nam" value="" />
    			<a class="layui-btn" id="img_btn">
  					<i class="layui-icon">&#xe67c;</i>添加图片
				</a>
    		</div>
    		<div id="imgframe"></div>
			<div class="layui-form-item">
				<label class="layui-form-label">文章内容</label>
				<div class="layui-inline" style="width:100%">
	               <div> 
                      <span class="col-lg-8" id="editor"></span>
                   </div>
                     <input type="hidden" name="content" id="editor_txt">
      
     
				    
				</div>
				<label class="tip"></label>
			</div>
			<script>
			   content=CKEDITOR.replace("content");
			</script>
			<div class="layui-form-item" style="text-align:center;">
				<div class="layui-inline">
					<a id="btn" disabled="disabled" class="layui-btn">发布商品</a>
					<button id="btn2" style="display:none">提交</button>
				</div>
			</div>
			<script type="text/javascript">
      var E = window.wangEditor;
      var editor = new E('#editor');
      // 配置服务器端地址
      editor.customConfig.uploadImgServer = '/upload'
      //editor.create();
      // 自定义菜单配置
      editor.customConfig.menus = [
          'head',  // 标题
          'bold',  // 粗体
          'fontSize',  // 字号
          'fontName',  // 字体
          'italic',  // 斜体
          'underline',  // 下划线
          'strikeThrough',  // 删除线
          'foreColor',  // 文字颜色
          'backColor',  // 背景颜色
          'link',  // 插入链接
          'list',  // 列表
          'justify',  // 对齐方式
          'quote',  // 引用
          'emoticon',  // 表情
          'image',  // 插入图片
          'table',  // 表格
          'video',  // 插入视频
          'code',  // 插入代码
          'undo',  // 撤销
          'redo'  // 重复
      ];
 
      //editor.customConfig.uploadImgServer = '/admin.php/Upload/wang_editor';  // 上传图片到服务器
      editor.customConfig.uploadImgShowBase64 = true;   // 使用 base64 保存图片
      // 3M
      editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
      // 限制一次最多上传 5 张图片
      editor.customConfig.uploadImgMaxLength = 5;
      //自定义文件名
      editor.customConfig.uploadFileName = 'myFileName'
      // 自定义文件名
      //editor.customConfig.uploadFileName = 'editor_img';
      // 将 timeout 时间改为 3s
      editor.customConfig.uploadImgTimeout = 50000;
        
 
      editor.customConfig.uploadImgHooks = {
          before: function (xhr, editor, files) {
              // 图片上传之前触发
              // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，files 是选择的图片文件
 
              // 如果返回的结果是 {prevent: true, msg: 'xxxx'} 则表示用户放弃上传
              // return {
              //     prevent: true,
              //     msg: '放弃上传'
              // }
              // alert("前奏");
          },
          success: function (xhr, editor, result) {
              // 图片上传并返回结果，图片插入成功之后触发
              // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
              // var url = result.data.url;
              // alert(JSON.stringify(url));
              // editor.txt.append(url);
              // alert("成功");
          },
          fail: function (xhr, editor, result) {
              // 图片上传并返回结果，但图片插入错误时触发
              // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
              alert("失败");
          },
          error: function (xhr, editor) {
              // 图片上传出错时触发
              // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
              // alert("错误");
          },
          // 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
          // （但是，服务器端返回的必须是一个 JSON 格式字符串！！！否则会报错）
          customInsert: function (insertImg, result, editor) {
              // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
              // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
              // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
             var url = result.url
              console.log(url);
             //var jsonStrings = encodeURIComponent(url);
             insertImg(url);
             // result 必须是一个 JSON 格式字符串！！！否则报错
          }
      }
      
      editor.create();
 
      
      //获取文本输入的内容
      document.getElementById('btn2').addEventListener('click', function () {
            editor.txt.html(content);
            var content = editor.txt.html();
            console.log(content);
            // 读取 text
              var announcement_mag = editor.txt.text();
              //alert(announcement_mag)    
              document.getElementById('editor_txt').value=content;
            $.ajax({
            url : "http://localhost:8080/User/inserAnnouncements?announcement_mag="+announcement_mag,
            type : "post",
            dataType : "json",
            success : function(data) {
                //alert(data.result);
                
            },
             error : function(msg) {
                    //alert("ajax连接异常：" + msg);
                }
        });
           
      }, false)
      
      </script>
    	</form>
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
	<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
   <script>
     var lastIndex;
   	//表单模块
     layui.use('form', function(){
       var form = layui.form;
       
       //监听提交
       form.on('submit(formDemo)', function(data){
         layer.msg(JSON.stringify(data.field));
         return false;
       });
     });
   	//上传文件模块
   	layui.use('upload', function(){
  var upload = layui.upload;
  
  //执行实例
  var uploadInst = upload.render({
    elem: '#img_btn' //绑定元素
    ,url: 'upload.jsp' //上传接口
    ,done: function(res){
      console.log(res.data.src);
      $("#name").val($("#name").val() + res.data.src + ";");
      //alert('yao');
      $("#btn2").click();
    }
    ,error: function(){
      //请求异常回调
    }
    ,auto:false
    ,bindAction:'#btn'
    ,multiple:true
    ,choose: function(obj){
        //将每次选择的文件追加到文件队列
        var files = obj.pushFile();
        //预读本地文件，如果是多文件，则会遍历。(不支持ie8/9)
        obj.preview(function(index, file, result){
          console.log(index); //得到文件索引
          lastIndex = index.toString().charAt(index.length - 1);
          console.log(file); //得到文件对象
          console.log(result); //得到文件base64编码，比如图片
          var imgframe = document.getElementById("imgframe");
          var imag = document.createElement("img");
          imag.src = result;
          imag.width = "100";
          imag.height = "100"
          imag.style.margin = "5px";
          imgframe.appendChild(imag);
          //这里还可以做一些 append 文件列表 DOM 的操作
          
          //obj.upload(index, file); //对上传失败的单个文件重新上传，一般在某个事件中使用
          //delete files[index]; //删除列表中对应的文件，一般在某个事件中使用
        });
      }
  });
});
     var y="";
     function F_Open_dialog() 
     { 
          document.getElementById("xdaTanFileImg").click(); 
     } 
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
	        y += x.substring(x.lastIndexOf('\\')+1)+";";
	        document.getElementById("name").value = y;
	        $("#imgbtn").removeAttr("disabled");
	        //或者 img.src = this.result;  //e.target == this
	    }
	   reader.readAsDataURL(file);
	}
	function resetimg(){
		var img = document.getElementById("xmTanImg");
        img.src = '../img/49573c62ab5cd23.jpg';
        $("#imgbtn").attr("disabled","disabled");
	}
	var isNameRight = false;
	var isPriceRight = false;

	function checkname() 
	{
		if($("#goodname").val()==null||$("#goodname").val()=="")
		{
			$(".tip").eq(0).html("×");
			$(".tip").eq(0).css({"color":"red"});
			$(".tip").eq(0).attr("title",'请输入名称');
			isNameRight = false;
		}
		else 
		{
			$(".tip").eq(0).html("√");
			$(".tip").eq(0).css({"color":"green"});
			$(".tip").eq(0).attr("title",'');
			isNameRight = true;
		}
		checkAll();
	}
	function checkprice(){
		var price = $("#price").val();
		if($("#price").val()==null||$("#price").val()=="")
		{
			$(".tip").eq(1).html("×");
			$(".tip").eq(1).css({"color":"red"});
			$(".tip").eq(1).attr("title",'请输入价格');
			isPriceRight = false;
		}
		else if(isNaN(price))
		{
			$(".tip").eq(1).html("×");
			$(".tip").eq(1).css({"color":"red"});
			$(".tip").eq(1).attr("title",'输入格式不对');
			isPriceRight = false;
		}
		else {
			$(".tip").eq(1).html("√");
			$(".tip").eq(1).css({"color":"green"});
			$(".tip").eq(1).attr("title",'');
			isPriceRight = true;
		}
		checkAll();
	}

	function checkAll(){
		var flag = isNameRight+isPriceRight;
		if(flag == 2){
			$("#btn2").removeAttr("disabled");
		}else{
			$("#btn2").attr("disabled","disabled");
		}
	}
function amazing(){
	alert();
}
</script>
  </body>
</html> 