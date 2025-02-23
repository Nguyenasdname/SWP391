<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Booking History</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
        <style>
            body {
                background: #f8f9fa;
            }
            .history-container {
                max-width: 1000px;
                margin: auto;
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            }
            .status-pending {
                color: orange;
            }
            .status-confirmed {
                color: green;
            }
            .status-cancelled {
                color: red;
            }
            .btn-details {
                text-decoration: none;
                color: #fff;
                background: #007bff;
                padding: 5px 10px;
                border-radius: 5px;
            }
            .btn-details:hover {
                background: #0056b3;
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


        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div style="margin-bottom: 180px" class="margin"></div>
            <div class="container mt-5">
                <div class="history-container">
                    <h2 class="text-center">Booking History</h2>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Customer</th>
                                <th>Villa Name</th>
                                <th>Check-in</th>
                                <th>Check-out</th>
                                <th>Total Price</th>
                                <th>Status</th>
                                <th>Booking Date</th>
                                <th>Details</th>
                            </tr>
                        </thead>
                        <tbody>


                        <c:forEach var="booking" items="${bookingList}">
                            <tr>
                                <td>${sessionScope.user.userFirstName.concat(' ').concat(sessionScope.user.userLastName)}</td>
                                <td>${booking.villaName}</td>
                                <td>${booking.checkIn}</td>
                                <td>${booking.checkOut}</td>
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
                                        <c:otherwise>
                                            <span>${booking.bookingStatus}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${booking.createDate}</td>
                                <td>
                                    <a href="BookingDetailsServlet?bookingId=${booking.bookingId}" class="btn-details">View Details</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty bookingList}">
                            <tr>
                                <td colspan="8" class="text-center">No booking history available.</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
        <div style="margin-bottom: 100px"></div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
