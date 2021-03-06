<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dao.ArticleDao"%>
<%@page import="com.model.Article"%>
<%@page import="com.dao.UserDaoImpl"%>
<%@page import="com.model.User"%>
<%@page import="com.dao.GoodDao"%>
<%@page import="com.model.Good"%>
<%@page import="com.dao.BrandDao"%>
<%@page import="com.model.Brand"%>

<%@page import="com.dao.GoodLikeDao"%>
<%@page import="com.model.GoodLike"%>
<%@page import="com.model.Count"%>
<%@page import="com.dao.Article_comment_Dao"%>
<%@page import="com.model.Article_comment"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Timestamp" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>护肤品管理</title>
	<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
	<link rel="icon" href="../../assets/img/icon.ico" type="image/x-icon"/>
	
	<!-- Fonts and icons -->
	<script src="../../assets/js/plugin/webfont/webfont.min.js"></script>
	<script>
		WebFont.load({
			google: {"families":["Open+Sans:300,400,600,700"]},
			custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands"], urls: ['../../assets/css/fonts.css']},
			active: function() {
				sessionStorage.fonts = true;
			}
		});
	</script>
    
    <script>
 
     function update_confirm(brand)
     {
	   var mymessage=confirm("此操作会清空该品牌的历史数据，是否确认更新？");
	   if(mymessage==true)
	  {
		document.write("这可能会需要很长一段时间，请不要关闭");
		//return true;
	  }
	  else if(mymessage==false)
	  {
		return false;
	  }
}
</script>
	<!-- CSS Files -->
	<link rel="stylesheet" href="../../assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../assets/css/azzara.min.css">
	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link rel="stylesheet" href="../../assets/css/demo.css">
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
					<img src="../../img/logo2.png" alt="navbar brand" style="height:80px" class="navbar-brand">
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
								<input type="text" placeholder="查找" class="form-control">
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
										Messages 									
										<a href="#" class="small">Mark all as read</a>
									</div>
								</li>
								<li>
									<div class="message-notif-scroll scrollbar-outer">
										<div class="notif-center">
											<a href="#">
												<div class="notif-img"> 
													<img src="../../assets/img/jm_denis.jpg" alt="Img Profile">
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
													<img src="../../assets/img/chadengle.jpg" alt="Img Profile">
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
													<img src="../../assets/img/mlane.jpg" alt="Img Profile">
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
													<img src="../../assets/img/talha.jpg" alt="Img Profile">
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
												<img src="../../assets/img/profile2.jpg" alt="Img Profile">
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
									<img src="../../img/duola.jpg" alt="..." class="avatar-img rounded-circle">
								</div>
							</a>
							<ul class="dropdown-menu dropdown-user animated fadeIn">
								<li>
									<div class="user-box">
										<div class="avatar-lg"><img src="../../img/duola.jpg" alt="image profile" class="avatar-img rounded"></div>
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
									<a class="dropdown-item" href="../../login.jsp">退出登录</a>
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
							<img src="../../img/duola.jpg" alt="..." class="avatar-img rounded-circle">
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
											<span class="link-collapse">我的资料</span>
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
									<li >
										<a href="errordata.jsp">
											<span class="sub-item">异常数据</span>
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
							
						</li>
					</ul>
				</div>
			</div>
		</div>
		<%
		String brand=request.getParameter("brand");
		
		%>
		
		<div class="main-panel">
			<div class="content">
				<div class="page-inner">
					<div class="page-header">
						<h4 class="page-title">商品信息</h4>
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
								<a href="brand_top.jsp">品牌排行榜</a>
							</li>
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="#"><%=brand %></a>
							</li>
						</ul>
					</div>
					<h4 class="page-title"><%=brand %></h4>
					<div class="page-category">上次更新时间:2020-03-05. 点击此处，重新更新数据 <a href="../../UpdateBrandDataServlet?brand=<%=brand %>" onClick="return update_confirm()" target="_blank">立刻更新</a>.</div>
					<div class="row">
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<div class="card-title">用户对品牌的关注度</div>
								</div>
								<div class="card-body">
									<div class="chart-container">
										<canvas id="lineChart"></canvas>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<div class="card-title">品牌相关文章曲线</div>
								</div>
								<div class="card-body">
									<div class="chart-container">
										<canvas id="barChart"></canvas>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<div class="card-title">商品好、中、差比例</div>
								</div>
								<div class="card-body">
									<div class="chart-container">
										<canvas id="pieChart" style="width: 50%; height: 50%"></canvas>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<div class="card-title">品牌热词</div>
								</div>
								<div class="card-body">
									<div class="chart-container">
										<canvas id="doughnutChart" style="width: 50%; height: 50%"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">所有商品数据</h4>
								</div>
								
								<div class="card-body">
									<div class="table-responsive">
										<table id="basic-datatables" class="display table table-striped table-hover" >
											<thead>
												<tr>
													<th>标题</th>
													<th>店铺</th>
													<th>价格</th>
													<th>评价数</th>
													<th>好评率</th>
													<th>链接</th>
												</tr>
											</thead>
											<tfoot>
												<tr>
													<th>标题</th>
													<th>店铺</th>
													<th>价格</th>
													<th>评价数</th>
													<th>好评率</th>
													<th>链接</th>
												</tr>
											</tfoot>
											<tbody>
											<%
											   int best=0;
											   int middle=0;
											   int bad=0;
										
											   GoodDao gd=new GoodDao();
			                                   List<Good> goods=gd.loadCountBrand(brand);
			                                   for(Good good:goods)
			                                   {
			                                	   
			                                	   if(good.getGood_rate()<0.6)
			                                	   {
			                                		   bad++;
			                                	   }
			                                	   else if(good.getGood_rate()>=0.6&&good.getGood_rate()<0.9)
			                                	   {
			                                		   middle++;
			                                	   }
			                                	   else
			                                	   {
			                                		   best++;
			                                	   }
											%>
												<tr>
													<td><%=good.getName() %></td>
													<td><%=good.getShop() %></td>
													<td><%=good.getPrice() %></td>
													<td><%=good.getComment_number() %></td>
													<td><%=good.getGood_rate()*100 %>%</td>
													<td><%=good.getLink() %></td>
												</tr>
												<%
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
	<script src="../../assets/js/core/jquery.3.2.1.min.js"></script>
	<script src="../../assets/js/core/popper.min.js"></script>
	<script src="../../assets/js/core/bootstrap.min.js"></script>
	<!-- jQuery UI -->
	<script src="../../assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="../../assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
	<!-- Bootstrap Toggle -->
	<script src="../../assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
	<!-- jQuery Scrollbar -->
	<script src="../../assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
	<!-- Datatables -->
	<script src="../../assets/js/plugin/datatables/datatables.min.js"></script>
	<script src="../../assets/js/plugin/chart.js/chart.min.js"></script>
	<!-- Azzara JS -->
	<script src="../../assets/js/ready.min.js"></script>
	<!-- Azzara DEMO methods, don't include it in your project! -->
	<script src="../../assets/js/setting-demo.js"></script>
	<script >
		$(document).ready(function() {
			$('#basic-datatables').DataTable({
			});

			$('#multi-filter-select').DataTable( {
				"pageLength": 5,
				initComplete: function () {
					this.api().columns().every( function () {
						var column = this;
						var select = $('<select class="form-control"><option value=""></option></select>')
						.appendTo( $(column.footer()).empty() )
						.on( 'change', function () {
							var val = $.fn.dataTable.util.escapeRegex(
								$(this).val()
								);

							column
							.search( val ? '^'+val+'$' : '', true, false )
							.draw();
						} );

						column.data().unique().sort().each( function ( d, j ) {
							select.append( '<option value="'+d+'">'+d+'</option>' )
						} );
					} );
				}
			});

			// Add Row
			$('#add-row').DataTable({
				"pageLength": 5,
			});

			var action = '<td> <div class="form-button-action"> <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

			$('#addRowButton').click(function() {
				$('#add-row').dataTable().fnAddData([
					$("#addName").val(),
					$("#addPosition").val(),
					$("#addOffice").val(),
					action
					]);
				$('#addRowModal').modal('hide');

			});
		});
	</script>
	<script>
		var lineChart = document.getElementById('lineChart').getContext('2d'),
		barChart = document.getElementById('barChart').getContext('2d'),
		pieChart = document.getElementById('pieChart').getContext('2d'),
		doughnutChart = document.getElementById('doughnutChart').getContext('2d');
       <%
          GoodLikeDao gld=new GoodLikeDao();
		  List<Count> counts=gld.load(brand, "2020");
       %>
		var myLineChart = new Chart(lineChart, {
			type: 'line',
			data: {
				labels: [
					
					<%
					  int i=0;
					  for(Count count:counts)
					  { 
						  if(i<counts.size())
						  {
					%>	
					      "<%=count.getDate() %>",	
					<%
						  }
						  else
						  {
					%>	
							  "<%=count.getDate() %>"	
					 <%
							  
						  }
						  i++;
					  }
					%>
					],
				datasets: [{
					label: "关注用户数",
					borderColor: "#1d7af3",
					pointBorderColor: "#FFF",
					pointBackgroundColor: "#1d7af3",
					pointBorderWidth: 2,
					pointHoverRadius: 4,
					pointHoverBorderWidth: 1,
					pointRadius: 4,
					backgroundColor: 'transparent',
					fill: true,
					borderWidth: 2,
					data: [
					<%
					  
					  i=0;
					  for(Count count:counts)
					  {
						  if(i<counts.size())
						  {
					%>	
					      <%=count.getCount() %>,	
					<%
						  }
						  else
						  {
					%>	
							  <%=count.getCount() %>	
					 <%
							  
						  }
						  i++;
					  }
						%>
						]
				}]
			},
			options : {
				responsive: true, 
				maintainAspectRatio: false,
				legend: {
					position: 'bottom',
					labels : {
						padding: 10,
						fontColor: '#1d7af3',
					}
				},
				tooltips: {
					bodySpacing: 4,
					mode:"nearest",
					intersect: 0,
					position:"nearest",
					xPadding:10,
					yPadding:10,
					caretPadding:10
				},
				layout:{
					padding:{left:15,right:15,top:15,bottom:15}
				}
			}
		});
        
		
		<%
		List<Count> counts1=gld.load_article(brand, "2020");
		%>
		var myBarChart = new Chart(barChart, {
			type: 'bar',
			data: {
				labels: [
					<%
					  int j=0;
					  for(Count count:counts1)
					  { 
						  if(j<counts1.size())
						  {
					%>	
					      "<%=count.getDate() %>",	
					<%
						  }
						  else
						  {
					%>	
							  "<%=count.getDate() %>"	
					 <%
							  
						  }
						  j++;
					  }
					%>
				],
				datasets : [{
					label: "2020",
					backgroundColor: 'rgb(23, 125, 255)',
					borderColor: 'rgb(23, 125, 255)',
					data: [
						<%
						 j=0;
						 for(Count count:counts1)
						 {
							 if(j<counts1.size())
							  {
						%>	
						      <%=count.getCount() %>,	
						<%
							  }
							  else
							  {
						%>	
								  <%=count.getCount() %>	
						 <%
								  
							  }
							  j++;
							
						 }
						%>
						],
				}],
			},
			options: {
				responsive: true, 
				maintainAspectRatio: false,
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero:true
						}
					}]
				},
			}
		});

		var myPieChart = new Chart(pieChart, {
			type: 'pie',
			data: {
				datasets: [{
					data: [<%=best %>, <%=middle %>, <%=bad %>],
					backgroundColor :["#1d7af3","#f3545d","#fdaf4b"],
					borderWidth: 0
				}],
				labels: ['好评数', '中评数', '差评数'] 
			},
			options : {
				responsive: true, 
				maintainAspectRatio: false,
				legend: {
					position : 'bottom',
					labels : {
						fontColor: 'rgb(154, 154, 154)',
						fontSize: 11,
						usePointStyle : true,
						padding: 20
					}
				},
				pieceLabel: {
					render: 'percentage',
					fontColor: 'white',
					fontSize: 14,
				},
				tooltips: false,
				layout: {
					padding: {
						left: 20,
						right: 20,
						top: 20,
						bottom: 20
					}
				}
			}
		})

		var myDoughnutChart = new Chart(doughnutChart, {
			type: 'doughnut',
			data: {
				datasets: [{
					data: [1200, 2400, 150],
					backgroundColor: ['#f3545d','#fdaf4b','#1d7af3']
				}],

				labels: [
				'保湿',
				'效果很棒',
				'吸收好'
				]
			},
			options: {
				responsive: true, 
				maintainAspectRatio: false,
				legend : {
					position: 'bottom'
				},
				layout: {
					padding: {
						left: 20,
						right: 20,
						top: 20,
						bottom: 20
					}
				}
			}
		});

		var myLegendContainer = document.getElementById("myChartLegend");

		// generate HTML legend
		myLegendContainer.innerHTML = myHtmlLegendsChart.generateLegend();

		// bind onClick event to all LI-tags of the legend
		var legendItems = myLegendContainer.getElementsByTagName('li');
		for (var i = 0; i < legendItems.length; i += 1) {
			legendItems[i].addEventListener("click", legendClickCallback, false);
		}

	</script>
</body>
</html>