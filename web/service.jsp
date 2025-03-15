
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .services-pic-item figure img{
                opacity: 1;
                -webkit-transition: .3s ease-in-out;
                transition: .3s ease-in-out;
                transition: transform 0.3s ease; /* Optional: adds a zoom effect on hover */
                overflow: hidden;
            }
            .services-pic-item figure:hover img {
                opacity: .5;
                transform: scale(1.1); /* Optional: zooms in the image slightly on hover */
            }
            .row message-notice-emptyservice{
                text-align: center;
                border: 3px;
            }
            .services-pic-item {
                position: relative;
                width: 100%; /* Ensures the image container takes full width of the column */
                height: 200px;  /* Set a fixed height for the image container */
                overflow: hidden;  /* Hides any part of the image that exceeds the container's bounds */
            }

            .services-pic-item a {
                display: block; /* Makes the anchor a block element */
                width: 100%; /* Ensures the link takes the full width of the container */
                height: 100%; /* Ensures the link takes the full height of the container */
            }

            .services-pic-item img {
                width: 100%; /* Makes the image fill the container's width */
                height: 100%; /* Makes the image fill the container's height */
                object-fit: cover; /* Ensures the image fills the container without distortion */
                display: block; /* Removes any unwanted space below the image */
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>


            <!-- Hero Section Begin -->
            <section class="hero-section set-bg" data-setbg="img/services-bg.jpg">
                <div class="hero-text">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <h1>Services</h1>
                            </div>
                        </div>
                        <div class="page-nav">
                            <a href="./index.jsp" class="left-nav"><i class="lnr lnr-arrow-left"></i> Home</a>

                        </div>
                    </div>
                </div>
            </section>
            <!-- Hero Section End -->

            <!-- Services Section Begin --> 
            <section class="services-section">
                <div class="container-fluid">
                    <div class="row" style="<c:if test='${empty listservice}'>justify-content: center;</c:if>">
                    <c:choose>
                        <c:when test="${not empty listservice}">
                            <c:forEach items="${listservice}" var="s">
                                <div class="col-lg-3 col-sm-6">
                                    <!-- Wrap the whole service item (including text and image) in a container that triggers the click -->
                                    <div class="single-services-item" onclick="redirectLink('./get-service?id=${s.serviceId}')">
                                        <div class="services-pic-item">
                                            <figure> 
                                                <img src="${s.serviceIMG}" alt="${s.serviceName}">
                                            </figure>
                                        </div>
                                        <div class="services-text">
                                            <h2>${s.serviceName}</h2>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>    
                        <c:otherwise>
                            <h2 class="message-notice-emptyservice">Not have service yet!</h2>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </section>

        <!-- Services Section End -->

        <!-- Services Section End -->
        <section class="features-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h2>Features</h2>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="single-features-item">
                            <i class="flaticon-043-room-service"></i>
                            <h4>Room Service</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="single-features-item">
                            <i class="flaticon-007-swimming-pool"></i>
                            <h4>Pool</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="single-features-item">
                            <i class="flaticon-013-safety-box"></i>
                            <h4>Safty Box</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="single-features-item">
                            <i class="flaticon-033-dinner"></i>
                            <h4>Restaurant</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="single-features-item">
                            <i class="flaticon-029-wifi"></i>
                            <h4>Wi-fi</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="single-features-item">
                            <i class="flaticon-003-air-conditioner"></i>
                            <h4>Air Conditioner</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="single-features-item">
                            <i class="flaticon-033-dinner"></i>
                            <h4>Restaurant</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="single-features-item">
                            <i class="flaticon-020-telephone"></i>
                            <h4>Phone</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="single-features-item">
                            <i class="flaticon-019-television"></i>
                            <h4>Smart TV</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="single-features-item">
                            <i class="flaticon-040-key-card"></i>
                            <h4>Smart Key</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="single-features-item">
                            <i class="flaticon-009-cctv"></i>
                            <h4>24/7 Security</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="single-features-item">
                            <i class="flaticon-036-parking"></i>
                            <h4>Free Parking</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Services Section End -->

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
    <script>
        function redirectLink(link) {
            window.location.href = link;  // Redirects to the provided link
        }
    </script>
</html>
