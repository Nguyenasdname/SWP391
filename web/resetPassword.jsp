<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Get Back Password</title>

        <!-- Google Font -->
        <link
            href="https://fonts.googleapis.com/css2?family=Cookie&display=swap"
            rel="stylesheet"
            />
        <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
            rel="stylesheet"
            />

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css" />
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css" />
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css" />
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css" />
        <link href="css/formChangePassword.css" rel="stylesheet" type="text/css"/>

        <style>
            .power-container {

                background-color: #2E424D;
                width: 100%;
                height: 15px;
                margin-bottom: 10px;
                border-radius: 5px;
            }
            .power-container #power-point {
                background-color: #D73F40;
                width: 1%;
                height: 100%;
                border-radius: 5px;
                transition: 0.5s;
            }
        </style>
    </head>
    <body>
        <section class="checkout spad">
            <div class="container">
                <h3 style="color: red">${error}</h3>
                <c:if test="${param.action eq 'nullPass'}">
                    <form action="changePassword?action=${param.action}" class="checkout__form" method="post">
                        <div class="row">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-8">
                                <br>
                                <h5 style="text-align: center">Change Password</h5>
                                <h4 style="color: red">${errorMessage}</h4>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="checkout__form__input">
                                            <p>New Password <span>*</span></p>
                                            <input style="margin-bottom: 10px" id="newPass" type="password" name="newPassword" required="" />
                                            <label for="" style="width: 100% ;font-weight: 500; color: #444444; text-align: center"> 
                                                Strength of password 
                                            </label> 
                                            <div class="power-container"> 
                                                <div id="power-point"></div> 
                                            </div> 
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="checkout__form__input">
                                            <p>Confirm Password <span>*</span></p>
                                            <input type="password" name="confirmPassword" required="" oninput="checkMatch(this)"/>
                                            <span style="color: red" class="error"></span>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" name="id" value="${requestScope.idAccountForgetPass}">
                                <button type="submit" class="site-btn btn">Confirm</button>
                            </div>
                            <div class="col-lg-2"></div>
                        </div>
                    </form>
                </c:if> 
                <c:if test="${param.action eq 'notNullPass'}">
                    <form action="changePassword?action=${param.action}" class="checkout__form" method="post">
                        <div class="row">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-8">
                                <br>
                                <h5 style="text-align: center">Change Password</h5>
                                <h4 style="color: red">${errorMessage}</h4>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="checkout__form__input">
                                            <p>Current Password<span>*</span></p>
                                            <input type="password" name="currentPass" required/>
                                            <span style="color: red" class="error"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="checkout__form__input">
                                            <p>New Password <span>*</span></p>
                                            <input style="margin-bottom: 10px" id="newPass" type="password" name="newPassword" required="" />
                                            <label for="" style="width: 100% ;font-weight: 500; color: #444444; text-align: center"> 
                                                Strength of password 
                                            </label> 
                                            <div class="power-container"> 
                                                <div id="power-point"></div> 
                                            </div> 
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="checkout__form__input">
                                            <p>Confirm Password <span>*</span></p>
                                            <input type="password" name="confirmPassword" required oninput="checkMatch(this)"/>
                                            <span style="color: red" class="error"></span>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" name="id" value="${requestScope.idAccountForgetPass}">
                                <button type="submit" class="site-btn btn">Confirm</button>
                            </div>
                            <div class="col-lg-2"></div>
                        </div>
                    </form>
                </c:if>
            </div>
        </section>
    </body>


    <script>
        const checkMatch = (confirm) => {
            var newpass = document.querySelector("#newPass");
            var error = document.querySelector(".error");
            var btn = document.querySelector(".btn");
            if (confirm.value === newpass.value) {
                error.style.display = "none";
                btn.type = "submit";
            } else {
                error.style.display = "inline-block";
                error.textContent = "Password not match";
                btn.type = "button";
            }
        };

        let password = document.getElementById("newPass");
        let power = document.getElementById("power-point");
        password.oninput = function () {
            let point = 0;
            let value = password.value;
            let widthPower =
                    ["1%", "25%", "50%", "75%", "100%"];
            let colorPower =
                    ["#D73F40", "#DC6551", "#F2B84F", "#BDE952", "#3ba62f"];

            if (value.length >= 6) {
                let arrayTest =
                        [/[0-9]/, /[a-z]/, /[A-Z]/, /[^0-9a-zA-Z]/];
                arrayTest.forEach((item) => {
                    if (item.test(value)) {
                        point += 1;
                    }
                });
            }

            power.style.width = widthPower[point];
            power.style.backgroundColor = colorPower[point];

        };
    </script>

</html>
