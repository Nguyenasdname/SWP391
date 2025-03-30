<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Payment</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <style>
            body {
                background: #f8f9fa;
            }
            .container {
                max-width: 600px;
                margin: auto;
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            }
            .popup-overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5); /* Làm mờ nền */
                display: none;
                opacity: 0;
                transition: opacity 0.3s ease;
            }

            .popup-content {
                background: white;
                padding: 15px;
                border-radius: 10px;
                text-align: center;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
                width: 400px; /* Thu nhỏ lại */

                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%); /* Canh giữa màn hình */

                max-width: 90%; /* Đảm bảo không quá to trên màn nhỏ */
                margin-top: 50px;
                margin-bottom: 100px;
            }


            .qr-code {
                width: 300px;
                height: 300px;
                margin: 10px auto;
            }
            .timer {
                font-size: 18px;
                color: red;
                font-weight: bold;
            }
            body{
                background-image: url("img/paymentBackground.jpg") !important;
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }

        </style>
    </head>
    <body>
        <div class="container mt-5">
            <h2 class="text-center">Payment</h2>
            <hr>
            <h4>Booking Information</h4>
            <p><strong>Name: </strong>${booking.userFullName}</p>
            <p><strong>Villa:</strong> ${booking.villaName}</p>
            <p><strong>Guests:</strong> ${booking.numberOfGuest}</p>
            <p><strong>Check-in:</strong> ${booking.checkIn} | <strong>Check-out:</strong> ${booking.checkOut}</p>
            <p><strong>Total Price:</strong> <span id="totalPrice">$${booking.bookingTotal}</span></p>

            <hr>
            <h4>Promotion Code</h4>
            <div class="input-group mb-3">
                <input type="text" id="promoCode" class="form-control" placeholder="Enter promo code">
                <button class="btn btn-primary" id="applyPromotion" onclick="checkPromotion()">Apply</button>
            </div>
            <p id="promoMessage"></p>
            <br>

            <button class="btn btn-success w-100" onclick="openPaymentPopup()"><i class="fa fa-credit-card"></i> Pay Now</button>
        </div>

        <!-- Payment Popup -->
        <div id="depositPopup" class="popup-overlay">
            <div class="popup-content">
                <h4>Scan QR to Pay</h4>
                <div class="qrCode">
                    <img class="qr-code" id="qrImage" src="">
                </div>
                <p class="timer">Time left: <span id="countdown">5:00</span> minutes</p>
                <button class="btn btn-danger" onclick="closePaymentPopup()">Cancel</button>
            </div>
        </div>

        <script>
            let countdownTimer;
            let timeLeft;
            let promotionId = 0;

            const openPaymentPopup = () => {
                console.log("con vợ này vừa được gọi!");

                var depositPopup = document.getElementById("depositPopup");
                var countdownEvent = document.getElementById("countdown");
                let totalBooking = parseFloat(document.getElementById("totalPrice").textContent.replace("$", ""));


                let paymentCode = "PAYMENTBOOKING" +${booking.bookingId} + "USER" +${sessionScope.user.userId};

                let qrImage = document.getElementById("qrImage");

                let qr = "https://img.vietqr.io/image/MB-0903210704-compact.png?amount=" + totalBooking + "&addInfo=" + paymentCode + "&accountName=NGUYEN VIET NGUYEN";

                qrImage.src = qr;

                depositPopup.style.display = "block";
                depositPopup.style.opacity = "1";

                timeLeft = 300;
                countdownEvent.textContent = "5:00";

                countdownTimer = setInterval(() => {
                    console.log("Countdown đang chạy..."); // Kiểm tra setInterval có chạy không
                    console.log("Time Left:", timeLeft);

                    let minutes = Math.floor(timeLeft / 60);
                    let seconds = timeLeft % 60;

                    seconds = seconds < 10 ? "0" + seconds : seconds;


                    countdownEvent.textContent = minutes + ":" + seconds;


                    checkPayment(totalBooking, paymentCode);
                    if (timeLeft < 0) {

                        alert("⚠️ Payment Failed! Time expired.");
                        closePaymentPopup();
                    } else {

                        timeLeft--;

                    }


                }, 1000);

            };
            const closePaymentPopup = () => {
                var depositPopup = document.getElementById("depositPopup");
                clearInterval(countdownTimer);
                setTimeout(() => {
                    depositPopup.style.display = "none";
                }, 300); // Hiệu ứng mượt hơn
            };

            const checkPromotion = () => {
                let promotionList = JSON.parse('${promotionList}');

                let promoCode = document.getElementById("promoCode").value.toUpperCase();
                let totalBooking = ${booking.bookingTotal};
                let thisBookingTotal = document.getElementById("totalPrice");
                let promoMessage = document.getElementById("promoMessage");

                promoMessage.classList.remove("text-danger", "text-success");

                let foundPromo = promotionList.find(promo =>
                    promo.promotionCode === promoCode &&
                            promo.promotionStatus === "Active"
                );

                if (foundPromo) {
                    totalBooking = totalBooking * (1 - foundPromo.discountPercent / 100);
                    thisBookingTotal.textContent = "$" + Math.round(totalBooking);
                    promoMessage.textContent = "Available";
                    promoMessage.classList.add("text-success");

                    promotionId = foundPromo.promotionId;

                    document.getElementById("promoCode").setAttribute("readonly", true);
                    document.getElementById("applyPromotion").style.display = "none";
                } else {
                    promoMessage.textContent = "Invalid or expired code!";
                    promoMessage.classList.add("text-danger");
                }

            };

            async function checkPayment(paymentAmount, paymentCode) {
                let bookingId = ${booking.bookingId}
                let bankNumber;

                try {
                    const response = await fetch("https://script.google.com/macros/s/AKfycbxj-3eYlCmTW63LxUUPVi9QEUMA4kbb8tyWRoeVeslFY8Ymo0Yu6Sa_wmt3rQbfxrbP/exec");
                    const data = await response.json();
                    const lastPaid = data.data[data.data.length - 1];
                    lastPrice = lastPaid["Giá trị"];
                    lastContent = lastPaid["Mô tả"];
                    bankNumber = lastPaid["Số tài khoản đối ứng"];
                    bankBin = lastPaid["Mã BIN ngân hàng đối ứng"];

                    if (lastPrice === paymentAmount && lastContent.includes(paymentCode)) {

                        if (!localStorage.getItem("paymentAlertShow")) {
                            alert("Payment Successful!Please Check Your Email Or Payment History.");
                            localStorage.setItem("paymentAlertShow", "true");
                        }
                        let form = document.createElement("form");
                        form.method = "POST";
                        form.action = "confirmPayment";

                        let params = {
                            bookingId: bookingId,
                            bankNumber: bankNumber,
                            paymentCode: paymentCode,
                            bankBin: bankBin,
                            paymentAmount: paymentAmount,
                            promotionId: promotionId
                        };

                        for (let key in params) {
                            let input = document.createElement("input");
                            input.type = "hidden";
                            input.name = key;
                            input.value = params[key];
                            form.appendChild(input);
                        }

                        document.body.appendChild(form);
                        form.submit();
                    }
                } catch {
                    console.error("Error");
                }
            }
            window.addEventListener("load", () => {
                localStorage.removeItem("paymentAlertShow");
            });
        </script>
    </body>
</html>
