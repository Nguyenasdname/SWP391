<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Booking Deposit</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <style>
            body {
                background: #f8f9fa;
            }

            .container {
                max-width: 900px;
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

            .hidden {
                display: none;
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
            <h2 class="text-center">Booking Deposit</h2>
            <hr>
            <h4 class="mt-4">Booked Villa</h4>
            <table class="table table-bordered mt-4">
                <thead class="table-dark">
                    <tr>
                        <th>Villa Name</th>
                        <th>Guests</th>
                        <th>Check-in</th>
                        <th>Check-out</th>
                        <th>Booking Date</th>
                        <th>Total Price</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${booking.villaName}</td>
                        <td>${booking.numberOfGuest}</td>
                        <td>${booking.checkIn}</td>
                        <td>${booking.checkOut}</td>
                        <td>${booking.createDate}</td>
                        <td>$${booking.bookingTotal}</td>
                    </tr>
                </tbody>
            </table>

            <h4 class="mt-4">Booked Services</h4>
            <table class="table table-bordered mb-4">
                <thead class="table-dark">
                    <tr>
                        <th>Service Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total Price</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${bookingServiceList}" var="service">
                        <tr>
                            <td>${service.serviceName}</td>
                            <td>${service.quantity}</td>
                            <td>$${service.servicePrice}</td>
                            <td>$${service.totalPrice}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <hr>
            <h4 class="mt-4">Total: $${booking.bookingTotal}</h4>
            <h5 class="text-danger">Deposit (30%): $${booking.bookingTotal * 0.3}</h5>

            <!-- Buttons -->
            <div class="d-flex justify-content-between mt-4">
                <a href="bookingHistory" class="btn btn-secondary"><i class="fa fa-arrow-left"></i> Back</a>
                <button class="btn btn-primary" 
                        onclick="openDepositPopup()">
                    <i class="fa fa-money-bill-wave"></i> Deposit Now
                </button>
            </div>
        </div>

        <!-- Deposit Popup -->
        <div id="depositPopup" class="popup-overlay" style="display: none; opacity: 0;">
            <div class="popup-content">
                <h4>Scan QR to Pay</h4>
                <div class="qrCode">
                    <img class="qr-code" id="qrImage" src="">
                </div>
                <p class="timer">Time left: <span id="countdown">5:00</span> minutes</p>
                <button class="btn btn-danger" onclick="closeDepositPopup()">Cancel</button>
            </div>
        </div>

        <script>
            let countdownTimer;

            const openDepositPopup = () => {                
                var depositPopup = document.getElementById("depositPopup");
                var countdownEvent = document.getElementById("countdown");
                let totalBooking = ${booking.bookingTotal};

                let depositAmount = Math.round(totalBooking * 0.3)

                let depositCode = "DEPOSITBOOKING" +${booking.bookingId} + "USER" +${sessionScope.user.userId};

                let qrImage = document.getElementById("qrImage");

                let qr = "https://img.vietqr.io/image/MB-0903210704-compact.png?amount=" + depositAmount + "&addInfo=" + depositCode + "&accountName=NGUYEN VIET NGUYEN"

                qrImage.src = qr;

                depositPopup.style.display = "block";
                depositPopup.style.opacity = "1";

                timeLeft = 300;
                countdownEvent.textContent = "5:00";

                countdownTimer = setInterval(() => {
                    let minutes = Math.floor(timeLeft / 60);
                    let seconds = timeLeft % 60;

                    seconds = seconds < 10 ? "0" + seconds : seconds;


                    countdownEvent.textContent = minutes + ":" + seconds;

                    checkPayment(depositAmount, depositCode)

                    if (timeLeft < 0) {

                        alert("⚠️ Deposit Failed! Time expired.")
                        closeDepositPopup()
                    } else {
                        timeLeft--;
                    }


                }, 1000)

            }
            const closeDepositPopup = () => {
                var depositPopup = document.getElementById("depositPopup");
                clearInterval(countdownTimer);
                setTimeout(() => {
                    depositPopup.style.display = "none";
                }, 300); // Hiệu ứng mượt hơn
            }
            async function checkPayment(depositAmount, depositCode) {
                let bookingId = ${booking.bookingId}
                let bankNumber;
                try {
                    const response = await fetch("https://script.google.com/macros/s/AKfycbxj-3eYlCmTW63LxUUPVi9QEUMA4kbb8tyWRoeVeslFY8Ymo0Yu6Sa_wmt3rQbfxrbP/exec")
                    const data = await response.json();
                    const lastPaid = data.data[data.data.length - 1];
                    lastPrice = lastPaid["Giá trị"];
                    lastContent = lastPaid["Mô tả"];
                    bankNumber = lastPaid["Số tài khoản"];
                    bankBin = lastPaid["Mã BIN ngân hàng đối ứng"];

                    if (lastPrice === depositAmount && lastContent.includes(depositCode)) {
                        alert("Deposit Sucessful!")
                        let form = document.createElement("form");
                        form.method = "POST";
                        form.action = "confirmDeposit";

                        let params = {
                            bookingId: bookingId,
                            bankNumber: bankNumber,
                            depositCode: depositCode,
                            bankBin: bankBin,
                            depositAmount: depositAmount
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
        </script>
    </body>

</html>