<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Villa Details</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />

        <style>
            body {
                background: #f8f9fa;
            }
            .villa-container {
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            }
            .villa-image{
                width: 800px;
                height: 550px;
                overflow: hidden;
                position: relative;
                display: flex;
                justify-content: center;
                text-align: center;
            }
            .villa-image img{
                width:100%;
                height: 100%;
                border-radius: 10px;
                object-fit: cover;
            }
            .addWishlist{
                position: absolute;
                top: 10px; /* Điều chỉnh vị trí theo chiều dọc */
                right: 10px; /* Điều chỉnh vị trí theo chiều ngang */
                width: 60px;
                height: 60px;
                border-radius: 50px;
                background-color: white;
                display: flex;
                align-items: center; /* Căn giữa icon theo chiều dọc */
                justify-content: center; /* Căn giữa icon theo chiều ngang */
                transition: 0.6s ease
                
            }
            .addWishlist:hover{
                box-shadow: 0 0 10px rgba(0, 0, 0, 5);
            }

            .heart-wishlish{
                padding-top: 5px;
                color: red;
                font-size: 40px;
                border-radius: 50px;
            }
            .iconWishlist{
                width: 50px;
                height: 50px;
            }
            .star-rating {
                color: #f39c12;
                font-size: 20px;
            }
            .feedback-item {
                border-bottom: 1px solid #ddd;
                padding-bottom: 10px;

            }
            .rating-input {
                font-size: 25px;
                cursor: pointer;
                color: #ccc;
            }
            .rating-input:hover,
            .rating-input.active {
                color: #f39c12;
            }
            .rating-container {
                display: inline-block;
                font-size: 30px;
            }

            .star {
                font-family: FontAwesome;
                cursor: pointer;
                display: inline-block;
                transition: color 0.3s;
            }

            .star:before {
                content: '\f005'; /* Unicode của FontAwesome star */
                color: #ccc;
            }

            .star.active:before,
            .star:hover:before {
                color: #f39c12; /* Màu vàng cho rating đã chọn */
            }
            .feedback-avatar {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                overflow: hidden;
                margin-right: 15px;
            }

            .feedback-avatar img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
            .feedback-date {
                font-size: 14px;
                color: #777;
                margin-left: 10px;
            }
            .edit-feedback{
                font-size: 14px;
                color: #777;
                margin-left: 1000px;
            }
            .edit-feedback a{
                text-decoration: none;
            }
            .room-features {
                display: flex;
                flex-wrap: wrap;
                gap: 10px; /* Khoảng cách giữa các item */
            }

            .room-info {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 5px;
                padding: 8px;
                background: #f8f9fa;
                border-radius: 5px;
                width: 100px
            }
            body{
                background-image: url("img/villaDetailsBackground.jpg") !important;
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div style="margin-bottom: 150px"></div>
            <div class="container">
                <div class="villa-container">
                    <div class="row">
                        <div class="col-md-10">
                            <h2 class="text-center d-flex justify-content-left">${villa.villaName}</h2>
                        <div>
                            <h4>Rating: <span>${averageRating == null ? 0 : averageRating} / 5 <i class="fa-star fas star-rating"></i></span></h4>
                            <p><strong>${reviews} Reviews</strong></p>
                        </div>
                    </div>

                </div>

                <c:set var="isInWishlist" value="false"/>
                <c:forEach var="wish" items="${wishlist}">
                    <c:if test="${wish.userId == sessionScope.user.userId}">
                        <c:set var="isInWishlist" value="true"/>
                    </c:if>
                </c:forEach>
                <div class="row">
                    <div class="col-md-9">
                        <div class="villa-image">
                            <img src="${villa.villaIMG}" alt="Villa Image">
                            <c:if test="${sessionScope.user ne null}">
                                <form action="addToWishlist?userId=${sessionScope.user.userId}&villaId=${villa.villaId}" method="post">
                                    <button type="submit" class="addWishlist"><i class="iconWishlist fa-heart ${isInWishlist ? 'fas' : 'far'} heart-wishlish"></i></button>
                                </form>
                            </c:if>
                        </div>
                    </div>
                    <div class="col-md-3">


                        <p class="text-dark"><strong>Price:</strong> $${villa.villaPrice} per night</p>
                        <p class="text-dark"><strong>Max Guests:</strong> ${villa.villaCapacity}</p>

                        <div class="room-features">
                            <div class="room-info">
                                <i class="flaticon-019-television"></i>

                            </div>
                            <div class="room-info">
                                <i class="flaticon-029-wifi"></i>

                            </div>
                            <div class="room-info">
                                <i class="flaticon-003-air-conditioner"></i>

                            </div>
                            <div class="room-info">
                                <i class="flaticon-036-parking"></i>

                            </div>
                            <div class="room-info last">
                                <i class="flaticon-007-swimming-pool"></i>

                            </div>
                        </div>
                        <div class="map-container mt-4" style="width: 250px; height: 175px; border-radius: 10px; overflow: hidden;">
                            <iframe 
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15342.813252636519!2d108.25116624229396!3d15.97686268400203!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142116949840599%3A0x365b35580f52e8d5!2zxJDhuqFpIGjhu41jIEZQVCDEkMOgIE7hurVuZw!5e0!3m2!1svi!2s!4v1740406581239!5m2!1svi!2s" 
                                width="100%"
                                height="100%"
                                style="border:0;" 
                                allowfullscreen="" 
                                loading="lazy" 
                                referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>

                    </div>
                </div>
                <h5 class="ps-4 mt-3 text-dark"> ${villa.villaDescription}</h5>

                <!-- Modal chọn ngày và số người -->
                <div id="bookingModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); z-index: 1000; display: flex; justify-content: center; align-items: center;">
                    <div style="background: white; padding: 20px; border-radius: 10px; width: 400px; text-align: center;">
                        <h4>Select Booking Details</h4>
                        <div>
                            <label>Check-in Date:</label>
                            <input id="modalFromDate" type="date" class="form-control" value="${fromDate}">
                        </div>
                        <div>
                            <label>Check-out Date:</label>
                            <input id="modalToDate" type="date" class="form-control" value="${toDate}">
                        </div>
                        <div>
                            <label>Number of Guests:</label>
                            <select id="modalNumberOfGuest" class="form-control">
                                <c:forEach var="i" begin="1" end="${villa.villaCapacity}">
                                    <option value="${i}" ${numberOfGuest == i ? "selected" : ""}>${i}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <br>
                        <button onclick="confirmBookingDetails()" class="btn btn-success">Confirm</button>
                    </div>
                </div>





                <!-- Nút Back và Book Now -->
                <div class="mt-4 d-flex justify-content-between">
                    <a href="${originalURL}" class="btn btn-secondary"><i class="fa fa-arrow-left"></i> Back</a>
                    <!--<a href="booking?villaId=${villa.villaId}&fromDate=${fromDate}&toDate=${toDate}&numberOfGuest=${numberOfGuest}" class="btn btn-primary">Book Now</a>-->
                    <a href="javascript:void(0);" id="bookNowBtn" class="btn btn-primary">Book Now</a>

                </div>

                <hr class="bg-dark">

                <!-- Phần Feedback -->
                <h3>Comments</h3>


                <c:if test="${not empty sessionScope.user}">
                    <form action="leaveFeedback" method="post">
                        <input type="hidden" name="villaId" value="${villa.villaId}">
                        <input type="hidden" name="userId" value="${sessionScope.user.userId}">
                        <input type="hidden" name="fromDate" value="${param.fromDate}">
                        <input type="hidden" name="toDate" value="${param.toDate}">
                        <input type="hidden" name="numberOfGuest" value="${param.numberOfGuest}">

                        <div>
                            <label for="rating">Your Rating:</label>
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
                            <label for="comment">Your Comment:</label>
                            <textarea class="form-control" name="comment" rows="3" required></textarea>
                        </div>

                        <button type="submit" class="btn btn-primary mt-3">Comment</button>
                    </form>
                </c:if>

                <hr class="bg-dark">
                <c:forEach items="${feedbackList}" var="feedback">
                    <div class="feedback-item d-flex align-items-center">
                        <div class="feedback-avatar">
                            <img src="${feedback.userIMG != null ? feedback.userIMG : 'img/default-avatar.jpg'}" alt="User Avatar">
                        </div>
                        <div>
                            <strong>${feedback.userName}</strong> 
                            <span class="feedback-date">(${feedback.createDate})</span>

                            <c:if test="${sessionScope.user != null && sessionScope.user.userId == feedback.userId}">
                                <span class="edit-feedback">
                                    <a href="javascript:void(0);" onclick="showEditForm(${feedback.feedbackId})">Edit</a>
                                </span>
                            </c:if>

                            <br>

                            <!-- Hiển thị sao -->
                            <div id="static-rating-${feedback.feedbackId}">
                                <c:forEach begin="1" end="5" varStatus="i">
                                    <i class="fa-star ${i.index <= feedback.rating ? 'fas' : 'far'} star-rating"></i>
                                </c:forEach>
                            </div>

                            <p id="comment-${feedback.feedbackId}">${feedback.comment}</p>

                            <!-- Form chỉnh sửa (ẩn mặc định) -->
                            <div id="edit-form-${feedback.feedbackId}" style="display: none;">
                                <form action="editFeedBack" method="post">
                                    <input type="hidden" name="feedbackId" value="${feedback.feedbackId}">
                                    <input type="hidden" name="villaId" value="${villa.villaId}">
                                    <input type="hidden" name="userId" value="${sessionScope.user.userId}">
                                    <input type="hidden" name="fromDate" value="${param.fromDate}">
                                    <input type="hidden" name="toDate" value="${param.toDate}">
                                    <input type="hidden" name="numberOfGuest" value="${param.numberOfGuest}">

                                    <label for="rating">Rating:</label>
                                    <div class="rating-container" id="edit-rating-${feedback.feedbackId}">
                                        <span class="star" data-value="1"></span>
                                        <span class="star" data-value="2"></span>
                                        <span class="star" data-value="3"></span>
                                        <span class="star" data-value="4"></span>
                                        <span class="star" data-value="5"></span>
                                    </div>
                                    <input type="hidden" name="rating" id="rating-value-edit">


                                    <label>Comment:</label>
                                    <textarea class="form-control" name="comment" id="edit-comment-${feedback.feedbackId}" rows="3">${feedback.comment}</textarea>

                                    <button type="submit" class="btn btn-success mt-2">Confirm</button>
                                    <button type="button" class="btn btn-secondary mt-2" onclick="hideEditForm(${feedback.feedbackId})">Cancel</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>




                <c:if test="${empty feedbackList}">
                    <p>No feedback available for this villa.</p>
                </c:if>
            </div>
        </div>
        <div style="margin-bottom: 100px"></div>   
        <jsp:include page="footer.jsp"></jsp:include>

            <script>
                function showEditForm(feedbackId) {
                    document.getElementById("edit-form-" + feedbackId).style.display = "block";
                    document.getElementById("comment-" + feedbackId).style.display = "none";
                }

                function hideEditForm(feedbackId) {
                    document.getElementById("edit-form-" + feedbackId).style.display = "none";
                    document.getElementById("comment-" + feedbackId).style.display = "block";
                }

                document.addEventListener("DOMContentLoaded", function () {
                    const stars = document.querySelectorAll(".star");
                    const ratingInput = document.getElementById("rating-value");
                    const ratingEdit = document.getElementById("rating-value-edit")

                    stars.forEach(star => {
                        // Khi di chuột vào sao nào, làm sáng tất cả các sao trước đó
                        star.addEventListener("mouseover", function () {
                            resetStars();
                            let value = this.getAttribute("data-value");

                            stars.forEach(s => {
                                if (parseFloat(s.getAttribute("data-value")) <= parseFloat(value)) {
                                    s.classList.add("active");
                                }
                            });
                        });

                        // Khi chuột rời đi, nếu chưa chọn sao nào thì reset lại
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

                        // Khi click vào sao, lưu giá trị rating
                        star.addEventListener("click", function () {
                            let value = this.getAttribute("data-value");
                            ratingInput.value = value;
                            ratingEdit.value = value;
                            // Xóa hết class active
                            resetStars();

                            // Gán active cho các sao trước nó
                            stars.forEach(s => {
                                if (parseFloat(s.getAttribute("data-value")) <= parseFloat(value)) {
                                    s.classList.add("active");
                                }
                            });
                        });
                    });

                    // Hàm reset tất cả các sao
                    function resetStars() {
                        stars.forEach(s => s.classList.remove("active"));
                    }
                });

            </script>

            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    // Ẩn modal khi tải trang
                    document.getElementById("bookingModal").style.display = "none";

                    let today = new Date();
                    let formattedToday = today.toISOString().split('T')[0];
                    document.getElementById("modalFromDate").setAttribute("min", formattedToday);


                    // Reset dữ liệu nếu quay lại trang hoặc mở lại trang

                    localStorage.removeItem("fromDate");
                    localStorage.removeItem("toDate");
                    localStorage.removeItem("numberOfGuest");

                    // Lấy dữ liệu từ trang rooms nếu có
                    let urlParams = new URLSearchParams(window.location.search);
                    let fromDateParam = urlParams.get("fromDate");
                    let toDateParam = urlParams.get("toDate");
                    let numberOfGuestParam = urlParams.get("numberOfGuest");

                    if (fromDateParam && toDateParam && numberOfGuestParam) {
                        localStorage.setItem("fromDate", fromDateParam);
                        localStorage.setItem("toDate", toDateParam);
                        localStorage.setItem("numberOfGuest", numberOfGuestParam);
                    }

                    document.getElementById("bookNowBtn").addEventListener("click", function (event) {
                        let fromDate = localStorage.getItem("fromDate");
                        let toDate = localStorage.getItem("toDate");
                        let numberOfGuest = localStorage.getItem("numberOfGuest");

                        if (!fromDate || !toDate || !numberOfGuest) {
                            event.preventDefault(); // Ngăn chặn chuyển hướng
                            openBookingModal();
                        } else {
                            window.location.href = "booking?villaId=${villa.villaId}&fromDate=" + fromDate + "&toDate=" + toDate + "&numberOfGuest=" + numberOfGuest;
                        }
                    });

                    // Đóng modal khi nhấn ra ngoài
                    document.getElementById("bookingModal").addEventListener("click", function (event) {
                        if (event.target === this) {
                            closeBookingModal();
                        }
                    });

                    document.getElementById("modalToDate").addEventListener("change", function () {
                        updateCheckoutDate();
                    });


                    // Hàm đảm bảo ngày check-out luôn sau ngày check-in ít nhất 2 ngày
                    function updateCheckoutDate() {
                        let fromDateInput = document.getElementById("modalFromDate");
                        let toDateInput = document.getElementById("modalToDate");

                        if (fromDateInput.value && toDateInput.value) {
                            let fromDate = new Date(fromDateInput.value);
                            let toDate = new Date(toDateInput.value);

                            // Nếu toDate nhỏ hơn fromDate, tự động cập nhật toDate lên 2 ngày sau fromDate
                            if (toDate <= fromDate) {
                                toDate.setDate(fromDate.getDate() + 2);

                                // Định dạng lại ngày thành yyyy-mm-dd
                                let formattedToDate = toDate.toISOString().split('T')[0];
                                toDateInput.value = formattedToDate;
                            }
                        }
                    }

                });

