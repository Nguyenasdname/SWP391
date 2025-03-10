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
            .status-pending {
                color: orange;
                font-weight: bold;
            }

            .status-confirmed {
                color: darkgreen;
                font-weight: bold;
            }

            .status-cancelled {
                color: red;
                font-weight: bold;
            }

            .status-checkin {
                color: blue;
                font-weight: bold;
            }

            .status-checkout {
                color: purple;
                font-weight: bold;
            }

            .status-completed {
                color: green;
                font-weight: bold;
            }

        </style>
    </head>
    <body>

        <div class="container mt-5">
            <h2 class="text-center">Booking Details</h2>
            <hr>
            <div class="row">
                <div class="col-md-9">
                    <h4 class="mt-4">Booked Villa</h4>
                    <c:if test="${sessionScope.user.roleId == 3 || sessionScope.user.roleId == 1}">
                        <h5><strong>Customer: </strong>${booking.userFullName}</h5>
                    </c:if>
                </div>
                <div class="col-md-1 mt-5 ms-5 ps-5">
                    <c:choose>
                        <c:when test="${booking.bookingStatus == 'Pending'}">
                            <span class="status-pending">Pending</span>
                        </c:when>
                        <c:when test="${booking.bookingStatus == 'Confirmed'}">
                            <span class="status-confirmed">Confirmed</span>
                        </c:when>
                        <c:when test="${booking.bookingStatus == 'Cancelled'}">
                            <span class="status-cancelled">Cancelled</span>
                        </c:when>
                        <c:when test="${booking.bookingStatus == 'Check-In'}">
                            <span class="status-checkin">Check-In</span>
                        </c:when>
                        <c:when test="${booking.bookingStatus == 'Check-Out'}">
                            <span class="status-checkout">Check-Out</span>
                        </c:when>
                        <c:when test="${booking.bookingStatus == 'Completed'}">
                            <span class="status-completed">Completed</span>
                        </c:when>
                        <c:otherwise>
                            <span>${booking.bookingStatus}</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

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
                <a href="${referer}" class="btn btn-secondary"><i class="fa fa-arrow-left"></i> Back</a>
                <c:if test="${booking.bookingStatus ne 'Cancelled'}">
                    <c:if test="${booking.bookingStatus ne 'Completed'}">
                        <c:if test="${referer ne 'http://localhost:8080/BookingResort/bookingManagement'}">
                            <div class="d-flex gap-3">
                                <c:if test="${booking.bookingStatus ne 'Check-Out'}">   
                                    <form action="cancelBooking?bookingId=${booking.bookingId}" method="post">
                                        <button type="submit" class="btn btn-danger"><i class="fa fa-times"></i> Cancel Booking</button>
                                    </form>
                                    <a href="addService?bookingId=${booking.bookingId}" class="btn btn-warning"><i class="fa fa-plus"></i> Add More Service</a>
                                </c:if>
                                <c:if test="${booking.bookingStatus eq 'Check-Out'}">
                                    <a href="payment?bookingId=${booking.bookingId}" class="btn btn-success"><i class="fa fa-credit-card"></i> Checkout</a>
                                </c:if>
                            </div>
                        </c:if>
                    </c:if>
                </c:if>
                <c:if test="${referer eq 'http://localhost:8080/BookingResort/bookingManagement'}">
                    <c:if test="${booking.bookingStatus == 'Confirmed'}">
                        <form action="checkIn" method="post">
                            <input type="hidden" name="bookingId" value="${booking.bookingId}">
                            <button  class="btn btn-warning"><i class="fa fa-sign-in-alt"></i> Check-In</button>
                        </form>
                    </c:if>
                    <c:if test="${booking.bookingStatus == 'Check-In'}">
                        <form action="checkOut" method="post">
                            <input type="hidden" name="bookingId" value="${booking.bookingId}">
                            <button class="btn btn-success"><i class="fa fa-sign-out-alt"></i> Check-Out</button>
                        </form>
                    </c:if>
                </c:if>
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
