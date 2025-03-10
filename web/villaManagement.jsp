<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Villa Management</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
        <style>
            body {
                display: flex;
            }

            .content {
                margin-left: 250px;
                padding: 20px;
                width: calc(100% - 250px);
            }
            .search-bar {
                display: flex;
                gap: 10px;
                margin-bottom: 20px;
                width: 100%;
                ;
            }
            .villa-card {
                display: flex;
                align-items: center;
                background: #f8f9fa;
                border-radius: 10px;
                padding: 15px;
                margin-bottom: 15px;
                width: 100%;
            }
            .villa-card img {
                width: 150px;
                height: 100px;
                object-fit: cover;
                border-radius: 10px;
            }
            .villa-info {
                flex-grow: 1;
                padding-left: 15px;
            }
            .villa-actions {
                display: flex;
                gap: 10px;
            }
            .addBtn{
                height: 37.5px;
                width: 200px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="adminSideBar.jsp"></jsp:include>

            <div class="content">
                <h2>Villa Management</h2>
                <div class="search-bar">
                    <input type="text" id="search" class="form-control mb-3" placeholder="Search...">
                    <a href="addNewVilla.jsp" class="addBtn btn btn-success"><i class="bi bi-plus"></i> Add New Villa</a>
                </div>
            <c:forEach items="${villaList}" var="villa">
                <div class="villa-card">
                    <img src="${villa.villaIMG}" alt="Villa Image">
                    <div class="villa-info">
                        <h5>${villa.villaName}</h5>
                    </div>
                    <div class="villa-actions">
                        <a href="" class="btn btn-info">View More Details</a>
                        <a class="btn btn-warning">Edit Villa</a>
                    </div>
                </div>
            </c:forEach>
        </div>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const searchInput = document.querySelector(".search-bar input");
                const villaCards = document.querySelectorAll(".villa-card");

                searchInput.addEventListener("input", function () {
                    const searchText = searchInput.value.toLowerCase();
                    villaCards.forEach(card => {
                        const villaName = card.querySelector(".villa-info h5").textContent.toLowerCase();
                        if (villaName.includes(searchText)) {
                            card.style.display = "flex";
                        } else {
                            card.style.display = "none";
                        }
                    });
                });
            });
        </script>
    </body>
</html>