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
                                <a href="editProfile.jsp">Edit Profile</a>
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



                <form action="editProfile" class="checkout__form" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-8">
                            <br>
                            <h5>Account detail</h5>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="checkout__form__input">
                                        <p>First Name <span>*</span></p>
                                        <input type="text" name="userFirstName" value="${sessionScope.user.userFirstName}" required/>
                                    </div>
                                </div>

                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="checkout__form__input">
                                        <p>Last Name <span>*</span></p>
                                        <input type="text" name="userLastName" value="${sessionScope.user.userLastName}" required/>
                                    </div>
                                </div>

                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="checkout__form__input">
                                        <p>Address <span>*</span></p>
                                        <input type="text" name="userAddress" required="" value="${sessionScope.user.userAddress}"required/>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="checkout__form__input">
                                        <p>Phone <span>*</span></p>
                                        <input type="text" name="userPhone" value="${sessionScope.user.userPhone}" required/>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                </div>
                            </div>
                        </div>

                        <div style="width: 300px; height: 300px; border-radius: 300px; overflow: hidden; position: relative; background-color: #f0f0f0; display: flex; align-items: center; justify-content: center; cursor: pointer;" onclick="document.querySelector('#avatar').click()">
                            <img id="preview" style="width: 300px; height: 300px; object-fit: cover; border-radius: 50%; display: none;" src="" alt=""/>
                            <span id="placeholder" style="position: absolute; font-size: 24px; border-radius: 50px; color: #aaa;">📷</span>
                            <input id="avatar" name="image" type="file" style="display: none;" onchange="changeAvatar()">
                            <input type="hidden" id="avatarValue" name="avatar">    
                        </div>

                    </div>
                    <input type="hidden" value="user" name="status">
                    <button type="submit" class="site-btn">Update</button>

                </form>

            </div>
        </section>
        <!-- Checkout Section End -->

        <script>
//         
            document.addEventListener("DOMContentLoaded", function () {
                var imageUrl = "${sessionScope.user.userIMG}";
                var preview = document.getElementById("preview");
                var placeholder = document.getElementById("placeholder");

                if (imageUrl) {
                    preview.src = imageUrl;
                    preview.style.display = "block";
                    placeholder.style.display = "none";
                }
            });

            function changeAvatar() {
                var input = document.querySelector("#avatar");
                var preview = document.querySelector("#preview");
                var placeholder = document.querySelector("#placeholder");
                var avatarValue = document.querySelector("#avatarValue");

                if (input.files && input.files[0]) {
                    preview.src = URL.createObjectURL(input.files[0]);
                    preview.style.display = "block";
                    placeholder.style.display = "none";
                    avatarValue.value = "img/" + input.files[0].name;
                }
            }

        </script>

    </body>
</html> 
