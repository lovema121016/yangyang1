<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="user" class="com.model.User" scope="session"/>
<%@page import="com.dao.ArticleDao"%>
<%@page import="com.model.Article"%>
<%@page import="com.dao.BrandDao"%>
<%@page import="com.model.Brand"%>
<%@page import="com.dao.GoodDao"%>
<%@page import="com.model.Good"%>
<%@page import="com.util.Java_Python_test"%>
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
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->

<head>
  <!-- =====  BASIC PAGE NEEDS  ===== -->
  <meta charset="utf-8">
  <title>首页</title>
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
  <!-- favicon -->
       
  <link href="css/main.css" rel="stylesheet" type="text/css" />
  <!-- =====  CSS  ===== -->
  <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <link rel="stylesheet" type="text/css" href="css/magnific-popup.css">
  <link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
  <style>
             .line-limit-length {
                    overflow: hidden;
                    text-overflow: ellipsis;
                    white-space: nowrap; 
               }
        </style>
</head>

<body>
  <!-- =====  LODER  ===== -->
   <jsp:include page="menu.jsp" />
  <div class="wrapper">
    <!-- =====  HEADER START  ===== -->
    <!-- Header -->    
    <!-- =====  HEADER END  ===== -->
    <!-- =====  CONTAINER START  ===== -->
    <div class="container">
      <div class="row ">
        <div id="column-left" class="col-sm-4 col-md-4 col-lg-3 ">
          <div id="category-menu" class="navbar collapse mb_40 hidden-sm-down in" aria-expanded="true" style="" role="button">
            <div class="nav-responsive">
              <ul class="nav  main-navigation collapse in ">
                <li><a href="#">热门文章</a></li>
                <li><a href="#">热门国货</a></li>
                <li><a href="#">国货品牌介绍</a></li>
                <li><a href="#">热门品牌</a></li>
              </ul>
            </div>
          </div>
          <div class="left-cms left-sidebar-widget mb_50">
            <ul>
              
              <li>
                <div class="feature-i-left ptb_40">
                  <div class="icon-right Order"></div>
                  <h6>联系我们</h6>
                  <p>1328040536@qq.com</p>
                </div>
              </li>
             
              
            </ul>
          </div>
          <div class="left-special left-sidebar-widget mb_50">
            <div class="heading-part mb_20 ">
              <h2 class="main_title">优质国货</h2>
            </div>
            <div id="left-special" class="owl-carousel">
              <ul class="row ">
                <%
                           GoodDao gd=new GoodDao();
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
          <div class="Testimonial left-sidebar-widget mb_50">
            <div class="heading-part mb_20 ">
              <h2 class="main_title">核心功能</h2>
            </div>
            <div class="client owl-carousel text-center pt_10">
              <div class="item client-detail">
                <div class="client-avatar"> <img alt="" src="img/china.jpg" style="height:120px; border-radius:100%; overflow:hidden;"> </div>
                <div class="client-title  mt_30"><strong>商品详情</strong></div>
                <div class="client-designation mb_10">分析</div>
                <p><i class="fa fa-quote-left" aria-hidden="true"></i>在这里你可以详细了解每一个国货..</p>
              </div>
              <div class="item client-detail">
                <div class="client-avatar"> <img alt=""  src="img/like.png"style="height:120px; border-radius:100%; overflow:hidden;"> </div>
                <div class="client-title  mt_30"><strong>猜你喜欢</strong></div>
                <div class="client-designation mb_10">推荐</div>
                <p><i class="fa fa-quote-left" aria-hidden="true"></i>在这里你可能会找到你感兴趣的文章、商品..</p>
              </div>
              <div class="item client-detail">
                <div class="client-avatar"> <img alt="" src="img/share.jpg"style="height:120px; border-radius:100%; overflow:hidden;"> </div>
                <div class="client-title  mt_30"><strong>资讯社区</strong></div>
                <div class="client-designation mb_10">分享</div>
                <p><i class="fa fa-quote-left" aria-hidden="true"></i>在这里，可以分享国货购买心得，大家一起交流，探讨优质国货..</p>
              </div>
            </div>
          </div>
          <div class="Tags left-sidebar-widget mb_50">
            <div class="heading-part mb_20 ">
              <h2 class="main_title">标签</h2>
            </div>
            <ul>
              <li><a href="#">美妆</a></li>
              <li><a href="#">护肤</a></li>
              <li><a href="#">国货品牌</a></li>
              <li><a href="#">空间</a></li>
              <li><a href="#">购买心得</a></li>
              <li><a href="#">穿搭</a></li>
              <li><a href="#">潮牌</a></li>
              <li><a href="#">运动</a></li>
              <li><a href="#">户外</a></li>
              <li><a href="#">猜你喜欢</a></li>
              <li><a href="#">排行榜</a></li>
            </ul>
          </div>
        </div>
        <div id="column-right" class="col-sm-8 col-md-8 col-lg-9 mtb_30">
         
          
          <!-- =====  PRODUCT TAB  ===== -->
          <div id="product-tab" class="mt_40">
            <div class="heading-part mb_20 ">
              <h2 class="main_title">国货商品</h2>
            </div>
            <ul class="nav text-right">
              <li class="active"> <a href="#nArrivals" data-toggle="tab">最优</a> </li>
              <li><a href="#Bestsellers" data-toggle="tab">最热</a> </li>
            </ul>
            <div class="tab-content clearfix box">
              <div class="tab-pane active" id="nArrivals">
                <div class="nArrivals owl-carousel">
                  <%
                  List<Good> good_bests=gd.loadGood_best();
                  for(int k=0;k<good_bests.size();k=k+2)    	 
                  {  
                	  Good good=good_bests.get(k);
                	  Good good1=good_bests.get(k+1);
                  %>
                  <div class="product-grid">
                    <div class="item">
                      <div class="product-thumb">
                        <div class="image product-imageblock" > <a href="detail2.jsp?article_id=<%=good.getId() %>" style="width:225.9px;height:289.6px"> <img data-name="product_image"  src="http://localhost:8080/yangyang/img/good/<%=good.getImage() %>" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="http://localhost:8080/yangyang/img/good/<%=good.getImage() %>"  alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a> </div>
                        <div class="caption product-detail text-left">
                          <h6 data-name="product_name" class="product-name mt_20"><a href="detail2.jsp?article_id=<%=good.getId() %>" title="Casual Shirt With Ruffle Hem"><%=good.getName() %></a></h6>
                          <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                          <span class="price"><span class="amount"><span class="currencySymbol">¥</span><%=good.getPrice() %></span>
                          </span>
                          <div class="button-group text-center">
                            <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                            <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                            <div class="compare"><a href="#"><span>Compare</span></a></div>
                            <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="item">
                      <div class="product-thumb">
                        <div class="image product-imageblock" > <a href="detail2.jsp?article_id=<%=good1.getId() %>" style="width:225.9px;height:289.6px"> <img data-name="product_image"  src="http://localhost:8080/yangyang/img/good/<%=good1.getImage() %>" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="http://localhost:8080/yangyang/img/good/<%=good1.getImage() %>"  alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a> </div>
                        <div class="caption product-detail text-left">
                          <h6 data-name="product_name" class="product-name mt_20"><a href="detail2.jsp?article_id=<%=good1.getId() %>" title="Casual Shirt With Ruffle Hem"><%=good1.getName() %></a></h6>
                          <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                          <span class="price"><span class="amount"><span class="currencySymbol">¥</span><%=good1.getPrice() %></span>
                          </span>
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
              </div>
              <div class="tab-pane" id="Bestsellers">
                <div class="Bestsellers owl-carousel">
                   <%
                  List<Good> good_hot=gd.loadGood_hot();
                  for(int k=0;k<good_hot.size();k=k+2)    	 
                  {  
                	  Good good=good_hot.get(k);
                	  Good good1=good_hot.get(k+1);
                  %>
                  <div class="product-grid">
                    <div class="item">
                      <div class="product-thumb">
                        <div class="image product-imageblock" > <a href="detail2.jsp?article_id=<%=good.getId() %>" style="width:225.9px;height:289.6px"> <img data-name="product_image"  src="http://localhost:8080/yangyang/img/good/<%=good.getImage() %>" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="http://localhost:8080/yangyang/img/good/<%=good.getImage() %>"  alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a> </div>
                        <div class="caption product-detail text-left">
                          <h6 data-name="product_name" class="product-name mt_20"><a href="detail2.jsp?article_id=<%=good.getId() %>" title="Casual Shirt With Ruffle Hem"><%=good.getName() %></a></h6>
                          <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                          <span class="price"><span class="amount"><span class="currencySymbol">¥</span><%=good.getPrice() %></span>
                          </span>
                          <div class="button-group text-center">
                            <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                            <div class="quickview"><a href="#"><span>Quick View</span></a></div>
                            <div class="compare"><a href="#"><span>Compare</span></a></div>
                            <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="item">
                      <div class="product-thumb">
                        <div class="image product-imageblock" > <a href="detail2.jsp?article_id=<%=good1.getId() %>" style="width:225.9px;height:289.6px"> <img data-name="product_image"  src="http://localhost:8080/yangyang/img/good/<%=good1.getImage() %>" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="http://localhost:8080/yangyang/img/good/<%=good1.getImage() %>"  alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a> </div>
                        <div class="caption product-detail text-left">
                          <h6 data-name="product_name" class="product-name mt_20"><a href="detail2.jsp?article_id=<%=good1.getId() %>" title="Casual Shirt With Ruffle Hem"><%=good1.getName() %></a></h6>
                          <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                          <span class="price"><span class="amount"><span class="currencySymbol">¥</span><%=good1.getPrice() %></span>
                          </span>
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
              </div>
             
            </div>
          </div>
          <!-- =====  PRODUCT TAB  END ===== -->
          <!-- =====  sale product  ===== -->
          <div id="sale-product">
            <div class="heading-part mb_20 ">
              <h2 class="main_title">品牌介绍</h2>
            </div>
            
            
            <div class="Specials owl-carousel">
            <%
               BrandDao bd=new BrandDao();
               List<Brand> brand_all=bd.loadAll();
               for(Brand brand:brand_all)
               {
            
            %>
              <div class="item product-layout product-list">
                <div class="product-thumb">
                  <div class="image product-imageblock"> <a href="brand_result.jsp?brand=<%=brand.getBrand() %>"> <img data-name="product_image" src="http://localhost:8080/yangyang/img/品牌logo/<%=brand.getLogo() %>" alt="iPod Classic" title="iPod Classic" class="img-responsive"> <img src="http://localhost:8080/yangyang/img/品牌logo/<%=brand.getLogo() %>" alt="iPod Classic" title="iPod Classic" class="img-responsive"> </a> </div>
                  <div class="caption product-detail text-left">
                    <h6 data-name="product_name" class="product-name"><a href="brand_result.jsp?brand=<%=brand.getBrand() %>" title="Casual Shirt With Ruffle Hem"><%=brand.getBrand() %></a></h6>
                    <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i><i class="fa fa-star fa-stack-x"></i></span> </div>
                    <span class="price"><span class="amount"><span class="currencySymbol"></span>品牌简介</span>
                    </span>
                    <p class="product-desc mt_20"><%=brand.getRemark() %></p>
                    <div class="timer mt_80">
                      <div class="days"></div>
                      <div class="hours"></div>
                      <div class="minutes"></div>
                      <div class="seconds"></div>
                    </div>
                    <div class="button-group text-center">
                      <div class="wishlist"><a href="#"><span>wishlist</span></a></div>
                      <div class="quickview"><a href="brand_result.jsp?brand=<%=brand.getBrand() %>"><span>Quick View</span></a></div>
                      <div class="compare"><a href="#"><span>Compare</span></a></div>
                      <div class="add-to-cart"><a href="#"><span>Add to cart</span></a></div>
                    </div>
                  </div>
                </div>
              </div>
              <%
               }
              %>
             
            </div>
          </div>
          <!-- =====  sale product end ===== -->
          <!-- =====  Blog ===== -->
          <div id="Blog" class="mt_40">
            <div class="heading-part mb_20 ">
              <h2 class="main_title">最新文章</h2>
            </div>
            <div class="blog-contain box">
              <div class="blog owl-carousel ">
              <%
                                       ArticleDao ad=new ArticleDao();
                                       Article_comment_Dao acd=new Article_comment_Dao();
                                       List<Article> articles=ad.loadHot();
                                       int top=1;
                                       for (Article article:articles)
                                       {
                                    	    String[] images=article.getImage().split(";");
                                    	    List<Article_comment> ac=acd.load(article.getId());
               %>
                <div class="item">
                  <div class="box-holder">
                    <div class="thumb post-img"><a href="detail.jsp?article_id=<%=article.getId() %>"> <img src="http://localhost:8080/yangyang/img/article/<%=images[0] %>"  style="height:300px" alt="HealthCare"> </a> </div>
                    <div class="post-info mtb_20 ">
                      <div class="posted">
                                        <ul class="posted__icon">
                                            <li>
                                                <span>
                                                <i class="icon-comment-empty"></i><%=ac.size() %>
                                            </span>
                                            </li>
                                            <li>
                                                <span>
                                                <i class="icon-eye"></i><%=article.getLook() %>
                                            </span>
                                            </li>
                                        </ul>
                                    </div>
                      <h6 class="mb_10 text-uppercase" style="margin-top:20px"> <a href="detail.jsp?article_id=<%=article.getId() %>"><%=article.getTitle() %></a> </h6>
                      <p style="display:block;width:30em;word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis; "><%=article.getContent() %></p>
                      <div class="date-time">
                        <div class="day"> </div>
                        <div class="month">评论数</div>
                      </div>
                    </div>
                  </div>
                </div>
                <%
                                    }
                %>
                
               
               
              </div>
            </div>
            <!-- =====  Blog end ===== -->
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
  <script src="js/jquery.firstVisitPopup.js"></script>
  <script src="js/custom.js"></script>
</body>

</html>
