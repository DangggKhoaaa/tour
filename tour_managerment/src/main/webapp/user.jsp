<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/06/2023
  Time: 2:40 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Tour Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <meta name="author" content=""/>

    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content=""/>
    <meta name="twitter:image" content=""/>
    <meta name="twitter:url" content=""/>
    <meta name="twitter:card" content=""/>

    <link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">

    <!-- Animate.css -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="css/bootstrap.css">

    <!-- Magnific Popup -->
    <link rel="stylesheet" href="css/magnific-popup.css">

    <!-- Flexslider  -->
    <link rel="stylesheet" href="css/flexslider.css">

    <!-- Owl Carousel -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">

    <!-- Date Picker -->
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <!-- Flaticons  -->
    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

    <!-- Theme style  -->
    <link rel="stylesheet" href="css/style.css">

    <!-- Modernizr JS -->
    <script src="js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="js/respond.min.js"></script>
    <![endif]-->

</head>
<body>

<%--<h1>${message}</h1>--%>
<%--<h3>Xin chào ${user.name}!</h3>--%>
<%--<a href="information.jsp">Thông tin cá nhân</a>--%>
<%--<br>--%>
<%--<a href="/user?action=updatePassword&id=${user.id}">Đổi mật khẩu</a>--%>
<%--<br>--%>
<%--<a href="/user?action=updateInfo&id=${user.id}">Đổi thông tin cá nhân</a>--%>
<%--<br>--%>
<%--<a href="login.jsp">Đăng xuất</a>--%>
<%--</body>--%>
<%--</html>--%>

<input type="hidden" name="user_id" value="${user.id}">
<div class="colorlib-loader"></div>


<div id="page">
    <nav class="colorlib-nav" role="navigation">
        <div class="top-menu">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xs-2">
                        <div id="colorlib-logo"><a href="user?action=userPage">Tour</a></div>
                    </div>
                    <div class="col-xs-10 text-right menu-1">
                        <ul>
                            <li><a>Hello ${user.name}!</a></li>
                            <li><a href="user?action=cart&user_id=${user.id}">Card</a></li>
                            <%--                            <li class="has-dropdown active">--%>
                            <%--                                <a href="tours.html">Tours</a>--%>
                            <%--                                <ul class="dropdown">--%>
                            <%--                                    <li><a href="#">Destination</a></li>--%>
                            <%--                                    <li><a href="#">Cruises</a></li>--%>
                            <%--                                    <li><a href="#">Hotels</a></li>--%>
                            <%--                                    <li><a href="#">Booking</a></li>--%>
                            <%--                                </ul>--%>
                            <%--                            </li>--%>
                            <li><a href="information.jsp">Infomation</a></li>
                            <li><a href="user?action=updatePassword&id=${user.id}">Change Password</a></li>
                            <li><a href="user?action=updateInfo&id=${user.id}">Change Infomation</a></li>
                            <li><a onclick="return confirm('Are you sure log out account?')" href="user?action=home">Log Out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <aside id="colorlib-hero">
        <div class="flexslider">
            <ul class="slides">
                <li style="background-image: url(images/img_bg_3.jpg);">
                    <div class="overlay"></div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
                                <div class="slider-text-inner text-center">
                                    <h2>by colorlib.com</h2>
                                    <h1>Find Tours</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </aside>

    <div class="colorlib-wrap">
        <div class="container">
            <div class="row">
                <div class="col-md-9">
                    <div class="row">
                        <div class="wrap-division">
                            <c:forEach items="${tours}" var="tour">
                                <a href="tours?action=booking&user_id=${user.id}&tour_id=${tour.tour_id}">
                                    <div class="col-md-6 col-sm-6 animate-box">
                                        <div class="tour">
                                            <a href="tours?action=booking&user_id=${user.id}&tour_id=${tour.tour_id}"
                                               class="tour-img" style="background-image: url(${tour.img});">
                                                <p class="price"><span><fmt:formatNumber type="number"
                                                                                         value="${tour.price}"/> VND</span>
                                                    <small>/ ${tour.start_time}</small></p>
                                            </a>
                                            <span class="desc">
                          <p class="star"><span><i class="icon-star-full"></i><i class="icon-star-full"></i><i
                                  class="icon-star-full"></i><i class="icon-star-full"></i><i
                                  class="icon-star-full"></i></span> 545 Reviews</p>
                                                <p class="star">${tour.tour_tag}</p>
                          <h2>${tour.name}</h2>
                          <span class="city">
                                  ${tour.description}
                          </span>
