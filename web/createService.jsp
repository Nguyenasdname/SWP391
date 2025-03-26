<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Service</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    </head>
    <body>
        <!-- Include Sidebar -->
        <jsp:include page="adminSideBar.jsp"/>

        <div class="container mt-5" style="margin-left: 250px;"">
            <h2>Create New Service</h2>
            <form action="./createServiceAction" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="serviceName" class="form-label">Service Name</label>
                    <input type="text" class="form-control" id="serviceName" name="serviceName" required>
                </div>
                <div class="mb-3">
                    <label for="serviceDescription" class="form-label">Description</label>
                    <textarea class="form-control" id="serviceDescription" name="serviceDescription" required></textarea>
                </div>
                <div class="mb-3">
                    <label for="servicePrice" class="form-label">Price</label>
                    <input type="number" class="form-control" id="servicePrice" name="servicePrice" required>
                </div>
                <div class="mb-3">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <label class="form-label">Villa Image</label>
                        <div class="image-upload">
                            <input name="image" type="file" accept="image/*" id="serviceImage">
                            <i class="bi bi-camera"></i>
                            <img id="previewImage">
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Create Service</button>
            </form>
        </div>
    </body>
    <script>
        document.getElementById("serviceImage").addEventListener("change", function (event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById("previewImage").src = e.target.result;
                    document.getElementById("previewImage").style.display = "block";
                    document.querySelector(".image-upload i").style.display = "none";
                };
                reader.readAsDataURL(file);
            }
        });
    </script>
</html>
