<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                        <div id="colorlib-logo"><a href="index.html">Tour</a></div>
                    </div>
                    <div class="col-xs-10 text-right menu-1">
                        <ul>
                            <li><a href="index.html">Home</a></li>
                            <li class="has-dropdown active">
                                <a href="tours.html">Tours</a>
                                <ul class="dropdown">
                                    <li><a href="#">Destination</a></li>
                                    <li><a href="#">Cruises</a></li>
                                    <li><a href="#">Hotels</a></li>
                                    <li><a href="#">Booking</a></li>
                                </ul>
                            </li>
                            <li><a href="hotels.html">Hotels</a></li>
                            <li><a href="services.html">Services</a></li>
                            <li><a href="blog.html">Blog</a></li>
                            <li><a href="about.html">About</a></li>
                            <li><a href="contact.html">Contact</a></li>
                        </ul>
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
                                                         style="background-image: url(src/images/tour-1.jpg);"></div>
                                                </div>
                                                <div class="col-md-6 col-sm-6">
                                                    <div class="desc">
                                                        <span class="day-tour">Day 1</span>
                                                        <h2>Athens, Greece</h2>
                                                        <p>Even the all-powerful Pointing has no control about the blind
                                                            texts it is an almost unorthographic life One day however a
                                                            small line of blind text by the name of Lorem Ipsum decided
                                                            to leave for the far World of Grammar.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

<%--                                    <div class="col-md-12 animate-box">--%>
<%--                                        <div class="room-wrap">--%>
<%--                                            <div class="row">--%>
<%--                                                <div class="col-md-6 col-sm-6">--%>
<%--                                                    <div class="room-img"--%>
<%--                                                         style="background-image: url(src/images/tour-2.jpg);"></div>--%>
<%--                                                </div>--%>
<%--                                                <div class="col-md-6 col-sm-6">--%>
<%--                                                    <div class="desc">--%>
<%--                                                        <span class="day-tour">Day 2</span>--%>
<%--                                                        <h2>Thailand</h2>--%>
<%--                                                        <p>Even the all-powerful Pointing has no control about the blind--%>
<%--                                                            texts it is an almost unorthographic life One day however a--%>
<%--                                                            small line of blind text by the name of Lorem Ipsum decided--%>
<%--                                                            to leave for the far World of Grammar.</p>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>

<%--                                    <div class="col-md-12 animate-box">--%>
<%--                                        <div class="room-wrap">--%>
<%--                                            <div class="row">--%>
<%--                                                <div class="col-md-6 col-sm-6">--%>
<%--                                                    <div class="room-img"--%>
<%--                                                         style="background-image: url(src/images/tour-3.jpg);"></div>--%>
<%--                                                </div>--%>
<%--                                                <div class="col-md-6 col-sm-6">--%>
<%--                                                    <div class="desc">--%>
<%--                                                        <span class="day-tour">Day 3</span>--%>
<%--                                                        <h2>Boracay, Philippines</h2>--%>
<%--                                                        <p>Even the all-powerful Pointing has no control about the blind--%>
<%--                                                            texts it is an almost unorthographic life One day however a--%>
<%--                                                            small line of blind text by the name of Lorem Ipsum decided--%>
<%--                                                            to leave for the far World of Grammar.</p>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>

<%--                                    <div class="col-md-12 animate-box">--%>
<%--                                        <div class="room-wrap">--%>
<%--                                            <div class="row">--%>
<%--                                                <div class="col-md-6 col-sm-6">--%>
<%--                                                    <div class="room-img"--%>
<%--                                                         style="background-image: url(src/images/tour-4.jpg);"></div>--%>
<%--                                                </div>--%>
<%--                                                <div class="col-md-6 col-sm-6">--%>
<%--                                                    <div class="desc">--%>
<%--                                                        <span class="day-tour">Day 4</span>--%>
<%--                                                        <h2>Tokyo, Japan</h2>--%>
<%--                                                        <p>Even the all-powerful Pointing has no control about the blind--%>
<%--                                                            texts it is an almost unorthographic life One day however a--%>
<%--                                                            small line of blind text by the name of Lorem Ipsum decided--%>
<%--                                                            to leave for the far World of Grammar.</p>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>

