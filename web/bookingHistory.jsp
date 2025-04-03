<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Room Booking History</title>
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
            />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            /* Your existing styles */
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
            #theForm {
                display: none;
            }
            .cancel-button {
                background-color: gray;
                color: white;
                padding: 10px 20px;
                border: none;
                cursor: pointer;
                opacity: 1;
                transition: opacity 0.3s;
                border-radius: 14px;
            }
            .cancel-button.disabled {
                cursor: not-allowed;
                pointer-events: none;
            }
            .tag-a {
                color: black;
            }
            table {
                width: 100%;
                table-layout: auto; /* Để trình duyệt tự điều chỉnh */
            }

            th, td {
                white-space: nowrap;
                padding: 10px;
                text-align: left;
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
        <jsp:include page="header.jsp"></jsp:include>
            <div style="margin-bottom: 180px"></div>
            <div class="breadcrumb-option">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumb__links">
                                <a href="index.jsp"><i class="fa fa-home"></i> Home</a>
                                <a href>Booking History</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Breadcrumb End -->

            <div class="container">
                <h1 class="mt-4 mb-4">Booking History</h1>
                <table class="table">
                    <thead>
                        <tr>
                            <th style="width: 200px">Villa Name</th>
                            <th style="width: 190px">Check-in</th>
                            <th style="width: 190px">Check-out</th>
                            <th style="width: 120px">People</th>
                            <th style="width: 120px">Original Price</th>
                            <th style="width: 120px">Total Paid</th>
                            <th style="width: 180px">Total Price</th>
                            <th>Status</th>
                            <th>Booking Date</th>
                            <th></th> <!-- Details-->
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${bookingList}" var="booking">
                        <c:if test="${booking.bookingStatus ne 'Pending'}">
                            <tr>
                                <td><span>${booking.villaName}</span> </td>
                                <td>${booking.checkIn}</td>
                                <td>${booking.checkOut}</td>
                                <td>${booking.numberOfGuest}</td>
                                <td>${booking.originalPrice}</td>
                                <td class="text-success">${booking.paidAmount}</td>
                                <td>$${booking.bookingTotal}</td>
                                <td>
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
                                </td>
                                <td>${booking.createDate}</td>
                                <td><a class="btn btn-warning" href="bookingDetails?bookingId=${booking.bookingId}">More Details</a></td>
                            </tr>
                        </c:if>
                    </c:forEach>

                </tbody>
            </table>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            var alertMessage = "${param.alertMessage}";
            if (alertMessage !== null && alertMessage !== "" && alertMessage !== "null") {
                alert(alertMessage);

            }
        </script>
        <div style="margin-bottom: 100px"></div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
