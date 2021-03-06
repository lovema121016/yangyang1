
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="user" class="com.model.User" scope="session"/>
<%@page import="com.dao.ArticleDao"%>
<%@page import="com.model.Article"%>
<%@page import="com.dao.BrandDao"%>
<%@page import="com.model.Brand"%>
<%@page import="com.dao.GoodDao"%>
<%@page import="com.model.Good"%>
<%@page import="com.model.Page"%>
<%@page import="com.dao.Article_comment_Dao"%>
<%@page import="com.model.Article_comment"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.Timestamp" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->

<head>
  <!-- =====  BASIC PAGE NEEDS  ===== -->
  <meta charset="utf-8">
  <title>商品查询</title>
  <!-- =====  SEO MATE  ===== -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="distribution" content="global">
  <meta name="revisit-after" content="2 Days">
  <meta name="robots" content="ALL">
  <meta name="rating" content="8 YEARS">
  <meta name="Language" content="en-us">
  <meta name="GOOGLEBOT" content="NOARCHIVE">
  <!-- =====  MOBILE SPECIFICATION  ===== -->
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="viewport" content="width=device-width">
  <!-- =====  CSS  ===== -->
  <link href="css/main.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <link rel="stylesheet" type="text/css" href="css/magnific-popup.css">
  <link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
  <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
  
  
</head>

