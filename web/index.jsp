<%-- 
    Document   : index
    Created on : May 25, 2024, 10:10:29 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            .notification-button {
                position: fixed;
                bottom: 20px;  /* Đặt nút ở phía dưới */
                right: 20px;  /* Đặt nút ở phía phải */
                background-color: #FFCC00;
                color: white;
                border: none;
                border-radius: 50%;
                padding: 15px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                font-size: 18px;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                transition: background-color 0.3s ease, box-shadow 0.3s ease;
                z-index: 1000;
            }

            .notification-button i {
                font-size: 24px;
            }

            .notification-count {
                position: absolute;
                top: -5px;
                right: -5px;
                background-color: red;
                color: white;
                border-radius: 50%;
                padding: 5px 10px;
                font-size: 14px;
                font-weight: bold;
                display: none;
            }

            .notification-button:hover {
                background-color: #FFFF00;
                box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
            }
        </style>
        
        
    </head>
    <body>

        <jsp:include page="header.jsp"></jsp:include>
            <!-- Hero Slider Begin -->
            <div class="hero-slider">
                <div class="slider-item">
                    <div class="single-slider-item set-bg" data-setbg="img/slider-1.jpg">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h1>We hope you’ll enjoy <br />your stay.</h1>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="slider-nav">
                                        <a href="#" class="single-slider-nav">
                                            <img src="img/nav-1.jpg" alt="">
                                            <div class="nav-text active">
                                                <p>Pool<i class="lnr lnr-arrow-right"></i></p>
                                            </div>
                                        </a>
                                        <a href="#" class="single-slider-nav">
                                            <img src="img/nav-2.jpg" alt="">
                                            <div class="nav-text">
                                                <p>Sauna<i class="lnr lnr-arrow-right"></i></p>
                                            </div>
                                        </a>
                                        <a href="#" class="single-slider-nav last">
                                            <img src="img/nav-3.jpg" alt="">
                                            <div class="nav-text">
                                                <p>Restaurant<i class="lnr lnr-arrow-right"></i></p>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Hero Slider End -->

            <!-- Room Availability Section Begin -->
            <section class="room-availability spad">
                <div class="container">

                    <div class="about-room">
                        <div class="row">
                            <div class="col-lg-10 offset-lg-1">
                                <h2>“Customers may forget what you said  but they will never forget how you made themfeel”.</h2>
                            </div>
                        </div>
                        <div class="about-para">
                            <div class="row">
                                <div class="col-lg-6">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus libero mauris,
                                        bibendum eget sapien ac, ultrices rhoncus ipsum. Donec nec sapien in urna fermentum
                                        ornare. Morbi vel ultrices leo. Sed eu turpis eu arcu vehicula fringilla ut vitae
                                        orci. Suspendisse maximus malesuada</p>
                                </div>
                                <div class="col-lg-6">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi at vulputate est.
                                        Donec tempor felis at nibh eleifend malesuada. Nullam suscipit lobortis aliquam.
                                        Phasellus lobortis ante lorem, vitae scelerisque lacus tempus sed. Phasellus rutrum
                                        magna </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Room Availability Section End -->

            <!-- Facilities Section Begin -->
            <div class="facilities-section spad">
                <div class="container">
                    <div class="facilities-content">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="section-title">
                                    <h1>Facilities</h1>
                                </div>
                            </div>
                        <c:forEach items="${listService}" var="item">





                            <div class="col-lg-6 p-0 mb-2">
                                <div class="facilities-text-warp">
                                    <div class="facilities-text">
                                        <h2>${item.name}</h2>
                                        <p>${item.describe}</p>
                                        <a href="service.jsp" class="primary-btn fac-btn">Visit Center <i class="lnr lnr-arrow-right"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 p-0 mb-2">

                                <div class="facilities-img set-bg" data-setbg="${item.image}" style="background-image: url(&quot;${item.image}&quot;);"></div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <!-- Facilities Section End -->

        <div class="testimonial-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h1>Guestbook</h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="testimonial-item">
                            <div class="tab-content">
                                <div class="tab-pane fade-in active" id="testimonial-1" role="tabpanel">
                                    <div class="single-testimonial-item">
                                        <span class="test-date">02/02/2019</span>
                                        <div class="test-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <h4>Loved It</h4>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiselit. Vivamus libero mauris,
                                            bibendum eget sapien ac, ultrices rhoncus ipsum. Donec nec sapien in urna
                                            fermentum ornare.</p>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="testimonial-2" role="tabpanel">
                                    <div class="single-testimonial-item">
                                        <span class="test-date">02/02/2019</span>
                                        <div class="test-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <h4>Loved It2</h4>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiselit. Vivamus libero mauris,
                                            bibendum eget sapien ac, ultrices rhoncus ipsum. Donec nec sapien in urna
                                            fermentum ornare.</p>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="testimonial-3" role="tabpanel">
                                    <div class="single-testimonial-item">
                                        <span class="test-date">02/02/2019</span>
                                        <div class="test-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <h4>Loved It3</h4>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiselit. Vivamus libero mauris,
                                            bibendum eget sapien ac, ultrices rhoncus ipsum. Donec nec sapien in urna
                                            fermentum ornare.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="testimonial-author-item">
                            <ul class="nav" role="tablist">
                                <li>
                                    <a data-toggle="tab" href="#testimonial-1" role="tab" class="show active">
                                        <div class="author-pic">
                                            <img src="img/testimonial/author-1.jpg" alt="">
                                        </div>
                                        <div class="author-text">
                                            <h5>John Doe <span>Berlin</span></h5>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#testimonial-2" role="tab">
                                        <div class="author-pic">
                                            <img src="img/testimonial/author-2.jpg" alt="">
                                        </div>
                                        <div class="author-text">
                                            <h5>John Doe <span>Berlin</span></h5>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#testimonial-3" role="tab">
                                        <div class="author-pic">
                                            <img src="img/testimonial/author-3.jpg" alt="">
                                        </div>
                                        <div class="author-text">
                                            <h5>John Doe <span>Berlin</span></h5>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Follow Instagram Section Begin -->
        <section class="follow-instagram">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>Follow us on Instagram @yourhotel</h2>
                    </div>
                </div>
            </div>
        </section>
        <!-- Follow Instagram Section End -->

        <!-- Footer Room Pic Section Begin -->
        <div class="footer-room-pic">
            <div class="container-fluid">
                <div class="row">
                    <img src="img/room-footer-pic/room-1.jpg" alt="">
                    <img src="img/room-footer-pic/room-2.jpg" alt="">
                    <img src="img/room-footer-pic/room-3.jpg" alt="">
                    <img src="img/room-footer-pic/room-4.jpg" alt="">
                </div>
            </div>
        </div>
        <c:if test="${sessionScope.account.username != null && !sessionScope.account.role.equals('us')}">
            <div class="notification-button" id="notificationButton">
                <i class="fa-solid fa-bell"></i>
                <span class="notification-count" id="cancel-requests-badge">0</span>
            </div>
        </c:if>
        <!-- Footer Room Pic Section End -->
        <jsp:include page="footer.jsp"></jsp:include>
            <script>
                var alertMessage = "${param.alertMessage}";
                if (alertMessage !== null && alertMessage !== "") {
                    alert(alertMessage);
                    alertMessage = null;
                }

                window.onload = function () {
                    const currentDateInput = document.querySelector(".date1");
                    const nextDateInput = document.querySelector(".date2");

                    const currentDate = new Date();
                    const nextDate = new Date();
                    nextDate.setDate(currentDate.getDate() + 1);

                    currentDateInput.value = currentDate.toISOString().split('T')[0];
                    nextDateInput.value = nextDate.toISOString().split('T')[0];

                    currentDateInput.addEventListener('change', checkDates);
                    nextDateInput.addEventListener('change', checkDates);
                };

                function checkDates() {
                    const currentDateInput = document.querySelector(".date1");
                    const nextDateInput = document.querySelector(".date2");

                    const currentDate = new Date(currentDateInput.value);
                    const nextDate = new Date(nextDateInput.value);

                    if (currentDate >= nextDate) {
                        nextDate.setDate(currentDate.getDate() + 1);
                        nextDateInput.value = nextDate.toISOString().split('T')[0];
                    }
                }
                function updateCancelRequestsCount() {
                    fetch('/swp/GetNewCancelRequestsCountServlet')
                            .then(response => response.json())
                            .then(data => {
                                const badge = document.getElementById('cancel-requests-badge');
                                if (data.count > 0) {
                                    badge.style.display = 'inline';
                                    badge.textContent = data.count;
                                } else {
                                    badge.style.display = 'none';
                                }
                            })
                            .catch(error => console.error('Error:', error));
                }

                // Cập nhật số lượng yêu cầu hủy mới khi trang được tải
                document.addEventListener('DOMContentLoaded', updateCancelRequestsCount);

                // Cập nhật số lượng yêu cầu hủy mới mỗi 10 giây
                setInterval(updateCancelRequestsCount, 10000);

                // Handle click event to redirect to the manage cancel booking page
                document.getElementById('notificationButton').addEventListener('click', function () {
                    window.location.href = 'ManageCancelBookingServlet?choice=pending';
                });
        </script>
    </body>
</html>
