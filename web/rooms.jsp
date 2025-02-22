<%--
    Document   : room
    Created on : May 25, 2024, 10:14:35 PM
    Author     : Administrator
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Alegreya:700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400" rel="stylesheet">
        
        <title>JSP Page</title>
        <style>
            /*---------------------Time Booking Bar----------------*/
            .section {
                position: relative;
                height: 20vh;
            }

            .section .section-center {
                position: absolute;
                top: 50%;
                left: 0;
                right: 0;
                -webkit-transform: translateY(-50%);
                transform: translateY(-50%);
            }



            .booking-form {
                background: #fff;
                -webkit-box-shadow: 0px 2px 5px -2px rgba(0, 0, 0, 0.3);
                box-shadow: 0px 2px 5px -2px rgba(0, 0, 0, 0.3);
                border: 1px solid rgba(60, 64, 101, 0.1);
            }

            .booking-form>form .row.no-margin {
                margin-right: 0px;
                margin-left: 0px;
            }

            .booking-form>form .row.no-margin>[class*="col-"] {
                padding-right: 48px;
                padding-left: 0px;
            }

            .booking-form .form-header {
                padding: 15px 10px;
                height: 110px;
                line-height: 90px;
                text-align: center;
            }

            .booking-form .form-header h2 {
                font-family: 'Alegreya', serif;
                margin: 0;
                display: inline-block;
                font-size: 42px;
                color: #9a8067;
            }

            .booking-form .form-group {
                position: relative;
                height: 110px;
                padding: 15px 10px;
                margin-bottom: 0px;
            }

            .booking-form .form-control {
                font-family: 'Alegreya', serif;
                background-color: transparent;
                border-radius: 0px;
                border: none;
                height: 50px;
                -webkit-box-shadow: none;
                box-shadow: none;
                padding: 0;
                font-size: 20px;
                color: #3c404a;
                font-weight: 700;
            }

            .booking-form select.form-control {
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
            }

            .booking-form select.form-control+.select-arrow {
                position: absolute;
                right: 0px;
                bottom: 20px;
                width: 32px;
                line-height: 32px;
                height: 32px;
                text-align: center;
                pointer-events: none;
                color: #818390;
                font-size: 12px;
            }

            .booking-form select.form-control+.select-arrow:after {
                content: '\279C';
                display: block;
                -webkit-transform: rotate(90deg);
                transform: rotate(90deg);
            }

            .booking-form .form-label {
                color: #818390;
                display: block;
                font-weight: 400;
                height: 30px;
                line-height: 30px;
                font-size: 14px;
            }

            .booking-form .form-btn {
                padding: 15px 10px;
                height: 110px;
            }

            .booking-form .submit-btn {
                background: #9a8067;
                color: #fff;
                border: none;
                font-weight: 400;
                text-transform: uppercase;
                font-size: 14px;
                display: block;
                height: 80px;
                width: 100%;
            }
            .icon{
                font-size: 50px;
                font-style: normal;
            }


        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Hero Section Begin -->
            <section class="hero-section set-bg" data-setbg="img/rooms-bg.jpg">
                <div class="hero-text">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <h1>Villas</h1>
                            </div>
                        </div>
                        <div class="page-nav">
                            <a href="./service.jsp" class="left-nav"><i class="lnr lnr-arrow-left"></i> Services</a>
                            <!--<a href="./news.html" class="right-nav">News <i class="lnr lnr-arrow-right"></i></a>-->
                        </div>
                    </div>
                </div>
            </section>
            <!-- Hero Section End -->
            <h3 style="text-align: center; color: red">${error}</h3>
        <!--Time Booking Start -->
        <div id="booking" class="section">
            <div class="section-center">
                <div class="container">
                    <div class="row">
                        <div class="booking-form">
                            <form action="roomAvailable" method="get">
                                <input type="hidden" name="action" value="listCondition">
                                <div class="row no-margin">
                                    <div class="col-md-3">
                                        <div class="form-header">
                                            <h2>Book Now</h2>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="row no-margin">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <span class="form-label">Check In</span>
                                                    <input id="fromDate" name="fromDate" class="form-control date1" type="date" value="${fromDate}">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <span class="form-label">Check out</span>
                                                    <input id="toDate" name="toDate" class="form-control date2" type="date" value="${toDate}">
                                                </div>
                                            </div>

                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <span class="form-label"> People</span>
                                                    <select class="form-control" name="numofpeople">
                                                        <option value="1" ${numofpeople == 1 ? "selected" : ""}>1</option>
                                                        <option value="2" ${numofpeople == 2 ? "selected" : ""}>2</option>
                                                        <option value="3" ${numofpeople == 3 ? "selected" : ""}>3</option>
                                                        <option value="4" ${numofpeople == 4 ? "selected" : ""}>4</option>
                                                        <option value="5" ${numofpeople == 5 ? "selected" : ""}>5</option>
                                                        <option value="6" ${numofpeople == 6 ? "selected" : ""}>6</option>
                                                        <option value="7" ${numofpeople == 7 ? "selected" : ""}>7</option>
                                                        <option value="8" ${numofpeople == 8 ? "selected" : ""}>8</option>
                                                        <option value="9" ${numofpeople == 9 ? "selected" : ""}>9</option>
                                                    </select>
                                                    <span class="select-arrow"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-btn">
                                            <button class="submit-btn">Check availability</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Time Booking End-->

        <!-- Rooms Section Begin -->
        <section class="room-section spad">
            <div class="container">
                <c:forEach items="${availableVillas}" var="villa">
                    <div class="rooms-page-item">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="room-pic-slider owl-carousel">
                                    <!--                                    <div>
                                                                            
                                                                        </div>-->
                                    <div class="single-room-pic">
                                        <img src="${villa.villaIMG}" alt="${villa.villaIMG}"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="room-text">
                                    <div class="room-title">
                                        <h2>${villa.villaName}</h2>
                                        <div class="room-price">
                                            <span style="left: -55px;" >from</span>
                                            <h2 class="price-format">${Math.round(villa.villaPrice)}</h2> 


                                            <sub>/night</sub>
                                        </div>
                                    </div>
                                    <div class="room-desc">
                                        <p>${villa.villaDescription}</p>
                                    </div>
                                    <div class="room-features">
                                        <div class="room-info">
                                            <i class="flaticon-019-television"></i>
                                            <span>Smart TV</span>
                                        </div>
                                        <div class="room-info">
                                            <i class="flaticon-029-wifi"></i>
                                            <span>High Wi-fi</span>
                                        </div>
                                        <div class="room-info">
                                            <i class="flaticon-003-air-conditioner"></i>
                                            <span>AC</span>
                                        </div>
                                        <div class="room-info">
                                            <i class="flaticon-036-parking"></i>
                                            <span>Parking</span>
                                        </div>
                                        <div class="room-info last">
                                            <i class="flaticon-007-swimming-pool"></i>
                                            <span>Pool</span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <a href="javascript:void(0);" 
                                           class="primary-btn col-lg-5" 
                                           onclick="redirectToPage(this, 'detailvilla?villaId=${villa.villaId}')">View Detail <i class="lnr lnr-arrow-right"></i></a>
                                        <div class="col-lg-2"></div>
                                        <a href="javascript:void(0);" 
                                           class="primary-btn col-lg-5"
                                           onclick="redirectToPage(this, 'Booking?villaId=${villa.villaId}')">Book Now <i class="lnr lnr-arrow-right"></i></a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <c:if test="${empty availableVillas}">
                    <h3 style="text-align: center; color: red">There are no rooms available</h3>
                </c:if>

            </div>
        </section>
        <!-- Rooms Section End -->
        <jsp:include page="footer.jsp"></jsp:include>


        <script>
            function redirectToPage(link, baseUrl) {
                var fromDate = document.getElementById("fromDate").value;
                var toDate = document.getElementById("toDate").value;

                if (!fromDate || !toDate) {
                    alert("Please select Check-in and Check-out dates before proceeding!");
                    return false; // Chặn không cho chuyển trang
                }

                // Nếu đã chọn ngày, thay đổi href và chuyển trang
                window.location.href = baseUrl + "&fromDate=" + fromDate + "&toDate=" + toDate;
            }
            // Lấy thẻ h2 bằng class
            document.addEventListener("DOMContentLoaded", function () {
                var prices = document.querySelectorAll(".price-format");

                prices.forEach(function (priceElement) {
                    var number = parseFloat(priceElement.innerText); // Chuyển giá trị thành số

                    if (!isNaN(number)) {
                        var formattedNumber = number.toLocaleString('en-US', {minimumFractionDigits: 0});
                        priceElement.innerText = "$" + formattedNumber; // Thêm $ phía trước
                    }
                });
            });
            var prices = document.querySelectorAll(".price-format");
            console.log(prices.length);

            for (var i = 0; i < prices.length; i++) {

                // Chuyển giá trị của price thành số
                var number = parseFloat(prices[i].outerText);

                // Định dạng số với dấu chấm
                var formattedNumber = number.toLocaleString('de-DE');

                // Gán giá trị đã định dạng lại cho thẻ h2
                prices[i].innerText = formattedNumber;
            }
            document.addEventListener('DOMContentLoaded', function () {
                // Lấy phần tử input date
                var dateInput = document.querySelector(".date1");

                // Tạo đối tượng ngày hiện tại
                var today = new Date();

                // Định dạng ngày dưới dạng yyyy-mm-dd
                var day = String(today.getDate()).padStart(2, '0');
                var month = String(today.getMonth() + 1).padStart(2, '0'); // Tháng bắt đầu từ 0
                var year = today.getFullYear();

                var currentDate = year + '-' + month + '-' + day;

                // Thiết lập giá trị min cho input date
                dateInput.setAttribute('min', currentDate);
            });
            window.onload = function () {
                const currentDateInput = document.querySelector(".date1");
                const nextDateInput = document.querySelector(".date2");





//                const currentDate = new Date();
//                const nextDate = new Date();
//                nextDate.setDate(currentDate.getDate() + 2);
//
//                currentDateInput.value = currentDate.toISOString().split('T')[0];
//                nextDateInput.value = nextDate.toISOString().split('T')[0];
                currentDateInput.addEventListener('change', checkDates);
                nextDateInput.addEventListener('change', checkDates);




            };
            function checkDates() {
                const currentDateInput = document.querySelector(".date1");
                const nextDateInput = document.querySelector(".date2");

                const currentDate = new Date(currentDateInput.value);
                const nextDate = new Date(nextDateInput.value);


                if (currentDate >= nextDate) {
                    nextDate.setDate(currentDate.getDate() + 2);
                    nextDateInput.value = nextDate.toISOString().split('T')[0];
                }



            }


        </script>
    </body>
</html>