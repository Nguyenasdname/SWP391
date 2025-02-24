<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Account Management</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
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


            .content {
                margin-left: 250px;
                padding: 20px;
                width: 100%;
            }
            .table-container {
                background: white;
                border-radius: 10px;
                padding: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <h3><a style="text-decoration: none; color: white" href="#"><i class="bi-shield-lock"></i> Admin</a></h3>
            <ul class="nav flex-column">
                <li class="nav-item"><a href="#"><i class="bi bi-house-door"></i> Home</a></li>
                <li class="nav-item"><a href="profile.jsp"><i class="bi bi-person-circle"></i> Profile</a></li>
                <li class="nav-item"><a href="listAccount"><i class="bi bi-people"></i> Account</a></li>
                <li class="nav-item"><a href="#"><i class="bi bi-houses"></i> Villa</a></li>
                <li class="nav-item"><a href="#"><i class="bi bi-cup-hot"></i> Service</a></li>
                <li class="nav-item"><a href="#"><i class="bi bi-envelope"></i> Contact</a></li>
            </ul>
        </div>

        <div class="content">
            <h2>Account Management</h2>
            <input type="text" id="search" class="form-control mb-3" placeholder="Search...">
            <div class="table-container">
                <table class="table table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Username</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody id="accountTable">
                        <c:forEach items="${userList}" var="user">
                            <c:if test="${user.userId ne sessionScope.user.userId}">
                                <tr>
                                    <td>${user.userName}</td>
                                    <td>${user.userFirstName}</td>
                                    <td>${user.userLastName}</td>
                                    <td>${user.userEmail}</td>
                                    <td>${user.roleId}</td>
                                    <c:choose>
                                        <c:when test="${user.userStatus eq 'Active'}">
                                            <td class="text-success">Active</td>
                                        </c:when>
                                        <c:when test="${user.userStatus eq 'Inactive'}">
                                            <td class="text-warning">Inactive</td>
                                        </c:when>
                                        <c:when test="${user.userStatus eq 'Banned'}">
                                            <td class="text-danger">Banned</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="text-muted">Unknown</td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td><a href="accountDetails?userId=${user.userId}" class="btn btn-sm btn-primary">View More</a></td>
                                </tr>
                            </c:if>
                        </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>

        <script>
            document.getElementById("search").addEventListener("keyup", function () {
                let filter = this.value.toLowerCase();
                let rows = document.querySelectorAll("#accountTable tr");
                rows.forEach(row => {
                    let username = row.cells[0].textContent.toLowerCase();
                    row.style.display = username.includes(filter) ? "" : "none";
                });
            });
        </script>
    </body>
</html>
