<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : productlist
    Created on : Feb 25, 2024, 2:12:03 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Shoe Shop</title>

        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>


        <jsp:include page="header.jsp"/>


        <section class="featured spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h2> Product</h2>
                        </div>
                    </div>
                </div>
                                    <form action="productlist" method="get" class="row">

                <div id="top-functions-area" class="top-functions-area row">
                        <div class="flt-item to-left col-md-6">
                            <div>
                                <select name="categoryId" onchange="this.form.submit()" class="form-select">
                                    <option value="">All Category</option>
                                    <c:forEach var="c" items="${clist}">
                                        <option value="${c.getId()}" ${param['categoryId']==c.getId()?"selected":""}>${c.getName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    <div class="flt-item to-right col-md-6" style="margin-left: 10rem;" >
                            <div>
                                <select name="brandId" onchange="this.form.submit()" class="form-select">
                                    <option value="">All Brand</option>
                                    <c:forEach var="c" items="${listBrand}">
                                        <option value="${c.getId()}" ${param['brandId']==c.getId()?"selected":""}>${c.getName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                </div>
                                                            </form>

                <div class="row featured__filter">
                    <c:forEach var="o" items="${plist}">
                        <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                            <div class="featured__item">
                                <div class="featured__item__pic set-bg" data-setbg="${o.image}">
                                    <ul class="featured__item__pic__hover">
                                        <li><a href="addtocart?pid=${o.id}&quantity=1"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="featured__item__text">
                                    <h6><a href="detail?id=${o.id}">${o.name}</a></h6>
                                    <h5>$ ${o.price}</h5>
                                </div>
                            </div>
                        </div>
                    </c:forEach>



                </div>
                <div class="pagination" style="display: flex; justify-content: center; flex-direction: row;">
                    <ul class="pagination" >
                        <li  class="page-item next"><a href="productlist?index=1&categoryId=${param['categoryId']}&brandId=${param['brandId']}"><i class="fa fa-angle-left" class="page-link" aria-hidden="true"></i></a></li>
                                <c:forEach var = "i" begin = "1" end = "${numberPage}">
                            <li class="${param['index']==i?'page-item active':'page-item'}"><a href="productlist?index=${i}&categoryId=${param['categoryId']}&brandId=${param['brandId']}"   class="page-link">${i}</a></li>
                            </c:forEach>
                        <li  class="page-item next"><a href="productlist?index=${numberPage}&categoryId=${param['categoryId']}&brandId=${param['brandId']}"><i class="fa fa-angle-right" class="page-link" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>
        </section>

        <footer class="footer spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="footer__about">
                            <div class="footer__about__logo">
                                <a href="./index.html"><img src="img/logo.png" alt=""></a>
                            </div>
                            <ul>
                                <li>Address: 60-49 Road 11378 New York</li>
                                <li>Phone: +65 11.188.888</li>
                                <li>Email: <a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="81e9e4ededeec1e2eeedeef3ede8e3afe2eeec">[email&#160;protected]</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                        <div class="footer__widget">
                            <h6>Useful Links</h6>
                            <ul>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">About Our Shop</a></li>
                                <li><a href="#">Secure Shopping</a></li>
                                <li><a href="#">Delivery infomation</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Our Sitemap</a></li>
                            </ul>
                            <ul>
                                <li><a href="#">Who We Are</a></li>
                                <li><a href="#">Our Services</a></li>
                                <li><a href="#">Projects</a></li>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">Innovation</a></li>
                                <li><a href="#">Testimonials</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="footer__widget">
                            <h6>Join Our Newsletter Now</h6>
                            <p>Get E-mail updates about our latest shop and special offers.</p>
                            <form action="#">
                                <input type="text" placeholder="Enter your mail">
                                <button type="submit" class="site-btn">Subscribe</button>
                            </form>
                            <div class="footer__widget__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer__copyright">
                            <div class="footer__copyright__text"><p>
                                    Copyright &copy;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                </p></div>
                            <div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>


        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>

        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
        <script>
                                    window.dataLayer = window.dataLayer || [];
                                    function gtag() {
                                        dataLayer.push(arguments);
                                    }
                                    gtag('js', new Date());

                                    gtag('config', 'UA-23581568-13');
        </script>
        <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v52afc6f149f6479b8c77fa569edb01181681764108816" integrity="sha512-jGCTpDpBAYDGNYR5ztKt4BQPGef1P0giN6ZGVUi835kFF88FOmmn8jBQWNgrNd8g/Yu421NdgWhwQoaOPFflDw==" data-cf-beacon='{"rayId":"7e389c4cf8d804c9","version":"2023.4.0","b":1,"token":"cd0b4b3a733644fc843ef0b185f98241","si":100}' crossorigin="anonymous"></script>
    </body>
</html>
