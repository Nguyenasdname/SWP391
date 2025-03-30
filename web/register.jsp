


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/bootstrap.min.css" />

        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
            integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />


        <title>Register Page</title>
        <style>
            body{
                background-image: url("img/hotel01.jpg");
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <!-- Section: Design Block -->
        <section class="text-center text-lg-start">
            <style>
                .cascading-right {
                    margin-right: -50px;
                }
                .power-container {
                    background-color: #2E424D;
                    width: 100%;
                    height: 15px;
                    border-radius: 5px;
                }
                .power-container #power-point {
                    background-color: #D73F40;
                    width: 1%;
                    height: 100%;
                    border-radius: 5px;
                    transition: 0.5s;
                }
                @media (max-width: 991.98px) {
                    .cascading-right {
                        margin-right: 0;
                    }
                }

            </style>

            <!-- Jumbotron -->
            <div class="container py-4">
                <div class="row g-0 align-items-center">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <div
                            class="card cascading-right bg-body-tertiary"
                            style="backdrop-filter: blur(30px)"
                            >
                            <div class="card-body p-5 shadow-5 text-center">
                                <h2 class="fw-bold mb-5">Sign up now</h2>
                                <span style="color: red">${errorMessage}</span>
                                <form action="register" method="post">

                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <label class="form-label" for="form3Example3"
                                               >Username</label
                                        >
                                        <input
                                            type="text"
                                            id="form3Example3"
                                            class="form-control"
                                            name="userName"
                                            required
                                            value="${thisUserName}"
                                            />

                                    </div>

                                    <!-- Password input -->
                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <label class="form-label" for="form3Example4"
                                               >Password</label
                                        >
                                        <input
                                            type="password"
                                            id="form3Example4"
                                            class="form-control"
                                            name="userPass"
                                            required
                                            value="${userPass}"
                                            />
                                        <label for=""> 
                                            Strength of password 
                                        </label> 
                                        <div class="power-container"> 
                                            <div id="power-point"></div> 
                                        </div> 
                                    </div>
                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <label class="form-label" for="form3Example4"
                                               >Confirm Password</label
                                        >
                                        <input
                                            type="password"
                                            id="form3Example4"
                                            class="form-control"
                                            name="confirmPass"
                                            required
                                            value="${confirmPass}"
                                            oninput="checkMatch(this)"
                                            />

                                        <br>
                                        <span style="color: red" class="error"></span>
                                    </div>
                                    <div data-mdb-input-init class="form-outline mb-4">
                                        <label class="form-label" for="form3Example3"
                                               >Email address</label
                                        >
                                        <input
                                            type="email"
                                            id="form3Example3"
                                            class="form-control"
                                            name="userEmail"
                                            required
                                            value="${thisUserEmail}"
                                            />

                                    </div>
                                    <!-- Checkbox -->

                                    <!-- Submit button -->
                                    <button
                                        type="submit"
                                        data-mdb-button-init
                                        data-mdb-ripple-init
                                        class="btn btn-primary btn-block mb-4 btn-SignUp"
                                        >
                                        Sign up
                                    </button>


                            </div>
                        </div>
                        <!-- Jumbotron -->
                        </section>
                        <!-- Section: Design Block -->
                        </body>
                        <script>
                            const checkMatch = (confirm) => {
                                var newpass = document.querySelector("#form3Example4");
                                var error = document.querySelector(".error");
                                var btn = document.querySelector(".btn-SignUp");
                                if (confirm.value === newpass.value) {
                                    error.style.display = "none";
                                    btn.type = "submit";
                                } else {
                                    error.style.display = "inline-block";
                                    error.textContent = "Password not match";
                                    btn.type = "button";
                                }
                            };
                            let password = document.getElementById("form3Example4");
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
