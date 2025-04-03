<%-- 
    Document   : informationaccount
    Created on : May 29, 2024, 4:02:50 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Information</title>
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
            /*---------------------
              Breadcrumb
             -----------------------*/

            .breadcrumb-option {
                padding-top: 35px;
            }

            .breadcrumb__links a {
                font-size: 15px;
                font-weight: 500;
                color: #111111;
                margin-right: 18px;
                display: inline-block;
                position: relative;
            }

            .breadcrumb__links a:after {
                position: absolute;
                right: -14px;
                top: 0;
                content: "";
                font-family: "FontAwesome";
            }

            .breadcrumb__links a i {
                margin-right: 5px;
            }

            .breadcrumb__links span {
                font-size: 15px;
                font-weight: 500;
                color: #888888;
                display: inline-block;
            }
            button{
                cursor: pointer;
            }
            img{
                border-radius: 50%;
                width: 100%;
            }
        </style>
    </head>
    <body>

            <div class="breadcrumb-option">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumb__links">
                                <a href="index.jsp"><i class="fa fa-home"></i> Home</a>
                                <a href="profile.jsp">Your Information</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Breadcrumb End -->

            <!-- Checkout Section Begin -->
            <section class="checkout spad">
                <div class="container">
                    <h3 style="color: red">${error}</h3>
                <h3 style="color: green">${msg}</h3>

                <a class="site-btn" href="resetPassword.jsp?action=${sessionScope.user.userPass != null ? 'notNullPass' : 'nullPass'}">Change password</a> 
                <button class="site-btn" onclick="logout()">Logout</button> 
                <form action="updateinfor" class="checkout__form" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-8">
                            <br>
                            <h5>Account detail</h5>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="checkout__form__input">
                                        <p>Username<span></span></p>
                                        <input style="border: none; outline: none; width: 500px" type="text" name="name" value="${sessionScope.user.userName}" readonly/>
                                    </div>
                                </div>

                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    <div class="checkout__form__input">
                                        <p>First Name <span></span></p>
                                        <input style="border: none; outline: none; width: 500px" type="text" name="name" value="${sessionScope.user.userFirstName}" readonly/>
                                    </div>
                                </div>

                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    <div class="checkout__form__input">
                                        <p>Last Name <span></span></p>
                                        <input style="border: none; outline: none; width: 500px" type="text" name="name" value="${sessionScope.user.userLastName}"/>
                                    </div>
                                </div>

                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="checkout__form__input">
                                        <p>Address <span></span></p>
                                        <input style="border: none; outline: none; width: 500px" type="text" name="address" required="" value="${sessionScope.user.userAddress}" readonly/>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="checkout__form__input">
                                        <p>Phone <span></span></p>
                                        <input style="border: none; outline: none; width: 500px" type="text" name="phonenumber" value="${sessionScope.user.userPhone}"  readonly/>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="checkout__form__input">
                                        <p>Email <span></span></p>
                                        <input style="border: none; outline: none; width: 500px" type="text" name="email" value="${sessionScope.user.userEmail}"  readonly/>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                </div>
                            </div>
                        </div>
                        <div style="width: 300px;height: 300px;border-radius: 50px; overflow:hidden" class="col-lg-4">
                            <img style="width: 300px; height: 300px; object-fit: cover;" class="avatar" src="${sessionScope.user.userIMG}" alt=""/>  
                        </div>
                    </div>
                </form>

                <a href="editProfile.jsp?referer=${referer}" style="" class="site-btn mb-5">Edit Profile</a>   

                <a href="${referer}" class="site-btn mb-5"><i class="fa fa-arrow-left"></i> Back</a>
            </div>
        </section>
        <!-- Checkout Section End -->

        <script>
            function  changeAvatar() {
                var input = document.querySelector("#avatar");
                var image = document.querySelector(".avatar");
                var avatarValue = document.querySelector("#avatarValue");
                console.log("File selected: ", input.files[0]);
                image.src = URL.createObjectURL(input.files[0]);
                avatarValue.value = "img/" + input.files[0].name;
                console.log(avatarValue.value);
            }
            function changePassword() {

                if (${sessionScope.user.userPass} === null) {
                    window.location.href = ("resetPassword.jsp?action=nullPass");
                } else {
                    window.location.href = ("resetPassword.jsp?action=notNullPass");
                }
            }
            function logout() {
                window.location.href = ("logout");
            }
        </script>
    </body>
</html> 
