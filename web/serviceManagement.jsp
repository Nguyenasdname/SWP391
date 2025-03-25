<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Service Management</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    </head>
    <style>
        .container {
            margin-left: 400px;
            padding: 20px;
            width: 100%;
        }
    </style>
    <body>
        <!-- Include Sidebar -->
        <jsp:include page="adminSideBar.jsp"/>

        <div class="container mt-5" style="margin-left: 250px;">
            <h2>Manage Services</h2>
            <a href="createService.jsp" class="btn btn-success mb-3">Add New Service</a>

            <!-- Display services in a table -->
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Service Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Fetch services from database and display -->
                    <c:forEach var="service" items="${listservice}">
                        <tr>
                            <td>${service.serviceName}</td>
                            <td>${service.serviceDescription}</td>
                            <td><fmt:formatNumber value="${service.servicePrice}" type="number" />$</td>
                            <td>
                                <a href="./admin-edit-service?id=${service.serviceId}" class="btn btn-primary btn-sm">Edit</a>
                                <!-- Delete Form (POST request) -->
                                <form action="./admin-delete-service" method="POST" style="display:inline;">
                                    <input type="hidden" name="ID" value="${service.serviceId}" />
                                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </body>
</html>