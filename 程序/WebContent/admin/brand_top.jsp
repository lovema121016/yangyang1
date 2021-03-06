<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dao.BrandDao"%>
<%@page import="com.model.Brand"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Timestamp" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>品牌排行榜</title>
	<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
	<link rel="icon" href="../assets/img/icon.ico" type="image/x-icon"/>
	
	<!-- Fonts and icons -->
	<script src="../assets/js/plugin/webfont/webfont.min.js"></script>
	<script>
		WebFont.load({
			google: {"families":["Open+Sans:300,400,600,700"]},
			custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands"], urls: ['../../assets/css/fonts.css']},
			active: function() {
				sessionStorage.fonts = true;
			}
		});
	</script>

	<!-- CSS Files -->
	<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="../assets/css/azzara.min.css">
	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link rel="stylesheet" href="../assets/css/demo.css">
</head>
<body>
	<div class="wrapper">
		<!--
				Tip 1: You can change the background color of the main header using: data-background-color="blue | purple | light-blue | green | orange | red"
		-->
		<div class="main-header" data-background-color="purple">
			<!-- Logo Header -->
			<div class="logo-header">
				
				<a href="../index.html" class="logo">
					<img src="../img/logo2.png" alt="navbar brand" style="height:80px" class="navbar-brand">
				</a>
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon">
						<i class="fa fa-bars"></i>
					</span>
				</button>
				<button class="topbar-toggler more"><i class="fa fa-ellipsis-v"></i></button>
				<div class="navbar-minimize">
					<button class="btn btn-minimize btn-rounded">
						<i class="fa fa-bars"></i>
					</button>
				</div>
			</div>
			<!-- End Logo Header -->

			<!-- Navbar Header -->
			<nav class="navbar navbar-header navbar-expand-lg">
				
				<div class="container-fluid">
					<div class="collapse" id="search-nav">
						<form class="navbar-left navbar-form nav-search mr-md-3">
							<div class="input-group">
								<div class="input-group-prepend">
									<button type="submit" class="btn btn-search pr-1">
										<i class="fa fa-search search-icon"></i>
									</button>
								</div>
								<input type="text" placeholder="查找 ..." class="form-control">
							</div>
						</form>
					</div>
					<ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
						<li class="nav-item toggle-nav-search hidden-caret">
							<a class="nav-link" data-toggle="collapse" href="#search-nav" role="button" aria-expanded="false" aria-controls="search-nav">
								<i class="fa fa-search"></i>
							</a>
						</li>
						<li class="nav-item dropdown hidden-caret">
							<a class="nav-link dropdown-toggle" href="#" id="messageDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fa fa-envelope"></i>
							</a>
							<ul class="dropdown-menu messages-notif-box animated fadeIn" aria-labelledby="messageDropdown">
								<li>
									<div class="dropdown-title d-flex justify-content-between align-items-center">
										消息 									
										<a href="#" class="small">全部标为已读</a>
									</div>
								</li>
								<li>
									<div class="message-notif-scroll scrollbar-outer">
										<div class="notif-center">
											<a href="#">
												<div class="notif-img"> 
													<img src="../assets/img/jm_denis.jpg" alt="Img Profile">
												</div>
												<div class="notif-content">
													<span class="subject">Jimmy Denis</span>
													<span class="block">
														How are you ?
													</span>
													<span class="time">5 minutes ago</span> 
												</div>
											</a>
											<a href="#">
												<div class="notif-img"> 
													<img src="../assets/img/chadengle.jpg" alt="Img Profile">
												</div>
												<div class="notif-content">
													<span class="subject">Chad</span>
													<span class="block">
														Ok, Thanks !
													</span>
													<span class="time">12 minutes ago</span> 
												</div>
											</a>
											<a href="#">
												<div class="notif-img"> 
													<img src="../assets/img/mlane.jpg" alt="Img Profile">
												</div>
												<div class="notif-content">
													<span class="subject">Jhon Doe</span>
													<span class="block">
														Ready for the meeting today...
													</span>
													<span class="time">12 minutes ago</span> 
												</div>
											</a>
											<a href="#">
												<div class="notif-img"> 
													<img src="../assets/img/talha.jpg" alt="Img Profile">
												</div>
												<div class="notif-content">
													<span class="subject">Talha</span>
													<span class="block">
														Hi, Apa Kabar ?
													</span>
													<span class="time">17 minutes ago</span> 
												</div>
											</a>
										</div>
									</div>
								</li>
								<li>
									<a class="see-all" href="javascript:void(0);">See all messages<i class="fa fa-angle-right"></i> </a>
								</li>
							</ul>
						</li>
						<li class="nav-item dropdown hidden-caret">
							<a class="nav-link dropdown-toggle" href="#" id="notifDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fa fa-bell"></i>
								<span class="notification">4</span>
							</a>
							<ul class="dropdown-menu notif-box animated fadeIn" aria-labelledby="notifDropdown">
								<li>
									<div class="dropdown-title">You have 4 new notification</div>
								</li>
								<li>
									<div class="notif-center">
										<a href="#">
											<div class="notif-icon notif-primary"> <i class="fa fa-user-plus"></i> </div>
											<div class="notif-content">
												<span class="block">
													New user registered
												</span>
												<span class="time">5 minutes ago</span> 
											</div>
										</a>
										<a href="#">
											<div class="notif-icon notif-success"> <i class="fa fa-comment"></i> </div>
											<div class="notif-content">
												<span class="block">
													Rahmad commented on Admin
												</span>
												<span class="time">12 minutes ago</span> 
											</div>
										</a>
										<a href="#">
											<div class="notif-img"> 
												<img src="../assets/img/profile2.jpg" alt="Img Profile">
											</div>
											<div class="notif-content">
												<span class="block">
													Reza send messages to you
												</span>
												<span class="time">12 minutes ago</span> 
											</div>
										</a>
										<a href="#">
											<div class="notif-icon notif-danger"> <i class="fa fa-heart"></i> </div>
											<div class="notif-content">
												<span class="block">
													Farrah liked Admin
												</span>
												<span class="time">17 minutes ago</span> 
											</div>
										</a>
									</div>
								</li>
								<li>
									<a class="see-all" href="javascript:void(0);">See all notifications<i class="fa fa-angle-right"></i> </a>
								</li>
							</ul>
						</li>
						<li class="nav-item dropdown hidden-caret">
							<a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false">
								<div class="avatar-sm">
									<img src="../img/duola.jpg" alt="..." class="avatar-img rounded-circle">
								</div>
							</a>
							<ul class="dropdown-menu dropdown-user animated fadeIn">
								<li>
									<div class="user-box">
										<div class="avatar-lg"><img src="../assets/img/profile.jpg" alt="image profile" class="avatar-img rounded"></div>
										<div class="u-text">
											<h4>姚雅丽</h4>
											<p class="text-muted">1328040536@qq.com</p><a href="profile.html" class="btn btn-rounded btn-danger btn-sm">查看资料</a>
										</div>
									</div>
								</li>
								<li>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">个人资料</a>
									<a class="dropdown-item" href="#">收件箱</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">账户设置</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">退出登录</a>
								</li>
							</ul>
						</li>
						
					</ul>
				</div>
			</nav>
			<!-- End Navbar -->
		</div>
		<!-- Sidebar -->
		<div class="sidebar">
			
			<div class="sidebar-wrapper scrollbar-inner">
				<div class="sidebar-content">
					<div class="user">
						<div class="avatar-sm float-left mr-2">
							<img src="../img/duola.jpg" alt="..." class="avatar-img rounded-circle">
						</div>
						<div class="info">
							<a data-toggle="collapse" href="#collapseExample" aria-expanded="true">
								<span>
									姚雅丽
									<span class="user-level">管理员</span>
									<span class="caret"></span>
								</span>
							</a>
							<div class="clearfix"></div>

							<div class="collapse in" id="collapseExample">
								<ul class="nav">
									<li>
										<a href="#profile">
											<span class="link-collapse">个人资料</span>
										</a>
									</li>
									<li>
										<a href="#edit">
											<span class="link-collapse">编辑资料</span>
										</a>
									</li>
									<li>
										<a href="#settings">
											<span class="link-collapse">设置</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<ul class="nav">
						<li class="nav-item active submenu">
							<a data-toggle="collapse" href="#tables">
								<i class="fas fa-table"></i>
								<p>商品管理</p>
								<span class="caret"></span>
							</a>
							<div class="collapse show" id="tables">
								<ul class="nav nav-collapse">
									<li class="active">
										<a href="brand_top.jsp">
											<span class="sub-item">品牌排行榜</span>
										</a>
									</li>
									<li>
										<a href="hufupin.jsp">
											<span class="sub-item">国产护肤品</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
						<li class="nav-item">
							<a data-toggle="collapse" href="#charts">
								<i class="far fa-chart-bar"></i>
								<p>图表</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="charts">
								<ul class="nav nav-collapse">
									<li class="active">
										<a href="chart.jsp">
											<span class="sub-item">Chart Js</span>
										</a>
									</li>
									<li>
										<a href="../charts/sparkline.html">
											<span class="sub-item">Sparkline</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="main-panel">
			<div class="content">
				<div class="page-inner">
					<div class="page-header">
						<h4 class="page-title">商品管理</h4>
						<ul class="breadcrumbs">
							<li class="nav-home">
								<a href="#">
									<i class="flaticon-home"></i>
								</a>
							</li>
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="#">商品管理</a>
							</li>
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="#">国产品牌</a>
							</li>
						</ul>
					</div>
					
					        <div class="card-header" style="background-color:white">
									<div class="d-flex align-items-center">
										<button class="btn btn-primary btn-round ml-auto" data-toggle="modal" data-target="#addRowModal">
											<i class="fa fa-plus"></i>
											添加新品牌
										</button>
									</div>
							</div>
					      <div class="card-body">
									<!-- Modal -->
									<div class="modal fade" id="addRowModal" tabindex="-1" role="dialog" aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header no-bd">
													<h5 class="modal-title">
														<span class="fw-mediumbold">
														添加</span> 
														<span class="fw-light">
															新的品牌
														</span>
													</h5>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<p class="small">输入新品牌信息</p>
													<form action="../AddBrandServlet" method="post">
														<div class="row">
															<div class="col-sm-12">
																<div class="form-group form-group-default">
																	<label>品牌名称</label>
																	<input id="addName" name="brand" type="text" class="form-control" placeholder="请填写品牌名称" required>
																</div>
															</div>
															<div class="col-md-6 pr-0">
																<div class="form-group form-group-default">
																	<label>品牌类别</label>
																	<select name="type" style="width:200px;">
																	    <option value="护肤品">护肤品</option>
																	    <option value="护肤品">运动</option>
                                                                   </select>
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group form-group-default">
																	<label>描述</label>
																	<input id="addOffice" name="remark" type="text" class="form-control" placeholder="简要描述该品牌" required>
																</div>
															</div>
														</div>
														<div class="modal-footer no-bd">
														 <input type="submit" class="btn btn-primary" value="提交">
														 <input type="reset" class="btn btn-danger" value="重置">
												        </div>
													</form>
												</div>
												
											</div>
										</div>
									</div>			
					</div>
                   </div>
					<div class="row">
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<div class="card-title">护肤品</div>
								</div>
								<div class="card-body">
									<div class="card-sub">									
										国产护肤品品牌 :
									</div>
									<table class="table mt-3">
										<thead>
											<tr>
												<th scope="col">序号</th>
												<th scope="col">品牌名</th>
												<th scope="col">删除</th>
											</tr>
										</thead>
										<tbody>
										<%
										    BrandDao bd=new BrandDao();
										    List<Brand> brands=bd.loadType("护肤品");
										    int i=1;
										    for(Brand brand:brands)
										    {
										    	
										%>
											<tr>
												<td><%=i %></td>
												<td><%=brand.getBrand() %></td>
												<td>
														<div class="form-button-action">
															
															<a href="../DeleteBrand?id=<%=brand.getBrand() %>" onClick="return confirm('确定删除?');">
															<button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="删除">
																<i class="fa fa-times"></i>
															</button>
															</a>
														</div>
												</td>
											</tr>
											<%
											i++;
										    }
											%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<div class="card-title">运动</div>
								</div>
								<div class="card-body">
								    <div class="card-sub">
										国产运动品牌
									</div>
									<table class="table table-hover">
										<thead>
											<tr>
												<th scope="col">序号</th>
												<th scope="col">品牌名</th>
												<th scope="col">删除</th>
											</tr>
										</thead>
										<tbody>
											<%
										    List<Brand> brands1=bd.loadType("运动");
										    int j=1;
										    for(Brand brand:brands1)
										    {
										    	
										%>
											<tr>
												<td><%=i %></td>
												<td><%=brand.getBrand() %></td>
												<td>
														<div class="form-button-action">
															
															<a href="../../DeleteBrand?id=<%=brand.getBrand() %>" onClick="return confirm('确定删除?');">
															<button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="删除">
																<i class="fa fa-times"></i>
															</button>
															</a>
														</div>
												</td>
											</tr>
											<%
											j++;
										    }
											%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Custom template | don't include it in your project! -->
		<div class="custom-template">
				<div class="title">Settings</div>
				<div class="custom-content">
					<div class="switcher">
						<div class="switch-block">
							<h4>Topbar</h4>
							<div class="btnSwitch">
								<button type="button" class="changeMainHeaderColor" data-color="blue"></button>
								<button type="button" class="selected changeMainHeaderColor" data-color="purple"></button>
								<button type="button" class="changeMainHeaderColor" data-color="light-blue"></button>
								<button type="button" class="changeMainHeaderColor" data-color="green"></button>
								<button type="button" class="changeMainHeaderColor" data-color="orange"></button>
								<button type="button" class="changeMainHeaderColor" data-color="red"></button>
							</div>
						</div>
						<div class="switch-block">
							<h4>Background</h4>
							<div class="btnSwitch">
								<button type="button" class="changeBackgroundColor" data-color="bg2"></button>
								<button type="button" class="changeBackgroundColor selected" data-color="bg1"></button>
								<button type="button" class="changeBackgroundColor" data-color="bg3"></button>
							</div>
						</div>
					</div>
				</div>
				<div class="custom-toggle">
					<i class="flaticon-settings"></i>
				</div>
			</div>
		<!-- End Custom template -->
	</div>
	<!--   Core JS Files   -->
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
	<!-- Azzara JS -->
	<script src="../assets/js/ready.min.js"></script>
	<!-- Azzara DEMO methods, don't include it in your project! -->
	<script src="../assets/js/setting-demo.js"></script>
	<script>
		$('#displayNotif').on('click', function(){
			var placementFrom = $('#notify_placement_from option:selected').val();
			var placementAlign = $('#notify_placement_align option:selected').val();
			var state = $('#notify_state option:selected').val();
			var style = $('#notify_style option:selected').val();
			var content = {};

			content.message = 'Turning standard Bootstrap alerts into "notify" like notifications';
			content.title = 'Bootstrap notify';
			if (style == "withicon") {
				content.icon = 'fa fa-bell';
			} else {
				content.icon = 'none';
			}
			content.url = 'index.html';
			content.target = '_blank';

			$.notify(content,{
				type: state,
				placement: {
					from: placementFrom,
					align: placementAlign
				},
				time: 1000,
			});
		});
	</script>
	
	<script>

    function add() {
        document.getElementById('contes').style.display = 'block';
    }

</script>
</body>
</html>