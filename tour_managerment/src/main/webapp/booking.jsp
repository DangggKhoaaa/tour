<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="./assets/css/tailwind.output.css"/>
    <script
            src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
            defer
    ></script>
    <script src="./assets/js/init-alpine.js"></script>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css"
    />
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"
            defer
    ></script>
    <script src="./assets/js/charts-lines.js" defer></script>
    <script src="./assets/js/charts-pie.js" defer></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer">


    <link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">

    <!-- Animate.css -->
    <link rel="stylesheet" href="src/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="src/css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="src/css/bootstrap.css">

    <!-- Magnific Popup -->
    <link rel="stylesheet" href="src/css/magnific-popup.css">

    <!-- Flexslider  -->
    <link rel="stylesheet" href="src/css/flexslider.css">

    <!-- Owl Carousel -->
    <link rel="stylesheet" href="src/css/owl.carousel.min.css">
    <link rel="stylesheet" href="src/css/owl.theme.default.min.css">

    <!-- Date Picker -->
    <link rel="stylesheet" href="src/css/bootstrap-datepicker.css">
    <!-- Flaticons  -->
    <link rel="stylesheet" href="src/fonts/flaticon/font/flaticon.css">

    <!-- Theme style  -->
    <link rel="stylesheet" href="src/css/style.css">

    <!-- Modernizr JS -->
    <script src="src/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="src/js/respond.min.js"></script>
    <![endif]-->

</head>
<body>

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
                        <c:if test="${user.id != null}">
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
                        </c:if>
                        <c:if test="${user.id == null}">
                        <ul>
                            <li><a href="login.jsp">Login</a></li>
                            <li><a href="user?action=create">Register</a></li>
                        </ul>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <aside id="colorlib-hero">
        <div class="flexslider">
            <ul class="slides">
                <li style="background-image: url(src/images/cover-img-3.jpg);">
                    <div class="overlay"></div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
                                <div class="slider-text-inner text-center">
                                    <h2>by colorlib.com</h2>
                                    <h1>Tour Overview</h1>
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
            <form action="tour_ticket?action=create" method="post">
                <input type="hidden" name="tour_id" value="${tour.tour_id}">
                <input type="hidden" name="user_id" value="${user.id}">
                <div class="row">
                    <div class="col-md-9">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="wrap-division">
                                    <div class="col-md-12 col-md-offset-0 heading2 animate-box">
                                        <h2>${tour.name}</h2>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 animate-box">
                                            <div class="room-wrap">
                                                <div class="row">
                                                    <div class="col-md-6 col-sm-6">
                                                        <div class="room-img"
                                                             style="background-image: url(${tour.img});"></div>
                                                    </div>
                                                    <div class="col-md-6 col-sm-6">
                                                        <div class="desc">
                                                            <span class="day-tour">Start time: ${tour.start_time}</span>
                                                            <span class="day-tour">End time: ${tour.end_time}</span>

                                                            <h2>${tour.name}</h2>
                                                            <p>${tour.getTour_tag()}</p>
                                                            <p>${tour.description}</p>
                                                            <h2><fmt:formatNumber type="number" value="${tour.price}"/> VND</h2>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

