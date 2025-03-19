<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Booking Management</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <style>
            body {
                background: #f8f9fa;
            }
            .content {
                margin-left: 250px;
                padding: 20px;
                width: calc(100% - 250px);
            }
            .booking-card {
                background: white;
                padding: 15px;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }
            .status-badge {
                padding: 5px 10px;
                border-radius: 5px;
            }
            .status-confirmed {
                background-color: darkgreen;
                color: white;
            }
            .status-cancelled {
                background-color: #dc3545;
                color: white;
            }
            .status-check-in {
                background-color: #ffc107;
                color: white;
            }
            .status-check-out {
                background-color: #007bff;
                color: white;
            }
            .status-completed {
                background-color: green;
                color: white;
            }
            .search-container {
                display: flex;
                justify-content: space-between;
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.user.roleId == 1}">
            <jsp:include page="adminSideBar.jsp"></jsp:include>
        </c:if>

        <c:if test="${sessionScope.user.roleId == 3}">
            <jsp:include page="employeeSideBar.jsp"></jsp:include>
        </c:if>

        <div class="content">
            <h2 class="text-center">Booking Management</h2>
            <div class="search-container">
                <input type="text" id="searchInput" class="form-control" placeholder="Search by user or villa name" style="width: 50%;">
                <select id="statusFilter" class="form-control" style="width: 20%;">
                    <option value="">All Status</option>
                    <option value="Pending">Pending</option>
                    <option value="Confirmed">Confirmed</option>
                    <option value="Cancelled">Cancelled</option>
                    <option value="Check-In">Check-In</option>
                    <option value="Check-Out">Check-Out</option>
                    <option value="Completed">Completed</option>
                </select>
            </div>
            <div id="bookingList" class="row">
                <c:forEach items="${bookingList}" var="booking">
                    <div class="col-md-6">
                        <div class="booking-card p-3">
                            <h5 class="mb-2">${booking.userFullName ne "null null" ? booking.userFullName : booking.userName}</h5>
                            <p><strong>Villa: ${booking.villaName}</strong></p>
                            <p><strong>Guests:</strong> ${booking.numberOfGuest}</p>
                            <p><strong>Check-in:</strong> ${booking.checkIn} | <strong>Check-out:</strong> ${booking.checkOut}</p>
                            <p><strong>Booking Date:</strong> ${booking.createDate}</p>
                            <p><strong>Price:</strong> $${booking.bookingTotal}</p>
                            <span class="status-badge status-${booking.bookingStatus.toLowerCase()}">${booking.bookingStatus}</span>
                            <div class="mt-3 d-flex justify-content-between">
                                <a href="bookingDetails?bookingId=${booking.bookingId}" class="btn btn-warning"><i class="fa fa-eye"></i> View Details</a>
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
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <script>
            document.getElementById("searchInput").addEventListener("keyup", function () {
                let filter = this.value.toLowerCase();
                let cards = document.querySelectorAll(".booking-card");
                cards.forEach(card => {
                    let text = card.innerText.toLowerCase();
                    card.style.display = text.includes(filter) ? "block" : "none";
                });
            });

            document.getElementById("statusFilter").addEventListener("change", function () {
                let status = this.value.toLowerCase();
                let cards = document.querySelectorAll(".booking-card");
                cards.forEach(card => {
                    let cardStatus = card.querySelector(".status-badge").innerText.toLowerCase();
                    card.style.display = (status === "" || cardStatus === status) ? "block" : "none";
                });
            });
        </script>
    </body>
</html>