<%--                                    <div class="col-md-12 animate-box">--%>
<%--                                        <div class="room-wrap">--%>
<%--                                            <div class="row">--%>
<%--                                                <div class="col-md-6 col-sm-6">--%>
<%--                                                    <div class="room-img"--%>
<%--                                                         style="background-image: url(src/images/tour-5.jpg);"></div>--%>
<%--                                                </div>--%>
<%--                                                <div class="col-md-6 col-sm-6">--%>
<%--                                                    <div class="desc">--%>
<%--                                                        <span class="day-tour">Day 5</span>--%>
<%--                                                        <h2>Paris, Italy</h2>--%>
<%--                                                        <p>Even the all-powerful Pointing has no control about the blind--%>
<%--                                                            texts it is an almost unorthographic life One day however a--%>
<%--                                                            small line of blind text by the name of Lorem Ipsum decided--%>
<%--                                                            to leave for the far World of Grammar.</p>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>

<%--                                    <div class="col-md-12 animate-box">--%>
<%--                                        <div class="room-wrap">--%>
<%--                                            <div class="row">--%>
<%--                                                <div class="col-md-6 col-sm-6">--%>
<%--                                                    <div class="room-img"--%>
<%--                                                         style="background-image: url(src/images/tour-6.jpg);"></div>--%>
<%--                                                </div>--%>
<%--                                                <div class="col-md-6 col-sm-6">--%>
<%--                                                    <div class="desc">--%>
<%--                                                        <span class="day-tour">Day 6</span>--%>
<%--                                                        <h2>Greece</h2>--%>
<%--                                                        <p>Even the all-powerful Pointing has no control about the blind--%>
<%--                                                            texts it is an almost unorthographic life One day however a--%>
<%--                                                            small line of blind text by the name of Lorem Ipsum decided--%>
<%--                                                            to leave for the far World of Grammar.</p>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SIDEBAR-->
<%--                <div class="col-md-3">--%>
<%--                    <div class="sidebar-wrap">--%>
<%--                        <div class="side search-wrap animate-box">--%>
<%--                            <h3 class="sidebar-heading">Find your hotel</h3>--%>
<%--                            <form method="post" class="colorlib-form">--%>
<%--                                <div class="row">--%>
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
<%--                                    <div class="col-md-12">--%>
<%--                                        <input type="submit" name="submit" id="submit" value="Find Hotel"--%>
<%--                                               class="btn btn-primary btn-block">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </form>--%>
<%--                        </div>--%>
<%--                        <div class="side animate-box">--%>
<%--                            <div class="row">--%>
<%--                                <div class="col-md-12">--%>
<%--                                    <h3 class="sidebar-heading">Price Range</h3>--%>
<%--                                    <form method="post" class="colorlib-form-2">--%>
<%--                                        <div class="row">--%>
<%--                                            <div class="col-md-6">--%>
<%--                                                <div class="form-group">--%>
<%--                                                    <label for="guests">Price from:</label>--%>
<%--                                                    <div class="form-field">--%>
<%--                                                        <i class="icon icon-arrow-down3"></i>--%>
<%--                                                        <select name="people" id="people" class="form-control">--%>
<%--                                                            <option value="#">1</option>--%>
<%--                                                            <option value="#">200</option>--%>
<%--                                                            <option value="#">300</option>--%>
<%--                                                            <option value="#">400</option>--%>
<%--                                                            <option value="#">1000</option>--%>
<%--                                                        </select>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-md-6">--%>
<%--                                                <div class="form-group">--%>
<%--                                                    <label for="guests">Price to:</label>--%>
<%--                                                    <div class="form-field">--%>
<%--                                                        <i class="icon icon-arrow-down3"></i>--%>
<%--                                                        <select name="people" id="people" class="form-control">--%>
<%--                                                            <option value="#">2000</option>--%>
<%--                                                            <option value="#">4000</option>--%>
<%--                                                            <option value="#">6000</option>--%>
<%--                                                            <option value="#">8000</option>--%>
<%--                                                            <option value="#">10000</option>--%>
<%--                                                        </select>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </form>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="side animate-box">--%>
<%--                            <div class="row">--%>
<%--                                <div class="col-md-12">--%>
<%--                                    <h3 class="sidebar-heading">Review Rating</h3>--%>
<%--                                    <form method="post" class="colorlib-form-2">--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                                            <label class="form-check-label" for="exampleCheck1">--%>
<%--                                                <p class="rate"><span><i class="icon-star-full"></i><i--%>
<%--                                                        class="icon-star-full"></i><i class="icon-star-full"></i><i--%>
<%--                                                        class="icon-star-full"></i><i class="icon-star-full"></i></span>--%>
<%--                                                </p>--%>
<%--                                            </label>--%>
<%--                                        </div>--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                                            <label class="form-check-label" for="exampleCheck1">--%>
<%--                                                <p class="rate"><span><i class="icon-star-full"></i><i--%>
<%--                                                        class="icon-star-full"></i><i class="icon-star-full"></i><i--%>
<%--                                                        class="icon-star-full"></i></span></p>--%>
<%--                                            </label>--%>
<%--                                        </div>--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                                            <label class="form-check-label" for="exampleCheck1">--%>
<%--                                                <p class="rate"><span><i class="icon-star-full"></i><i--%>
<%--                                                        class="icon-star-full"></i><i class="icon-star-full"></i></span>--%>
<%--                                                </p>--%>
<%--                                            </label>--%>
<%--                                        </div>--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                                            <label class="form-check-label" for="exampleCheck1">--%>
<%--                                                <p class="rate"><span><i class="icon-star-full"></i><i--%>
<%--                                                        class="icon-star-full"></i></span></p>--%>
<%--                                            </label>--%>
<%--                                        </div>--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                                            <label class="form-check-label" for="exampleCheck1">--%>
<%--                                                <p class="rate"><span><i class="icon-star-full"></i></span></p>--%>
<%--                                            </label>--%>
<%--                                        </div>--%>
<%--                                    </form>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="side animate-box">--%>
<%--                            <div class="row">--%>
<%--                                <div class="col-md-12">--%>
<%--                                    <h3 class="sidebar-heading">Categories</h3>--%>
<%--                                    <form method="post" class="colorlib-form-2">--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                                            <label class="form-check-label" for="exampleCheck1">--%>
<%--                                                <h4 class="place">Apartment</h4>--%>
<%--                                            </label>--%>
<%--                                        </div>--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                                            <label class="form-check-label" for="exampleCheck1">--%>
<%--                                                <h4 class="place">Hotel</h4>--%>
<%--                                            </label>--%>
<%--                                        </div>--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                                            <label class="form-check-label" for="exampleCheck1">--%>
<%--                                                <h4 class="place">Hostel</h4>--%>
<%--                                            </label>--%>
<%--                                        </div>--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                                            <label class="form-check-label" for="exampleCheck1">--%>
<%--                                                <h4 class="place">Inn</h4>--%>
<%--                                            </label>--%>
<%--                                        </div>--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                                            <label class="form-check-label" for="exampleCheck1">--%>
<%--                                                <h4 class="place">Villa</h4>--%>
<%--                                            </label>--%>
<%--                                        </div>--%>
<%--                                    </form>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="side animate-box">--%>
<%--                            <div class="row">--%>
<%--                                <div class="col-md-12">--%>
<%--                                    <h3 class="sidebar-heading">Location</h3>--%>
<%--                                    <form method="post" class="colorlib-form-2">--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                                            <label class="form-check-label" for="exampleCheck1">--%>
<%--                                                <h4 class="place">Greece</h4>--%>
<%--                                            </label>--%>
<%--                                        </div>--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                                            <label class="form-check-label" for="exampleCheck1">--%>
<%--                                                <h4 class="place">Italy</h4>--%>
<%--                                            </label>--%>
<%--                                        </div>--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                                            <label class="form-check-label" for="exampleCheck1">--%>
<%--                                                <h4 class="place">Spain</h4>--%>
<%--                                            </label>--%>
<%--                                        </div>--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                                            <label class="form-check-label" for="exampleCheck1">--%>
<%--                                                <h4 class="place">Germany</h4>--%>
<%--                                            </label>--%>
<%--                                        </div>--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                                            <label class="form-check-label" for="exampleCheck1">--%>
<%--                                                <h4 class="place">Japan</h4>--%>
<%--                                            </label>--%>
<%--                                        </div>--%>
<%--                                    </form>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="side animate-box">--%>
<%--                            <div class="row">--%>
<%--                                <div class="col-md-12">--%>
<%--                                    <h3 class="sidebar-heading">Facilities</h3>--%>
<%--                                    <form method="post" class="colorlib-form-2">--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                                            <label class="form-check-label" for="exampleCheck1">--%>
<%--                                                <h4 class="place">Airport Transfer</h4>--%>
<%--                                            </label>--%>
<%--                                        </div>--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                                            <label class="form-check-label" for="exampleCheck1">--%>
<%--                                                <h4 class="place">Resto Bar</h4>--%>
<%--                                            </label>--%>
<%--                                        </div>--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                                            <label class="form-check-label" for="exampleCheck1">--%>
<%--                                                <h4 class="place">Restaurant</h4>--%>
<%--                                            </label>--%>
<%--                                        </div>--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                                            <label class="form-check-label" for="exampleCheck1">--%>
<%--                                                <h4 class="place">Swimming Pool</h4>--%>
<%--                                            </label>--%>
<%--                                        </div>--%>
<%--                                        <div class="form-check">--%>
<%--                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--                                            <label class="form-check-label" for="exampleCheck1">--%>
<%--                                                <h4 class="place">Japan</h4>--%>
<%--                                            </label>--%>
<%--                                        </div>--%>
<%--                                    </form>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>
        </div>
    </div>

    <div class="container">
        <div style="font-size: 75%" class="w-full overflow-x-auto">
            <table class="w-full whitespace-no-wrap">
                <thead>
                <tr
                        class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                >
                    <th class="px-4 py-3">
                        ID
                        <c:if test="${pageable.sortBy == 'desc'}">
                            <a href="tour_ticket?page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=service.service_id">
                                <i class="fa-solid fa-sort"></i>
                            </a>
                        </c:if>
                        <c:if test="${pageable.sortBy == 'asc'}">
                            <a href="tour_ticket?page=${pageable.page}&search=${pageable.search}&sortBy=desc&nameField=service.service_id">
                                <i class="fa-solid fa-sort"></i>
                            </a>
                        </c:if>
                    </th>
                    <th class="px-4 py-3">
                        Hotel
                        <c:if test="${pageable.sortBy == 'desc'}">
                            <a href="tour_ticket?page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=hotel_name">
                                <i class="fa-solid fa-sort"></i>
                            </a>
                        </c:if>
                        <c:if test="${pageable.sortBy == 'asc'}">
                            <a href="tour_ticket?page=${pageable.page}&search=${pageable.search}&sortBy=desc&nameField=hotel_name">
                                <i class="fa-solid fa-sort"></i>
                            </a>
                        </c:if>
                    </th>
                    <th class="px-4 py-3">
                        Transport
                        <c:if test="${pageable.sortBy == 'desc'}">
                            <a href="tour_ticket?page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=transport_name">
                                <i class="fa-solid fa-sort"></i>
                            </a>
                        </c:if>
                        <c:if test="${pageable.sortBy == 'asc'}">
                            <a href="tour_ticket?page=${pageable.page}&search=${pageable.search}&sortBy=desc&nameField=transport_name">
                                <i class="fa-solid fa-sort"></i>
                            </a>
                        </c:if>
                    </th>
                    <th class="px-4 py-3">
                        Price
                        <c:if test="${pageable.sortBy == 'desc'}">
                            <a href="tour_ticket?page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=total_price">
                                <i class="fa-solid fa-sort"></i>
                            </a>
                        </c:if>
                        <c:if test="${pageable.sortBy == 'asc'}">
                            <a href="tour_ticket?page=${pageable.page}&search=${pageable.search}&sortBy=desc&nameField=total_price">
                                <i class="fa-solid fa-sort"></i>
                            </a>
                        </c:if>
                    </th>
                    <th class="px-4 py-3">
                        Description
                        <c:if test="${pageable.sortBy == 'desc'}">
                            <a href="tour_ticket?page=${pageable.page}&search=${pageable.search}&sortBy=asc&nameField=description">
                                <i class="fa-solid fa-sort"></i>
                            </a>
                        </c:if>
                        <c:if test="${pageable.sortBy == 'asc'}">
                            <a href="tour_ticket?page=${pageable.page}&search=${pageable.search}&sortBy=desc&nameField=description">
                                <i class="fa-solid fa-sort"></i>
                            </a>
                        </c:if>
                    </th>
                    <th class="px-4 py-3">Actions</th>
                </tr>
                </thead>
                <tbody
                        class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                >
                <c:forEach items="${services}" var="service">
                    <tr class="text-gray-700 dark:text-gray-400">
                        <td class="px-4 py-3 text-sm">
                                ${service.getId()}
                        </td>
                        <td class="px-4 py-3">
                            <div class="flex items-center text-sm">
                                <!-- Avatar with inset shadow -->
                                    <%--                        <div--%>
                                    <%--                                class="relative hidden w-8 h-8 mr-3 rounded-full md:block"--%>
                                    <%--                        >--%>
                                    <%--                            <div--%>
                                    <%--                                    class="absolute inset-0 rounded-full shadow-inner"--%>
                                    <%--                                    aria-hidden="true"--%>
                                    <%--                            ></div>--%>
                                    <%--                        </div>--%>
                                <div>
                                    <p class="font-semibold">${service.getHotelName().getName()}</p>
                                    <p class="text-xs text-gray-600 dark:text-gray-400">
                                            ${service.getHotelName().getDescription()}
                                    </p>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="flex items-center text-sm">
                                <!-- Avatar with inset shadow -->
                                    <%--                        <div--%>
                                    <%--                                class="relative hidden w-8 h-8 mr-3 rounded-full md:block"--%>
                                    <%--                        >--%>
                                    <%--                            <div--%>
                                    <%--                                    class="absolute inset-0 rounded-full shadow-inner"--%>
                                    <%--                                    aria-hidden="true"--%>
                                    <%--                            ></div>--%>
                                    <%--                        </div>--%>
                                <div>
                                    <p class="font-semibold">${service.getTransportName().getName()}</p>
                                    <p class="text-xs text-gray-600 dark:text-gray-400">
                                            ${service.getTransportName().getDescription()}
                                    </p>
                                </div>
                            </div>
                        </td>

                        <td class="px-4 py-3 text-xs">
                        <span
                                class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
                        >
                          ${service.getTotalPrice()} đ
                        </span>
                        </td>
                        <td class="px-4 py-3 text-sm">
                                ${service.getDescription()}
                        </td>
                        <td class="px-4 py-3">
                            <div class="flex items-center space-x-4 text-sm">
