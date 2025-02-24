<%-- 
    Document   : header
    Created on : May 25, 2024, 10:06:35 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="UTF-8" />
        <meta name="description" content="Hotel Template" />
        <meta name="keywords" content="Hotel, unica, creative, html" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Hotel | Template</title>

        <!-- Google Font -->
        <link
            href="https://fonts.googleapis.com/css?family=Taviraj:300,400,500,600,700,800,900&display=swap"
            rel="stylesheet"
            />
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800&display=swap"
            rel="stylesheet"
            />

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
        <link rel="stylesheet" href="css/flaticon.css" type="text/css" />
        <link rel="stylesheet" href="css/linearicons.css" type="text/css" />
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css" />
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css" />
        <link rel="stylesheet" href="css/nice-select.css" type="text/css" />
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css" />

        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
            integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            
            
            .logo-img{
                width: 100px;
                height: 100px;
                border-radius: 50%; 
            }
            
            .inner-header .main-menu ul li a{
                font-size: 20px;
            }
            
            .avatar-container{
                width: 68px;
                height: 68px;
                border-radius: 50px;
                overflow: hidden
            }
            
            .avatar-container img{
                width: 68px;
                height: 68px; 
                object-fit: cover;
                cursor: pointer;
            }

            .avatar {
                
            }

            .dropdownmenu {
                display: none;
                position: absolute;

                background-color: #f9f9f9;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1;
                border-radius: 4px;
                overflow: hidden;
                margin-top: 8px; /* Space between avatar and dropdown */


            }

            .dropdownmenu a {
                color: black;
                padding: 12px 12px;
                text-decoration: none;
                display: block;


            }

            .dropdownmenu a:hover {
                background-color: #f1f1f1;
            }
            
            
            .inner-header .main-menu ul li .drop-menu li a{
                font-size: 16px;
                white-space: nowrap;
            }
            
        </style>
    </head>
    <body>
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Header Section Begin -->
        <header class="header-section other-page">
            <div class="container-fluid">
                <div class="inner-header">
                    <div class="logo">
                        <!--<a href="home"><img src="img/logo.png" alt="" /></a>-->
                        <a href="home"><img class="logo-img" src="img/beach-resort-logo-palm-tree-element-chalet-roof-cottage-icon-minimalist_171487-350.png" alt=""/></a>
                      
                    </div>

                    <div class="top-widget mt-4">
                        <div class="top-info address">
                            <img src="img/placeholder.png" alt="" />


                            <span>Khu Đô Thị FPT Đà Nẵng<br />Q. Ngũ Hành Sơn, TP Đà Nẵng</span>
                        </div>

                        <div class="top-info phone-num">
                            <img src="img/phone.png" alt="" />
                            <span>+1 (603)535-4592</span>
                        </div>

                        <div class="top-info login">
                            <c:if test="${sessionScope.user == null}">      
                                <a href="#"><i class="fa-solid fa-right-to-bracket"></i></a>
                                <a href="login.jsp">Login</a> <i class="fa-solid fa-slash slash"></i>
                                <a href="register.jsp">Register</a>
                            </c:if>
                        </div>

                        <div class="login">
                            <c:if test="${sessionScope.user != null}">



                                <div class="avatar-container">
                                    <img src="${sessionScope.user.userIMG}" alt="${sessionScope.user.userIMG}" class="avatar" id="avatar" />

                                    <div class="dropdownmenu" id="dropdownmenu">
                                        <a href="profile.jsp">Profile</a>
                                        <a href="bookingHistory">Booking History</a>
                                        <a href="logout">Logout</a>
                                    </div>
                                </div>
                            </c:if>
                        </div>

                    </div>
                    <div class="container">
                        <nav class="main-menu mobile-menu">
                            <ul style="margin: 28px">
                                <li><a href="./index.jsp">Home</a></li>
                                
                                <li><a href="./roomAvailable?action=listAll">Villas</a></li>
                                <c:if test="${sessionScope.user != null && sessionScope.user.roleId == 3}">
                                    <li>
                                        <a href="#">Employee</a>
                                        <ul class="drop-menu">
                                            <li><a href="viewcustomer">View Customer</a></li>
                                            <li><a href="managerservice">Manager Service</a></li>
                                            <li><a href="ManageCancelBookingServlet?choice=pending">Manage Cancel Booking</a></li>
                                            <li><a href="statusroomservlet">Status Room</a></li>
                                        </ul>
                                    </li>
                                </c:if>


                                <c:if test="${sessionScope.user != null && sessionScope.user.roleId == 1}">
                                    <li>
                                        <a href="adminDashboard">Admin</a>
                                        <ul class="drop-menu">
                                            <li><a href="managervilla?list=point">Manager Villa</a></li>

                                            <li><a href="manageraccountservlet">Manager Account</a></li>
                                            <li><a href="manageremployee">Manager Employee</a></li>
                                            <li><a href="contactmessage">Contact Message</a></li>
                                            <li><a href="#" class="revenue">View revenue</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                                    <input type="hidden" class="revenue">

                                    <li><a href="./service.jsp">Services</a></li>
                                <li><a href="./contact.jsp">Contact</a></li>
                                
                            </ul>
                        </nav>
                    </div>
                    <div id="mobile-menu-wrap"></div>
                </div>
            </div>
        </header>\

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                //get current year
                let currentDate = new Date();
                let currentYear = currentDate.getFullYear();
                const revenue = document.querySelector(".revenue");
                revenue.href = "revenue?year=" + currentYear;

                //-----------------------------------------
                var avatar = document.getElementById("avatar");
                var dropdownMenu = document.getElementById("dropdownmenu");

                avatar.addEventListener("click", function (event) {
                    console.log("hello");
                    // Toggle dropdown visibility
                    if (dropdownMenu.style.display === "block") {
                        dropdownMenu.style.display = "none";
                    } else {
                        // Position dropdown relative to the avatar
                        var rect = avatar.getBoundingClientRect();
                        dropdownMenu.style.top = rect.bottom + window.scrollY + "px";
                        dropdownMenu.style.right = "1px";
                        dropdownMenu.style.display = "block";
                    }
                    event.stopPropagation(); // Prevent the click event from propagating to window
                });

                window.addEventListener("click", function () {
                    dropdownMenu.style.display = "none";
                });
            });
        </script>
    </body>
</html>
