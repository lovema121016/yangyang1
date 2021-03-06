<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	</head>
<body>
<%
   String wangye=request.getParameter("id");
%>
   <div style="margin:auto;width:60%;text-align:center;margin-top:130px">
       <img  src="img/error.jpg" style="width:30%;height:30%;border-radius:160px;float:left">
       <div style="float:left;margin-top:100px">
          <p style="color:gray;font-family:微软雅黑">网络开小差了，小二在紧急处理，稍后再来哦！</p>
          <br>
          <a href="<%=wangye %>"><button style="width:70px;height:27px;background-color:#FF8000;color:white" value="返回">返回</button></a>
       </div>
   </div>
</body>
</html>