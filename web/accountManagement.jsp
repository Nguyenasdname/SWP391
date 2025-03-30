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
            .filter-container {
                display: flex;
                gap: 20px;
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
            
            <c:if test="${sessionScope.user.roleId == 1}">
                <h2>Account Management</h2>
            </c:if>

            <c:if test="${sessionScope.user.roleId == 3}">
                <h2>Customer List</h2>
            </c:if>
            <div class="filter-container">
                <input type="text" id="search" class="form-control" placeholder="Search by username..." style="width: 60%;">
                <c:if test="${sessionScope.user.roleId == 1}">
                    <select id="roleFilter" class="form-control" style="width: 30%;">
                        <option value="">All Roles</option>
                        <option value="Customer">Customer</option>
                        <option value="Employer">Employer</option>
                        <option value="Admin">Admin</option>
                    </select>
                </c:if>
            </div>
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
                            <c:if test="${sessionScope.user.roleId==1}">
                                <c:if test="${user.userId ne sessionScope.user.userId}">
                                    <tr>
                                        <td>${user.userName}</td>
                                        <td>${user.userFirstName}</td>
                                        <td>${user.userLastName}</td>
                                        <td>${user.userEmail}</td>
                                        <td>${user.roleName}</td>
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
                            </c:if>
                            <c:if test="${sessionScope.user.roleId == 3}">
                                <c:if test="${user.roleId eq 2}">
                                    <c:if test="${user.userId ne sessionScope.user.userId}">
                                        <tr>
                                            <td>${user.userName}</td>
                                            <td>${user.userFirstName}</td>
                                            <td>${user.userLastName}</td>
                                            <td>${user.userEmail}</td>
                                            <td>${user.roleName}</td>
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
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <script>
            function filterTable() {
                let searchFilter = document.getElementById("search").value.toLowerCase();
                let roleFilter = document.getElementById("roleFilter") ? document.getElementById("roleFilter").value.toLowerCase() : "";
                let rows = document.querySelectorAll("#accountTable tr");

                rows.forEach(row => {
                    let username = row.cells[0].textContent.toLowerCase();
                    let role = row.cells[4].textContent.toLowerCase();

                    let matchesSearch = username.includes(searchFilter);
                    let matchesRole = (roleFilter === "" || role === roleFilter);

                    row.style.display = (matchesSearch && matchesRole) ? "" : "none";
                });
            }

            document.getElementById("search").addEventListener("keyup", filterTable);

            if (document.getElementById("roleFilter")) {
                document.getElementById("roleFilter").addEventListener("change", filterTable);
            }
        </script>
    </body>
</html>