<%--                                <a href="service_manager?action=edit&id=${service.getId()}">--%>
<%--                                    <button--%>
<%--                                            class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"--%>
<%--                                            aria-label="Edit"--%>
<%--                                    >--%>
<%--                                        <svg--%>
<%--                                                class="w-5 h-5"--%>
<%--                                                aria-hidden="true"--%>
<%--                                                fill="currentColor"--%>
<%--                                                viewBox="0 0 20 20"--%>
<%--                                        >--%>
<%--                                            <i class="fa-solid fa-plus"></i>--%>
<%--&lt;%&ndash;                                            <path&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            ></path>&ndash;%&gt;--%>
<%--                                        </svg>--%>
<%--                                    </button>--%>
<%--                                </a>--%>

                                <a onclick="return confirm('Do you want to add this Service?')"
                                   href="tour_ticket?action=add&id=${service.getId()}">
                                    <button
                                            class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                                            aria-label="Delete"
                                    >
                                        <svg
                                                class="w-5 h-5"
                                                aria-hidden="true"
                                                fill="currentColor"
                                                viewBox="0 0 20 20"
                                        >
                                            <i class="fa-solid fa-plus"></i>
<%--                                            <path--%>
<%--                                                    fill-rule="evenodd"--%>
<%--                                                    d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"--%>
<%--                                                    clip-rule="evenodd"--%>
<%--                                            ></path>--%>
                                        </svg>
                                    </button>
                                </a>

                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800">
    <span class="flex items-center col-span-3">
    Showing ${pageable.totalPage}
    </span>
            <span class="col-span-2"></span>
            <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
    <nav aria-label="Table navigation">
    <ul class="inline-flex items-center">
    <c:forEach begin="1" end="${pageable.totalPage}" var="page">
                      <li>
                          <a href="tour_ticket?page=${page}&search=${pageable.search}&sortBy=${pageable.sortBy}&nameField=${pageable.nameField}">
                              <button class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple">
                                      ${page}
                              </button>
                          </a>
                      </li>
    </c:forEach>
    </ul>
    </nav>
    </span>

        </div>
        <div class="col-md-12 animate-box text-center">
            <p><a href="#" class="btn btn-primary">Book Now!</a></p>
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
