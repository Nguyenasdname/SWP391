<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Account More Info</title>
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
            .card {
                border-radius: 10px;
                padding: 20px;
            }
            .avatar {
                width: 300px;
                height: 300px;
                border-radius: 50%;
                object-fit: cover;
                display: block;
                margin: 0 auto;
            }
            .btn-container {
                display: flex;
                gap: 10px;
                justify-content: center;
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
                <h2>Account: ${user.userName}</h2>
            <div class="card shadow-sm">
                <div class="row">
                    <div class="col-md-8">
                        <p><strong>Username:</strong> ${user.userName}</p>
                        <p><strong>First Name:</strong> ${user.userFirstName}</p>
                        <p><strong>Last Name:</strong> ${user.userLastName}</p>
                        <p><strong>Email:</strong> ${user.userEmail}</p>
                        <p><strong>Address:</strong> ${user.userAddress}</p>
                        <p><strong>Phone Number:</strong>${user.userPhone}</p>
                    </div>
                    <div class="col-md-4 text-center">
                        <img src="${user.userIMG}" alt="User Avatar" class="avatar">
                    </div>
                </div>
                <div class="btn-container mt-3">
                    <a href="listAccount" class="btn btn-secondary"><i class="bi bi-arrow-left"></i> Back</a>
                    <c:if test="${sessionScope.user.roleId == 1}">
                        <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#updateRoleModal">
                            <i class="bi bi-pencil-square"></i> Update Role
                        </button>

                        <c:choose>
                            <c:when test="${user.userStatus eq 'Active'}">
                                <form action="banAccount?userId=${user.userId}" method="post">
                                    <button type="submit" class="btn btn-danger"><i class="bi bi-x-circle"></i> Ban</button>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <form action="UnBanAccount?userId=${user.userId}" method="post">
                                    <button type="submit" class="btn btn-success"><i class="bi bi-check-circle"></i> Active</button>
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </div>
            </div>
        </div>

        <!-- Modal for Update Role -->
        <div class="modal fade" id="updateRoleModal" tabindex="-1" aria-labelledby="updateRoleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="updateRoleModalLabel">Update Role</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="updateRole?userId=${user.userId}" method="post">
                        <div class="modal-body">
                            <label for="roleSelect" class="form-label">Select New Role:</label>
                            <select class="form-select" id="roleSelect" name="newRole" required>
                                <c:if test="${user.roleId ne 2}">
                                    <option value="2">Customer</option>
                                </c:if>
                                <c:if test="${user.roleId ne 1}">
                                    <option value="1">Admin</option>
                                </c:if>
                                <c:if test="${user.roleId ne 3}">
                                    <option value="3">Employee</option>
                                </c:if>
                            </select>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Confirm</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS (required for modal functionality) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>