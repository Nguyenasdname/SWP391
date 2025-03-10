<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Feedback</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
        <style>
            body {
                background: #f8f9fa;
            }
            .container-feedback {
                max-width: 600px;
                margin: auto;
                background: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            .thank-you-message {
                display: none;
                padding: 20px;
                margin-bottom: 20px;
                background: #e9f7ef;
                color: #2d7a50;
                border-radius: 10px;
                font-size: 18px;
                font-weight: bold;
            }
            .star-rating {
                color: #f39c12;
                font-size: 20px;
            }
            .rating-container {
                font-size: 30px;
                display: flex;
                justify-content: center;
                margin-bottom: 10px;
            }
            .star {
                cursor: pointer;
                transition: color 0.3s;
            }
            .star:before {
                content: '\f005';
                font-family: FontAwesome;
                color: #ccc;
            }
            .star.active:before,
            .star:hover:before {
                color: #f39c12;
            }
            body{
                background-image: url("img/feedbackBackground.jpg") !important;
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <div class="container-feedback">
                <div class="thank-you-message" id="thankYouMessage">
                    <i class="fa fa-check-circle"></i> Thank you for your booking! Please leave your feedback below.
                </div>

                <h2 class="text-center mb-4">Leave a Review</h2>
                <form action="leaveFeedback" method="post">
                    <input type="hidden" name="villaId" value="1">
                    <input type="hidden" name="userId" value="${sessionScope.user.userId}">
                    <input type="hidden" name="action" value="feedbackAfterPayment">

                    <div>
                        
                        <div class="rating-container">
                            <span class="star" data-value="1"></span>
                            <span class="star" data-value="2"></span>
                            <span class="star" data-value="3"></span>
                            <span class="star" data-value="4"></span>
                            <span class="star" data-value="5"></span>
                        </div>
                        <input type="hidden" name="rating" id="rating-value">
                    </div>

                    <div class="mt-3">
                        <textarea class="form-control" name="comment" rows="3" required></textarea>
                    </div>

                    <button type="submit" class="btn btn-primary w-100 mt-3"><i class="fa fa-paper-plane"></i> Submit Feedback</button>
                </form>

                <a href="index.jsp?alertMessage=Thank you!" class="btn btn-secondary w-100 mt-3"><i class="fa fa-home"></i> Home</a>
            </div>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const stars = document.querySelectorAll(".star");
                const ratingInput = document.getElementById("rating-value");

                stars.forEach(star => {
                    star.addEventListener("mouseover", function () {
                        resetStars();
                        let value = this.getAttribute("data-value");
                        stars.forEach(s => {
                            if (parseFloat(s.getAttribute("data-value")) <= parseFloat(value)) {
                                s.classList.add("active");
                            }
                        });
                    });

                    star.addEventListener("mouseout", function () {
                        resetStars();
                        let selectedValue = ratingInput.value;
                        if (selectedValue) {
                            stars.forEach(s => {
                                if (parseFloat(s.getAttribute("data-value")) <= parseFloat(selectedValue)) {
                                    s.classList.add("active");
                                }
                            });
                        }
                    });

                    star.addEventListener("click", function () {
                        let value = this.getAttribute("data-value");
                        ratingInput.value = value;
                        resetStars();
                        stars.forEach(s => {
                            if (parseFloat(s.getAttribute("data-value")) <= parseFloat(value)) {
                                s.classList.add("active");
                            }
                        });
                    });
                });

                function resetStars() {
                    stars.forEach(s => s.classList.remove("active"));
                }

                // Kiểm tra nếu thanh toán thành công thì hiện thông báo
                let paymentSuccess = new URLSearchParams(window.location.search).get("paymentSuccess");
//                if (paymentSuccess === "true") {
                document.getElementById("thankYouMessage").style.display = "block";
//                }
            });
            document.addEventListener("DOMContentLoaded", function () {
                let feedbackForm = document.querySelector("form[action='leaveFeedback']");
                let ratingInput = document.getElementById("rating-value");
                let ratingContainer = document.querySelector(".rating-container");

                if (feedbackForm) {
                    feedbackForm.addEventListener("submit", function (event) {
                        if (!ratingInput.value) {
                            event.preventDefault(); // Ngăn form gửi đi
                            alert("Please select a rating before submitting your feedback.");

                            // Thêm hiệu ứng cảnh báo vào rating
                            ratingContainer.style.border = "2px solid red";
                            ratingContainer.style.borderRadius = "8px";

                            // Xóa viền đỏ sau vài giây để không gây khó chịu
                            setTimeout(() => {
                                ratingContainer.style.border = "none";
                            }, 1000);
                        }
                    });
                }
            });
        </script>    
    </body>
</html>
