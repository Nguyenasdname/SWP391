<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Booking Details</title>
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
            .table th, .table td {
                text-align: center;
                vertical-align: middle;
            }
            .service-img {
                width: 60px;
                height: 60px;
                border-radius: 5px;
            }
            body {
                background-image: url("img/bookingDetailsBackground.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>

        <div class="container mt-5">
            <h2 class="text-center">Booking Details</h2>
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
            <!-- Buttons -->
            <div class="d-flex justify-content-between mt-4">
                <a href="bookingHistory" class="btn btn-secondary"><i class="fa fa-arrow-left"></i> Back</a>
                <div>
                    <a href="cancelBooking?bookingId=${booking.bookingId}" class="btn btn-danger"><i class="fa fa-times"></i> Cancel Booking</a>
                    <a href="addService?bookingId=${booking.bookingId}" class="btn btn-warning"><i class="fa fa-plus"></i> Add More Service</a>
                    <a href="checkout?bookingId=${booking.bookingId}" class="btn btn-success"><i class="fa fa-credit-card"></i> Checkout</a>
                </div>
            </div>
        </div>
        <script>
            var alertMessage = "${param.alertMessage}";
            if (alertMessage !== null && alertMessage !== "") {
                alert(alertMessage);
            }
        </script>        

    </body>
</html>
