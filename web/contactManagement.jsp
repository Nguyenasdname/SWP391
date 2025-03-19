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
                /*                width: 100%;*/
            }
            .contact-card {
                background: white;
                padding: 15px;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }
            .badge{
                height: 22px
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


        <div class="content">

            <div class="search-container">
                <select id="statusFilter" class="form-control" style="width: 20%;">
                    <option value="">All Status</option>
                    <option value="Seen">Seen</option>
                    <option value="Unseen">Unseen</option>
                </select>
            </div>

            <h2 class="text-center">Contact Management</h2>
            <div class="row">
                <c:forEach items="${contactList}" var="contact">

                    <div class="col-md-6 contact">
                        <div class="contact-card p-3">
                            <div class="d-flex justify-content-between">
                                <h5><i class="fa fa-user"></i> ${contact.userFullName}</h5>
                                <div class="contact-status badge bg-${contact.contactStatus eq 'Unseen' ? 'warning' : 'success'}">${contact.contactStatus}</div>
                            </div>
                            <p><i class="fa fa-envelope"></i> ${contact.userEmail}</p>
                            <p><i class="fa fa-tag"></i> ${contact.contactTitle}</p>
                            <a href="contactDetails?contactId=${contact.contactId}" class="btn btn-info btn-sm">
                                <i class="fa fa-eye"></i> View More
                            </a>
                        </div>
                    </div>

                </c:forEach>
            </div>
        </div>
        <script>
            document.getElementById("statusFilter").addEventListener("change", function () {
                let status = this.value.toLowerCase();
                let cards = document.querySelectorAll(".contact");
                cards.forEach(card => {
                    let cardStatus = card.querySelector(".contact-status").textContent.trim().toLowerCase();
                    if (status === "" || cardStatus === status) {
                        card.style.removeProperty("display"); // Trả về trạng thái CSS gốc
                    } else {
                        card.style.display = "none";
                    }
                });
            });

        </script>
    </body>
</html>