<%--                        <span class="city">${tour.tour_tag}</span>--%>
                      </span>
                                        </div>
                                    </div>
                                </a>
                            </c:forEach>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="pagination">
<%--                                <li class="disabled"><a href="#">&laquo;</a></li>--%>

                                <c:forEach begin="1" end="${pageable.totalPage}" var="page">
                                    <li class="active"><a href="tours?action=searchTour&page=${page}&search=${pageable.search}">${page}</a></li>
                                </c:forEach>
<%--                                <li><a href="#">&raquo;</a></li>--%>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- SIDEBAR-->
                <div class="col-md-3">
                    <div class="sidebar-wrap">
                        <div class="side search-wrap animate-box">
                            <h3 class="sidebar-heading">Find your tour</h3>
                            <form method="post" action="/tours?action=searchTour" class="colorlib-form">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="date">Where:</label>
                                            <div class="form-field">
                                                <input type="search" name="search" id="search"
                                                       value="${pageable.search}" onsearch="onClearSearch()"/>
                                            </div>
                                        </div>
                                    </div>
<%--                                    <div class="col-md-12">--%>
<%--                                        <div class="form-group">--%>
<%--                                            <label for="date">Check-in:</label>--%>
<%--                                            <div class="form-field">--%>
<%--                                                <i class="icon icon-calendar2"></i>--%>
<%--                                                <input type="text" id="date" class="form-control date"--%>
<%--                                                       placeholder="Check-in date">--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-md-12">--%>
<%--                                        <div class="form-group">--%>
<%--                                            <label for="date">Check-out:</label>--%>
<%--                                            <div class="form-field">--%>
<%--                                                <i class="icon icon-calendar2"></i>--%>
<%--                                                <input type="text" id="date" class="form-control date"--%>
<%--                                                       placeholder="Check-out date">--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-md-12">--%>
<%--                                        <div class="form-group">--%>
<%--                                            <label for="guests">Guest</label>--%>
<%--                                            <div class="form-field">--%>
<%--                                                <i class="icon icon-arrow-down3"></i>--%>
<%--                                                <select name="people" id="people" class="form-control">--%>
<%--                                                    <option value="#">1</option>--%>
<%--                                                    <option value="#">2</option>--%>
<%--                                                    <option value="#">3</option>--%>
<%--                                                    <option value="#">4</option>--%>
<%--                                                    <option value="#">5+</option>--%>
<%--                                                </select>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
                                    <div class="col-md-12">
                                        <button id="searchButton">Search</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="side animate-box">
                            <div class="row">
                                <div class="col-md-12">
                                    <h3 class="sidebar-heading">Price Range</h3>
                                    <form method="post" class="colorlib-form-2">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="guests">Price from:</label>
                                                    <div class="form-field">
                                                        <i class="icon icon-arrow-down3"></i>
                                                        <select name="people" id="people" class="form-control">
                                                            <option value="#">1</option>
                                                            <option value="#">200</option>
                                                            <option value="#">300</option>
                                                            <option value="#">400</option>
                                                            <option value="#">1000</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="guests">Price to:</label>
                                                    <div class="form-field">
                                                        <i class="icon icon-arrow-down3"></i>
                                                        <select name="people" id="people" class="form-control">
                                                            <option value="#">2000</option>
                                                            <option value="#">4000</option>
                                                            <option value="#">6000</option>
                                                            <option value="#">8000</option>
                                                            <option value="#">10000</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="side animate-box">
                            <div class="row">
                                <div class="col-md-12">
                                    <h3 class="sidebar-heading">Review Rating</h3>
                                    <form method="post" class="colorlib-form-2">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">
                                                <p class="rate"><span><i class="icon-star-full"></i><i
                                                        class="icon-star-full"></i><i class="icon-star-full"></i><i
                                                        class="icon-star-full"></i><i class="icon-star-full"></i></span>
                                                </p>
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">
                                                <p class="rate"><span><i class="icon-star-full"></i><i
                                                        class="icon-star-full"></i><i class="icon-star-full"></i><i
                                                        class="icon-star-full"></i></span></p>
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">
                                                <p class="rate"><span><i class="icon-star-full"></i><i
                                                        class="icon-star-full"></i><i class="icon-star-full"></i></span>
                                                </p>
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">
                                                <p class="rate"><span><i class="icon-star-full"></i><i
                                                        class="icon-star-full"></i></span></p>
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">
                                                <p class="rate"><span><i class="icon-star-full"></i></span></p>
                                            </label>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="side animate-box">
                            <div class="row">
                                <div class="col-md-12">
                                    <h3 class="sidebar-heading">Location</h3>
                                    <form method="post" class="colorlib-form-2">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">
                                                <h4 class="place">Greece</h4>
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">
                                                <h4 class="place">Italy</h4>
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">
                                                <h4 class="place">Spain</h4>
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">
                                                <h4 class="place">Germany</h4>
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">
                                                <h4 class="place">Japan</h4>
                                            </label>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div id="colorlib-subscribe" style="background-image: url(images/img_bg_2.jpg);"
         data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3 text-center colorlib-heading animate-box">
                    <h2>Sign Up for a Newsletter</h2>
                    <p>Sign up for our mailing list to get latest updates and offers.</p>
                    <form class="form-inline qbstp-header-subscribe">
                        <div class="row">
                            <div class="col-md-12 col-md-offset-0">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="email" placeholder="Enter your email">
                                    <button type="submit" class="btn btn-primary">Subscribe</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <footer id="colorlib-footer" role="contentinfo">
        <div class="container">
            <div class="row row-pb-md">
                <div class="col-md-3 colorlib-widget">
                    <h4>Tour Agency</h4>
                    <p>Facilis ipsum reprehenderit nemo molestias. Aut cum mollitia reprehenderit. Eos cumque dicta
                        adipisci architecto culpa amet.</p>
                    <p>
                    <ul class="colorlib-social-icons">
                        <li><a href="#"><i class="icon-twitter"></i></a></li>
                        <li><a href="#"><i class="icon-facebook"></i></a></li>
                        <li><a href="#"><i class="icon-linkedin"></i></a></li>
                        <li><a href="#"><i class="icon-dribbble"></i></a></li>
                    </ul>
                    </p>
                </div>
                <div class="col-md-2 colorlib-widget">
                    <h4>Book Now</h4>
                    <p>
                    <ul class="colorlib-footer-links">
                        <li><a href="#">Flight</a></li>
                        <li><a href="#">Hotels</a></li>
                        <li><a href="#">Tour</a></li>
                        <li><a href="#">Car Rent</a></li>
                        <li><a href="#">Beach &amp; Resorts</a></li>
                        <li><a href="#">Cruises</a></li>
                    </ul>
                    </p>
                </div>
                <div class="col-md-2 colorlib-widget">
                    <h4>Top Deals</h4>
                    <p>
                    <ul class="colorlib-footer-links">
                        <li><a href="#">Edina Hotel</a></li>
                        <li><a href="#">Quality Suites</a></li>
                        <li><a href="#">The Hotel Zephyr</a></li>
                        <li><a href="#">Da Vinci Villa</a></li>
                        <li><a href="#">Hotel Epikk</a></li>
                    </ul>
                    </p>
                </div>
                <div class="col-md-2">
                    <h4>Blog Post</h4>
                    <ul class="colorlib-footer-links">
                        <li><a href="#">The Ultimate Packing List For Female Travelers</a></li>
                        <li><a href="#">How These 5 People Found The Path to Their Dream Trip</a></li>
                        <li><a href="#">A Definitive Guide to the Best Dining and Drinking Venues in the City</a></li>
                    </ul>
                </div>

                <div class="col-md-3 col-md-push-1">
                    <h4>Contact Information</h4>
                    <ul class="colorlib-footer-links">
                        <li>291 South 21th Street, <br> Suite 721 New York NY 10016</li>
                        <li><a href="tel://1234567920">+ 1235 2355 98</a></li>
                        <li><a href="mailto:info@yoursite.com">info@yoursite.com</a></li>
                        <li><a href="#">yoursite.com</a></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <p>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                        All rights reserved | This template is made with <i class="icon-heart2" aria-hidden="true"></i>
                        by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></span>
                        <span class="block">Demo Images: <a href="http://unsplash.co/" target="_blank">Unsplash</a> , <a
                                href="http://pexels.com/" target="_blank">Pexels.com</a></span>
                    </p>
                </div>
            </div>
        </div>
    </footer>
</div>

<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
</div>
<script>
    function onClearSearch() {
        searchButton.click();
    }
</script>

<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="js/jquery.waypoints.min.js"></script>
<!-- Flexslider -->
<script src="js/jquery.flexslider-min.js"></script>
<!-- Owl carousel -->
<script src="js/owl.carousel.min.js"></script>
<!-- Magnific Popup -->
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/magnific-popup-options.js"></script>
<!-- Date Picker -->
<script src="js/bootstrap-datepicker.js"></script>
<!-- Stellar Parallax -->
<script src="js/jquery.stellar.min.js"></script>

<!-- Main -->
<script src="js/main.js"></script>

</body>
</html>