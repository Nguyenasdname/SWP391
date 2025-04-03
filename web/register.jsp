<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
        <title>Register Page</title>
        <style>
            body {
                background-image: url("img/hotel01.jpg");
                background-size: cover;
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
        </style>
    </head>
    <body>
        <section class="text-center text-lg-start">
            <div class="container py-4">
                <div class="row g-0 align-items-center">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <div class="card bg-body-tertiary" style="backdrop-filter: blur(30px)">
                            <div class="card-body p-5 shadow-5 text-center">
                                <h2 class="fw-bold mb-5">Sign up now</h2>
                                <span style="color: red">${errorMessage}</span>
                                <form action="register" method="post" onsubmit="return validateEmail()">
                                    <div class="form-outline mb-4">
                                        <label class="form-label">Username</label>
                                        <input type="text" class="form-control" name="userName" required value="${thisUserName}" />
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label">Password</label>
                                        <input type="password" id="password" class="form-control" name="userPass" required />
                                        <label>Strength of password</label>
                                        <div class="power-container"><div id="power-point"></div></div>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label">Confirm Password</label>
                                        <input type="password" id="confirmPassword" class="form-control" name="confirmPass" required oninput="checkMatch(this)" />
                                        <span style="color: red" class="error"></span>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label">Email address</label>
                                        <input type="email" id="email" class="form-control" name="userEmail" required value="${thisUserEmail}" />
                                        <span style="color: red" id="emailError"></span>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-block mb-4 btn-SignUp">Sign up</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>
            function validateEmail() {
                var email = document.getElementById("email").value;
                var emailError = document.getElementById("emailError");
                if (!email.endsWith("@gmail.com")) {
                    emailError.textContent = "Email must end with @gmail.com";
                    return false;
                }
                emailError.textContent = "";
                return true;
            }
            function checkMatch(confirm) {
                var newpass = document.getElementById("password");
                var error = document.querySelector(".error");
                if (confirm.value === newpass.value) {
                    error.style.display = "none";
                } else {
                    error.style.display = "inline-block";
                    error.textContent = "Password not match";
                }
            }
            let password = document.getElementById("password");
            let power = document.getElementById("power-point");
            password.oninput = function () {
                let point = 0;
                let value = password.value;
                let widthPower = ["1%", "25%", "50%", "75%", "100%"];
                let colorPower = ["#D73F40", "#DC6551", "#F2B84F", "#BDE952", "#3ba62f"];
                if (value.length >= 6) {
                    let arrayTest = [/[0-9]/, /[a-z]/, /[A-Z]/, /[^0-9a-zA-Z]/];
                    arrayTest.forEach((item) => { if (item.test(value)) { point += 1; } });
                }
                power.style.width = widthPower[point];
                power.style.backgroundColor = colorPower[point];
            };
        </script>
    </body>
</html>