<body>
  <!-- =====  LODER  ===== -->
  <div class="loder"></div>
  <div class="wrapper">
    <!-- =====  HEADER START  ===== -->
       <jsp:include page="header.jsp" />
    <!-- =====  HEADER END  ===== -->
    <!-- =====  CONTAINER START  ===== -->
    <div class="container">
      <div class="row ">
        <div id="column-left" class="col-sm-4 col-md-4 col-lg-3 ">
          <div id="category-menu" class="navbar collapse in  mb_40" aria-expanded="true" style="" role="button">
           
           <div class="heading-part mtb_20 ">
              <h2 class="main_title">热门品牌</h2>
            </div>
            <div class="nav-responsive">
              
              <ul class="nav  main-navigation collapse in">
              
              <%
              GoodDao gd=new GoodDao();
              List<Good> good_brand=gd.loadHotBrand();
              for(Good good:good_brand)
              {
              %>
                <li><a href="brand_result.jsp?brand=<%=good.getBrand() %>"><%=good.getBrand() %></a></li>
                <%
              }
                %>
              </ul>
            </div>
          </div>
         
           <div class="left-special left-sidebar-widget mb_50">
            <div class="heading-part mb_20 ">
              <h2 class="main_title">优质国货</h2>
            </div>
            <div id="left-special" class="owl-carousel">
              <ul class="row ">
                <%
                                 
                                 List<Good> good_mosts=gd.loadGood();
                                 int i=1;
                            for(Good good:good_mosts)    	 
                            {
                            	if(i<4)
                            	{
                              %>
                <li class="item product-layout-left mb_20">
                  <div class="product-list col-xs-4">
                    <div class="product-thumb">
                      <div class="image product-imageblock"> <a href="detail2.jsp?article_id=<%=good.getId() %>"> <img class="img-responsive" title="iPod Classic" alt="iPod Classic" src="http://localhost:8080/yangyang/img/good/<%=good.getImage() %>"> <img class="img-responsive" title="iPod Classic" alt="iPod Classic" src="http://localhost:8080/yangyang/img/good/<%=good.getImage() %>"> </a> </div>
                    </div>
                  </div>
                  <div class="col-xs-8">
                    <div class="caption product-detail">
                      <h6 class="product-name"><a href="detail2.jsp?article_id=<%=good.getId() %>"><%=good.getName() %></a></h6>
                      <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                      <span class="price"><span class="amount"><span class="currencySymbol">¥</span><%=good.getPrice() %></span>
                      </span>
                    </div>
                  </div>
                </li>
                <%
                            	}
                            	i++;
                    }
                            
                %>
              </ul>
              <ul class="row ">
              <%
              int j=1;
              for(Good good:good_mosts)    	 
              {
            	  if(j>3)
            	  {
              %>
                <li class="item product-layout-left mb_20">
                  <div class="product-list col-xs-4">
                    <div class="product-thumb">
                      <div class="image product-imageblock"> <a href="detail2.jsp?article_id=<%=good.getId() %>"> <img class="img-responsive" title="iPod Classic" alt="iPod Classic" src="http://localhost:8080/yangyang/img/good/<%=good.getImage() %>"> <img class="img-responsive" title="iPod Classic" alt="iPod Classic" src="http://localhost:8080/yangyang/img/good/<%=good.getImage() %>"> </a> </div>
                    </div>
                  </div>
                  <div class="col-xs-8">
                    <div class="caption product-detail">
                      <h6 class="product-name"><a href="detail2.jsp?article_id=<%=good.getId() %>"><%=good.getName() %></a></h6>
                      <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                      <span class="price"><span class="amount"><span class="currencySymbol">¥</span><%=good.getPrice() %></span>
                      </span>
                    </div>
                  </div>
                </li>
                <%
              }
            	  j++;
              }
                %>
                
              </ul>          
            </div>
          </div>
        </div>
        <div class="col-sm-8 col-md-8 col-lg-9 mtb_30">
          <!-- =====  BANNER STRAT  ===== -->
          <div class="breadcrumb ptb_20">
            <h1>国货</h1>
            <ul>
              <li><a href="index.html">首页</a></li>
              <li class="active">国货</li>
            </ul>
          </div>
          <!-- =====  BREADCRUMB END===== -->
          
          <%
          request.setCharacterEncoding("utf-8");
          String good_name=request.getParameter("good_name"); 		  
          String type=request.getParameter("catagory");
          String big_type=request.getParameter("type");
          if(good_name == null || "".equals(good_name)){
        	  good_name = "";        
          }
          if(type == null || "".equals(type)){
        	  type = "";        
          }
          if(big_type == null || "".equals(big_type)){
        	  big_type = "";        
          }
          %>
          <form class="navbar-form" id="for" method="post" action="search.jsp" role="search">
          <div class="category-page-wrapper mb_30">
            <div class="col-xs-6 sort-wrapper">
              <label class="control-label" for="input-sort">选择 :</label>
              <div class="sort-inner">
                <select id="initials" name="type" onchange="Change_second_selectwords();" class="form-control">
                <%
                   if(big_type.equals("")==false){
                %>
                   <option value="<%=big_type %>" selected="selected"><%=big_type %></option>
                <%
                   }
                   else
                   {
                %>
                  <option value="" selected="selected"></option>
                  <%
                   }
                  %>
                  <option value="面部护肤">面部护肤</option>
                  <option value="男士护肤">男士护肤</option>
                  <option value="洗发护发">洗发护发</option>
                  <option value="香水彩妆">香水彩妆</option>
                  <option value="运动鞋包">运动鞋包</option>
                  <option value="运动服饰">运动服饰</option>
                </select>
              </div>
              <span><i class="fa fa-angle-down" aria-hidden="true"></i></span> </div>
            <div class="col-xs-4 page-wrapper">
              <label class="control-label" for="input-limit">选择 :</label>
              <div class="limit">
                <select id="top_domains" name="function" class="form-control" onchange="gradeChange()">
                  <%
                   if(type.equals("")==false){
                %>
                   <option value="<%=type %>" selected="selected"><%=type %></option>
                <%
                   }
                %>
                </select>
              </div>
              <script>
        var first_keywords = {};
        //定义每个字母对应的第二个下拉框
       
        
        first_keywords['面部护肤'] = ['防晒','洁面','精华','礼盒','面膜','乳液面霜','润唇膏','爽肤水','眼霜','卸妆'];
        first_keywords['男士护肤'] = ['防晒','洁面','精华','控油','面膜','乳液面霜','爽肤水','套装礼盒','剃须'];
        first_keywords['洗发护发'] = ['发膜精油','护发素','美发工具','洗发水','洗护套装'];
        first_keywords['香水彩妆'] = ['彩妆工具',
            '彩妆套装',
            '唇彩唇釉',
            '粉底',
            '隔离',
            '睫毛膏',
            '口红唇膏',
            '眉笔眉粉',
            '美甲',
            '男士彩妆',
            '气垫BB',
            '腮红',
            '散粉',
            '香水',
            '眼线',
            '眼影',
            '遮瑕'];
        first_keywords['运动鞋包'] = ['跑步鞋',
           ' 休闲鞋',
           ' 篮球鞋',
           ' 帆布鞋',
            '板鞋',
            '拖鞋',
            '运动包',
            '足球鞋',
            '专项运动鞋',
            '训练鞋'];
        first_keywords['运动服饰'] = ['羽绒服',
           ' 运动套装',
            '运动裤',
            '卫衣/套头衫',
            '棉服',
            '夹克/风衣',
            'T恤',
            '运动配饰',
           ' 健身服',
            '运动背心',
            '运动内衣'];
        //first_keywords['C'] = ['c1', 'c2', 'c3'];
        function Change_second_selectwords() {
            //根据id找到两个下拉框对象
            var target1 = document.getElementById("initials");
            var target2 = document.getElementById("top_domains");
            //得到第一个下拉框的内容
            var selected_initial = target1.options[target1.selectedIndex].value;

            //清空第二个下拉框
            while (target2.options.length) {
                target2.remove(0);
            }
        //根据第一个下拉框的内容找到对应的列表
        var initial_list = first_keywords[selected_initial];
        if (initial_list) {
            for (var i = 0; i < initial_list.length; i++) {
                var item = new Option(initial_list[i], i);
                //将列表中的内容加入到第二个下拉框
                target2.options.add(item);
            }
        }
} 
        </script>
        <script type="text/javascript">
         function gradeChange(){
            var checkText=$("#top_domains").find("option:selected").text();
            //alert(checkText);
            $("#catagory").val(checkText)
         }
