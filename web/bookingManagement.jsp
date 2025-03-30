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
            .status-badge {
                padding: 5px 10px;
                border-radius: 5px;
                display: inline-block;
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
                gap: 20px;
                margin-bottom: 20px;
            }
            table {
                background: white;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            }
            th, td {
                vertical-align: middle;
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
            <div class="search-container d-flex justify-content-between">
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
            <div id="bookingList">
                <table class="table table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>User</th>
                            <th>Villa</th>
                            <th>Guests</th>
                            <th>Check-in</th>
                            <th>Check-out</th>
                            <th>Booking Date</th>
                            <th>Price</th>
                            <th>Status</th>
                            <th>Actions</th>
                            <th>View More</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${bookingList}" var="booking">
                            <tr>
                                <td>${booking.userFullName ne "null null" ? booking.userFullName : booking.userName}</td>
                                <td>${booking.villaName}</td>
                                <td>${booking.numberOfGuest}</td>
                                <td>${booking.checkIn}</td>
                                <td>${booking.checkOut}</td>
                                <td>${booking.createDate}</td>
                                <td>$${booking.bookingTotal}</td>
                                <td><span class="status-badge status-${booking.bookingStatus.toLowerCase()}">${booking.bookingStatus}</span></td>
                                <td>
                                    <c:if test="${booking.bookingStatus == 'Confirmed'}">
                                        <form action="checkIn" method="post" class="d-inline">
                                            <input type="hidden" name="bookingId" value="${booking.bookingId}">
                                            <button class="btn btn-warning btn-sm"><i class="fa fa-sign-in-alt"></i>Check-In</button>
                                        </form>
                                    </c:if>
                                    <c:if test="${booking.bookingStatus == 'Check-In'}">
                                        <form action="checkOut" method="post" class="d-inline">
                                            <input type="hidden" name="bookingId" value="${booking.bookingId}">
                                            <button class="btn btn-success btn-sm"><i class="fa fa-sign-out-alt"></i>Check-Out</button>
                                        </form>
                                    </c:if>
                                </td>
                                <td><a href="bookingDetails?bookingId=${booking.bookingId}" class="btn btn-warning btn-sm"><i class="fa fa-eye"></i> View</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <script>
            function filterTable() {
                let searchFilter = document.getElementById("searchInput").value.toLowerCase();
                let statusFilter = document.getElementById("statusFilter").value.toLowerCase();
                let rows = document.querySelectorAll("table tbody tr");

                rows.forEach(row => {
                    let text = row.innerText.toLowerCase();
                    let rowStatus = row.querySelector(".status-badge").innerText.toLowerCase();

                    let matchesSearch = text.includes(searchFilter);
                    let matchesStatus = (statusFilter === "" || rowStatus === statusFilter);

                    row.style.display = (matchesSearch && matchesStatus) ? "" : "none";
                });
            }

            document.getElementById("searchInput").addEventListener("keyup", filterTable);
            document.getElementById("statusFilter").addEventListener("change", filterTable);
        </script>
    </body>
</html>