
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />

        <link
            href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
            rel="stylesheet"
            />

        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/loginForm.css" />
        <style>
            body{
                background-image: url('img/hotel03.jpg');
                background-size: cover;


            }
            .ftco-section {
                padding: 0;
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Welcome</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-7 col-lg-5">
                        <div class="wrap">
                            <div
                                class="img"
                                style="background-image: url(img/bg-1.jpg)"
                                ></div>
                            <h3 style="text-align: center; color: green">${success}</h3>
                            <h5 class="fs-5" style="text-align: center; color: red">${accountMessage}</h5>
                            <div class="login-wrap p-4 p-md-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <h3 class="mb-4">Login</h3>
                                    </div>
                                    <div class="w-100">
                                        <p class="social-media d-flex justify-content-end">
                                            <a
                                                href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/BookingResort/loginViaGoogle&response_type=code&client_id=737984428384-jtleetlqjdtt74u7jd38usd88i1b5dsm.apps.googleusercontent.com&approval_prompt=force"
                                                class="social-icon d-flex align-items-center justify-content-center"
                                                ><span class="fa-brands fa-google"></span
                                                ></a>
                                        </p>
                                    </div>
                                </div>
                                <form action="Login" class="signin-form" method="post">
                                    <div class="form-group mt-3">
                                        <input type="text" 
                                               class="form-control" 
                                               required name="userName" 
                                               value="${cookie.cUser.value}" />
                                        <label class="form-control-placeholder" for="username"
                                               >Username Or Email</label
                                        >
                                    </div>
                                    <div class="form-group">
                                        <input
                                            id=""
                                            type="password"
                                            class="form-control"
                                            required
                                            name="userPass"
                                            value="${cookie.cPass.value}"
                                            />
                                        <label class="form-control-placeholder" for="password"
                                               >Password</label
                                        >

                                    </div>
                                    <div class="form-group">
                                        <button
                                            type="submit"
                                            class="form-control btn btn-primary rounded submit px-3"
                                            >
                                            Login
                                        </button>
                                    </div>
                                    <div class="form-group d-md-flex">
                                        <div class="w-50 text-left">
                                            <label class="checkbox-wrap checkbox-primary mb-0"
                                                   >Remember Me
                                                <input name="remember" ${(cookie.cRem != null ? 'checked' : '')} type="checkbox" />
                                                <span class="checkmark"></span>
                                            </label>
                                        </div>
                                        <div class="w-50 text-md-right">
                                            <a href="forgotpassword.jsp">Forgot Password</a>
                                        </div>
                                    </div>
                                </form>
                                <p class="text-center">
                                    Not a member?
                                    <a href="register.jsp">Sign Up</a>
                                </p>
                                <button
                                    class="btn btn-success"
                                    style="position: absolute; left: 0; bottom: 0"
                                    onclick="goToHome()"
                                    >
                                    Home
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <script>
                                        const goToHome = () => {
                                            window.location = "home";
                                        };
        </script>
    </body>
</html>
