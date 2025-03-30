<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contact Management</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <style>
            .content {
                margin-left: 250px;
                padding: 20px;
                width: 100%;
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
                width: 100%;
            }
            th, td {
                vertical-align: middle;
                text-align: left;
            }
            .status-badge {
                padding: 5px 10px;
                border-radius: 5px;
                color: white;
                font-size: 0.9em;
                height: 22px;
                display: inline-block;
            }
            .status-seen {
                background-color: #28a745; /* Màu xanh cho Seen */
            }
            .status-unseen {
                background-color: #ffc107; /* Màu vàng cho Unseen */
            }
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.user.roleId == 1}">
            <jsp:include page="adminSideBar.jsp"></jsp:include>
        </c:if>

        <div class="content">
            <h2 class="text-center">Contact Management</h2>
            <div class="search-container d-flex justify-content-between">
                <input type="text" id="searchInput" class="form-control" placeholder="Search by name or email" style="width: 70%;">
                <select id="statusFilter" class="form-control" style="width: 20%;">
                    <option value="">All Status</option>
                    <option value="Seen">Seen</option>
                    <option value="Unseen">Unseen</option>
                </select>
            </div>

            <div id="contactList">
                <table class="table table-hover">
                    <thead class="table-light">
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Title</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${contactList}" var="contact">
                            <tr>
                                <td><i class="fa fa-user"></i> ${contact.userFullName}</td>
                                <td><i class="fa fa-envelope"></i> ${contact.userEmail}</td>
                                <td><i class="fa fa-tag"></i> ${contact.contactTitle}</td>
                                <td>
                                    <span class="status-badge pb-4 status-${contact.contactStatus.toLowerCase()}">
                                        ${contact.contactStatus}
                                    </span>
                                </td>
                                <td>
                                    <a href="contactDetails?contactId=${contact.contactId}" class="btn btn-info btn-sm">
                                        <i class="fa fa-eye"></i> View More
                                    </a>
                                </td>
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
                    let name = row.cells[0].textContent.toLowerCase();
                    let email = row.cells[1].textContent.toLowerCase();
                    let rowStatus = row.querySelector(".status-badge").textContent.trim().toLowerCase();

                    let matchesSearch = name.includes(searchFilter) || email.includes(searchFilter);
                    let matchesStatus = (statusFilter === "" || rowStatus === statusFilter);

                    row.style.display = (matchesSearch && matchesStatus) ? "" : "none";
                });
            }

            document.getElementById("searchInput").addEventListener("keyup", filterTable);
            document.getElementById("statusFilter").addEventListener("change", filterTable);
        </script>
    </body>
</html>