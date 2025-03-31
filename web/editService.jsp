<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Service</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Include Sidebar -->
        <c:if test="${sessionScope.user.roleId == 1}">
            <jsp:include page="adminSideBar.jsp"></jsp:include>
        </c:if>
        
        <c:if test="${sessionScope.user.roleId == 3}">
            <jsp:include page="employeeSideBar.jsp"></jsp:include>
        </c:if>

        <div class="container mt-5" style="margin-left: 250px;">
            <h2>Edit Service</h2>
            <form action="./createServiceAction" method="post" enctype="multipart/form-data">
                <input type="hidden" name="serviceId" value="${service.serviceId}" />
                <div class="mb-3">
                    <label for="serviceName" class="form-label">Service Name</label>
                    <input type="text" class="form-control" id="serviceName" name="serviceName" value="${service.serviceName}" required>
                </div>
                <div class="mb-3">
                    <label for="serviceDescription" class="form-label">Description</label>
                    <textarea class="form-control" id="serviceDescription" name="serviceDescription" required>${service.serviceDescription}</textarea>
                </div>
                <div class="mb-3">
                    <label for="servicePrice" class="form-label">Price</label>
                    <input type="number" class="form-control" id="servicePrice" name="servicePrice" value="${service.servicePrice}" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Current Image</label>
                    <div>
                        <img id="currentImage" src="${service.serviceIMG}" alt="Service Image" style="width: 200px; height: auto;">
                    </div>
                </div>
                <div class="mb-3">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <label class="form-label">Upload New Image</label>
                        <div class="image-upload">
                            <input name="image" type="file" accept="image/*" id="serviceImage">
                            <i class="bi bi-camera"></i>
                            <img id="previewImage" style="display: none; display: block; width: 200px">
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Save Changes</button>
            </form>
        </div>
    </body>
    <script>
        document.getElementById("serviceImage").addEventListener("change", function (event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    // Update the preview image with the new uploaded image
                    document.getElementById("previewImage").src = e.target.result;
                    document.getElementById("previewImage").style.display = "block";  // Show preview image
                    document.getElementById("currentImage").style.display = "none";  // Hide current image
                    document.querySelector(".image-upload i").style.display = "none";  // Hide camera icon
                };
                reader.readAsDataURL(file);
            }
        });
    </script>
</html>