<%--                    <input type="text" name="description" id="description">--%>


                    <div
                            class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
                    >
                        <label class="block text-sm" for="quantity">
                            <span class="text-gray-700 dark:text-gray-400">Nhập số người</span>
                            <input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                   type="number" name="quantity" id="quantity" value="${tourTicket.getQuantity()}" min="1" max="100" step="1" required>
                        </label>
                        <p class="mt-4" style="color: red">
                            ${messageQuantity}
                        </p>
                        <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Hotel
                </span>
                            <select
                                    name="hotel"
                                    class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                            >
                                <c:forEach items="${requestScope.hotels}" var="hotel">
                                    <c:if test="${service.getHotelName().id != hotel.id}">
                                        <option value="${hotel.id}">${hotel.name}
                                            - ${hotel.description}
                                            - <fmt:formatNumber type="number" value="${hotel.price}"/> VND
                                            </option>
                                    </c:if>
                                    <c:if test="${service.getHotelName().id == hotel.id}">
                                        <option selected value="${hotel.id}">${hotel.name}
                                            - ${hotel.description}
                                            - <fmt:formatNumber type="number" value="${hotel.price}"/> VND
                                        </option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </label>

                        <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Transport
                </span>
                            <select

                                    name="transport"
                                    class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-multiselect focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                            >
                                <c:forEach items="${requestScope.transports}" var="transport">
                                    <c:if test="${service.getTransportName().id != transport.id}">
                                        <option value="${transport.id}">${transport.name}
                                            - ${transport.description}
                                            - <fmt:formatNumber type="number" value="${transport.price}"/> VND
                                            </option>
                                    </c:if>
                                    <c:if test="${service.getTransportName().id == transport.id}">
                                        <option selected value="${transport.id}">${transport.name}
                                            - ${transport.description}
                                            - <fmt:formatNumber type="number" value="${transport.price}"/> VND
                                        </option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </label>
                        <label class="block mt-4 text-sm" for="description">
                            <span class="text-gray-700 dark:text-gray-400">Nhập chú thích</span>
                            <textarea
<%--                                    aria-valuetext="${tourTicket.getDescription()}"--%>
                                    name="description" id="description"
                                    class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-textarea focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                    rows="3"
                                    placeholder="Enter some long form description."
                            >${tourTicket.getDescription()}</textarea>
                        </label>

<%--                        <div class="flex mt-6 text-sm">--%>
<%--                            <label class="flex items-center dark:text-gray-400">--%>
<%--                                <input--%>
<%--                                type="checkbox"--%>
<%--                                class="text-purple-600 form-checkbox focus:border-purple-400 focus:outline-none--%>
<%--                                focus:shadow-outline-purple dark:focus:shadow-outline-gray"--%>
<%--                                />--%>
<%--                                <span class="ml-2">--%>
<%--                    I agree to the--%>
<%--                    <span class="underline">privacy policy</span>--%>
<%--                  </span>--%>
<%--                            </label>--%>
<%--                        </div>--%>
                        <%--                    <button id="btn" type="submit">Create</button>--%>


                        <div class="col-md-12 animate-box text-center">
                            <p><a onclick="return confirm('Are you sure booking this tour?')"
                                  href="#" class="btn btn-primary">
                                <button >Book Now!</button>
                            </a></p>
                            <c:if test="${requestScope['message'] != null}">
                                <script>
                                    alert("${message}")
                                </script>
                            </c:if>
                        </div>
            </form>
<%--            <a href="user?action=cart&user_id=${user.id}">Cart</a>--%>
        </div>
    </div>
</div>


<div id="colorlib-subscribe" style="background-image: url(src/images/img_bg_2.jpg);"
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
                    <span class="block">Demo Images: <a href="https://unsplash.co/"
                                                        target="_blank">Unsplash</a> , <a href="https://pexels.com/"
                                                                                          target="_blank">Pexels.com</a></span>
                </p>
            </div>
        </div>
    </div>

</footer>

</div>



<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
</div>
<%--<script>--%>
<%--    alert("${message}")--%>
<%--</script>--%>

<!-- jQuery -->
<script src="src/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="src/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="src/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="src/js/jquery.waypoints.min.js"></script>
<!-- Flexslider -->
<script src="src/js/jquery.flexslider-min.js"></script>
<!-- Owl carousel -->
<script src="src/js/owl.carousel.min.js"></script>
<!-- Magnific Popup -->
<script src="src/js/jquery.magnific-popup.min.js"></script>
<script src="src/js/magnific-popup-options.js"></script>
<!-- Date Picker -->
<script src="src/js/bootstrap-datepicker.js"></script>
<!-- Stellar Parallax -->
<script src="src/js/jquery.stellar.min.js"></script>

<!-- Main -->
<script src="src/js/main.js"></script>

</body>
</html>
