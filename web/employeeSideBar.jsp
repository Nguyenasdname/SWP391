<%-- 
    Document   : adminSideBar
    Created on : Feb 25, 2025, 12:45:54 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    </head>
    <body>
        <style>
            body {
                display: flex;
            }
            .sidebar {
                width: 250px;
                height: 100vh;
                background: #343a40;
                color: white;
                padding: 20px;
                position: fixed;
                display: flex;
                flex-direction: column;
                gap: 20px;
            }
            .sidebar h3 {
                text-align: center;
            }
            .nav-item a {
                display: flex;
                align-items: center;
                gap: 10px;
                padding: 10px;
                color: white;
                text-decoration: none;
                border-radius: 5px;
                transition: 0.3s;
            }
            .nav-item a:hover {
                background: rgba(255, 255, 255, 0.2);
            }
        </style>
        <div class="sidebar">
            <h3><a style="text-decoration: none; color: white" href="dashboard"><i class="bi bi-tools"></i> Employee</a></h3>
            <ul class="nav flex-column">
                <li class="nav-item"><a href="index.jsp"><i class="bi bi-house-door"></i> Home</a></li>
                <li class="nav-item"><a href="profile.jsp"><i class="bi bi-person-circle"></i> Profile</a></li>
                <li class="nav-item"><a href="listAccount"><i class="bi bi-people"></i> Customer</a></li>
                <li class="nav-item"><a href="bookingManagement"><i class="bi bi-file-earmark-text"></i></i> Booking List</a></li>
                <li class="nav-item"><a href="./admin-get-services"><i class="bi bi-cup-hot"></i> Service</a></li>
            </ul>
        </div>
    </body>
</html>