// 🛠 Đưa hàm ra phạm vi toàn cục để sử dụng được ở mọi nơi
                function openBookingModal() {
                    document.getElementById("bookingModal").style.display = "flex";
                }

                function closeBookingModal() {
                    document.getElementById("bookingModal").style.display = "none";
                }

                function confirmBookingDetails() {
                    let modalFromDate = document.getElementById("modalFromDate").value;
                    let modalToDate = document.getElementById("modalToDate").value;
                    let modalNumberOfGuest = document.getElementById("modalNumberOfGuest").value;

                    if (!modalFromDate || !modalToDate || !modalNumberOfGuest) {
                        alert("Please select all fields before confirming.");
                        return;
                    }

                    // Lưu giá trị vào localStorage để sử dụng khi nhấn "Book Now"
                    localStorage.setItem("fromDate", modalFromDate);
                    localStorage.setItem("toDate", modalToDate);
                    localStorage.setItem("numberOfGuest", modalNumberOfGuest);

                    // Ẩn modal sau khi nhập xong
                    closeBookingModal();
                }
                document.addEventListener("DOMContentLoaded", function () {
                    // Lấy form và rating input
                    let feedbackForm = document.querySelector("form[action='leaveFeedback']");
                    let ratingInput = document.getElementById("rating-value");

                    if (feedbackForm) {
                        feedbackForm.addEventListener("submit", function (event) {
                            if (!ratingInput.value || ratingInput.value === "0") {
                                event.preventDefault(); // Ngăn form gửi đi
                                alert("Please select a rating before submitting your feedback.");
                            }
                        });
                    }
                });


        </script>

    </body>
</html>