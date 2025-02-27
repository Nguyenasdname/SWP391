<%-- 
    Document   : forgotpassword
    Created on : May 26, 2024, 12:37:01 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link
            rel="stylesheet"
            href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            />
        <title>Forgot password Page</title>
    </head>
    <body>
        <!-- Password Reset 8 - Bootstrap Brain Component -->
        <section class="bg-light p-3 p-md-4 p-xl-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 col-xxl-11">
                        <div class="card border-light-subtle shadow-sm">
                            <div class="row g-0">
                                <div class="col-12 col-md-6">
                                    <img
                                        class="img-fluid rounded-start w-100 h-100 object-fit-cover"
                                        loading="lazy"
                                        src="img/bg-1.jpg"
                                        alt="Welcome back you've been missed!"
                                        />
                                </div>
                                <div
                                    class="col-12 col-md-6 d-flex align-items-center justify-content-center"
                                    >
                                    <div class="col-12 col-lg-11 col-xl-10">
                                        <div class="card-body p-3 p-md-4 p-xl-5">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="mb-5">
                                                        <div class="text-center mb-4">
                                                            <!-- <a href="#!">
                                                              <img
                                                                src="./assets/img/bsb-logo.svg"
                                                                alt="BootstrapBrain Logo"
                                                                width="175"
                                                                height="57"
                                                              />
                                                            </a> -->
                                                        </div>
                                                        <h2 class="h4 text-center">Password Reset</h2>
                                                        <h3
                                                            class="fs-6 fw-normal text-secondary text-center m-0"
                                                            >
                                                            Provide the email address associated with your
                                                            account to recover your password.
                                                        </h3>
                                                        <h3 class="fs-6 fw-normal   m-0" style="color: red">${errorMessage}</h3>
                                                    </div>
                                                </div>
                                            </div>
                                            <form action="forgotPassword" method="post">
                                                <div class="row gy-3 overflow-hidden">
                                                    <div class="col-12">
                                                        <div class="form-floating mb-3">
                                                            <input
                                                                type="email"
                                                                class="form-control"
                                                                name="userEmail"
                                                                id="email"
                                                                placeholder="name@example.com"
                                                                required
                                                                />
                                                            <label for="email" class="form-label"
                                                                   >Email</label
                                                            >
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="d-grid">
                                                            <button class="btn btn-dark btn-lg" type="submit">
                                                                Reset Password
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                            <div class="row">
                                                <div class="col-12">
                                                    <div
                                                        class="d-flex gap-2 gap-md-4 flex-column flex-md-row justify-content-md-center mt-5"
                                                        >
                                                        <a
                                                            href="login.jsp"
                                                            class="link-secondary text-decoration-none"
                                                            >Login</a>
                                                        <a
                                                            href="register.jsp"
                                                            class="link-secondary text-decoration-none"
                                                            >Register</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