</script>
            
            <%
                   if(type.equals("")==false){
                %>
                  <input type="hidden"  name="catagory" value="<%=type %>" id="catagory"/>
                <%
                   }
                   else
                   {
                %>
                <input type="hidden"  name="catagory" id="catagory"/>
                  <%
                   }
                  %>
              <span><i class="fa fa-angle-down" aria-hidden="true"></i></span> </div>
            
            <div class="col-xs-2 text-right list-grid-wrapper">
              <div class="btn-group btn-list-grid">
                <button type="button" id="list-view" class="btn btn-default list-view"></button>
                <button type="button" id="grid-view" class="btn btn-default grid-view active"></button>
              </div>
            </div>
            <div class="form-group" style="margin-top:20px">
            <%
              if(good_name==null)
              {
            %> 
               <input type="text" name="good_name" class="form-control" placeholder="查找商品">
               <%
              }
              else
              {
            	  %>
            	   <input type="text" name="good_name" class="form-control" placeholder="<%=good_name %>"value="<%=good_name %>">
              <%
              }
               %>
             </div>
             <input type="submit" class="btn btn-search">
             <i class="icon-search"></i>
              
            
          </div>
         </form> 
          <div class="row">
          <%
          
          int pageIndex = 1;
          int pageSize = 12;
          try{
              pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
          }catch(Exception e){
          }
              
              String content = request.getParameter("content");
              if(content == null || "".equals(content)){
                  content = "";        
              }
              //List<User> users = userDao.load(content);
              
              //获得pager中保存的list集合
              List<Good> goods=new ArrayList<Good>();
              Page pager=null;
              if(good_name.equals("")&&type.equals(""))
              {
            	 pager = gd.load(content, pageIndex, pageSize);
                 goods = pager.getDatas();
              }
              else if(good_name.equals("")==false&&type.equals(""))
              {
            	  pager = gd.load_good_name(good_name, pageIndex, pageSize);
            	  goods = pager.getDatas();
              }
              else if(good_name.equals("")&&type.equals("")==false)
              {
            	  pager = gd.loadType(type, pageIndex, pageSize);
            	  goods = pager.getDatas();
              }
              else
              {
            	  pager = gd.loadType_Name(type,good_name, pageIndex, pageSize);
            	  goods = pager.getDatas();
              }
          %>
          <%
             for(Good good:goods)
             {
          %>
            <div class="product-layout  product-grid  col-lg-3 col-md-4 col-sm-6 col-xs-12 " style="height:400px">
              <div class="item">
                <div class="product-thumb clearfix mb_30">
                  <div class="image product-imageblock"> <a href="detail2.jsp?article_id=<%=good.getId() %>"> <img data-name="product_image" src="http://localhost:8080/yangyang/img/good/<%=good.getImage() %>" alt="iPod Classic" title="iPod Classic" class="img-responsive" /> <img src="http://localhost:8080/yangyang/img/good/<%=good.getImage() %>" alt="iPod Classic" title="iPod Classic" class="img-responsive" /> </a> </div>
                  <div class="caption product-detail text-left">
                    <h6 data-name="product_name" class="product-name mt_20"><a href="detail2.jsp?article_id=<%=good.getId() %>" title="Casual Shirt With Ruffle Hem"><%=good.getName() %></a></h6>
                    <div class="rating">
                      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span>
                      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span>
                    </div>
                    <span class="price"><span class="amount"><span class="currencySymbol">¥</span><%=good.getPrice() %></span>
                    </span>
                    <p class="product-desc mt_20 mb_60"><%=good.getContent() %> </p>
                    <div class="button-group text-center">
                      <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                      <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                      <div class="compare"><a href="#"><span>Compare</span></a></div>
                      <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <%
             }
            %>
         
         </div>
        
          <div class="pagination-nav text-center mt_50">
            <ul>
              <%
                    int totalPage = pager.getTotalPage();
                    if(pageIndex > 1){
                %>
               <li><a href="search.jsp?pageIndex=<%=pageIndex-1 %>&type=<%=type %>&good_name=<%=good_name %>"><i class="fa fa-angle-left"></i></a></li>
                <%
                    }
                %>
              <li><a href="search.jsp?pageIndex=2&type=<%=type %>&good_name=<%=good_name %>">2</a></li>
              <li><a href="search.jsp?pageIndex=3&type=<%=type %>&good_name=<%=good_name %>">3</a></li>
              <li><a href="search.jsp?pageIndex=4&type=<%=type %>&good_name=<%=good_name %>">4</a></li>
              <li><a href="search.jsp?pageIndex=5&type=<%=type %>&good_name=<%=good_name %>">5</a></li>
              <li><a href="search.jsp?pageIndex=6&type=<%=type %>&good_name=<%=good_name %>">6</a></li>
              <li>...</li>
              <li><a href="search.jsp?pageIndex=<%=totalPage-1 %>&type=<%=type %>&good_name=<%=good_name %>"><%=totalPage-1 %></a></li>
              <li><a href="search.jsp?pageIndex=<%=totalPage %>&type=<%=type %>&good_name=<%=good_name %>"><%=totalPage %></a></li>
              <%
                    if( pageIndex < totalPage){
                %>
                    <li><a href="search.jsp?pageIndex=<%=pageIndex + 1 %>&type=<%=type %>&good_name=<%=good_name %>"><i class="fa fa-angle-right"></i></a></li>
                <%
                    }
                %>
               <li><a href="search.jsp?pageIndex=<%=totalPage%>&type=<%=type %>&good_name=<%=good_name %>">尾页</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div id="brand_carouse" class="ptb_30 text-center">
        <div class="type-01">
          <div class="heading-part mb_20 ">
            <h2 class="main_title">品牌 Logo</h2>
          </div>
          <div class="row">
            <div class="col-sm-12">
              <div class="brand owl-carousel ptb_20">
                <%
                     BrandDao bd=new BrandDao();
                     List<Brand> brands1=bd.loadAll();
                     for(Brand brand:brands1)
                     {
                %>
                   <div class="item text-center"> <a href="brand_result.jsp?brand=<%=brand.getBrand() %>"><img src="http://localhost:8080/yangyang/img/品牌logo/<%=brand.getLogo() %>" style="height:120px; border-radius:100%; overflow:hidden;" alt="Disney" class="img-responsive" /></a> </div>
                <%
                     }
                %>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- =====  CONTAINER END  ===== -->
  </div>
  <a id="scrollup">Scroll</a>
  <script src="js/jQuery_v3.1.1.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.magnific-popup.js"></script>
  <script src="js/custom.js"></script>
  <script src="js/jquery-ui.js"></script>
  
  
  <script>
  $(function() {
    $("#slider-range").slider({
      range: true,
      min: 0,
      max: 500,
      values: [75, 300],
      slide: function(event, ui) {
        $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
      }
    });
    $("#amount").val("$" + $("#slider-range").slider("values", 0) +
      " - $" + $("#slider-range").slider("values", 1));
  });
  </script>
</body>

</html>