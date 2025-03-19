<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Favourite Rooms</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <style>
            body {
                background: #f8f9fa;
                font-family: 'Arial', sans-serif;
            }

            .container {
                max-width: 1200px;
                margin: 20px auto;
                padding: 20px;
            }

            .villa-card {
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
                overflow: hidden;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }

            .villa-img {
                width: 100%;
                height: 200px;
                object-fit: cover;
                border-bottom: 1px solid #ddd;
            }

            .villa-info {
                padding: 15px;
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            .villa-info h5 {
                margin: 0;
                color: #333;
                font-size: 20px;
            }

            .villa-info p {
                color: #666;
                font-size: 14px;
            }

            .villa-info .btn {
                margin-top: 10px;
                font-size: 14px;
                padding: 10px;
            }

            .wishlist-icon {
                position: absolute;
                top: 10px;
                right: 10px;
                background: #fff;
                border: 2px solid #f5a623;
                border-radius: 50px;
                padding: 10px;
                cursor: pointer;
                transition: 0.3s;
                color: red;
                width: 45px;
                height: 45px;
            }

            .fa{
                padding-left: 3px;
            }
            .margin-top{
                margin-top: 150px;
            }
            .margin-bottom{
                margin-bottom:  150px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="margin-top"></div>
            <div class="container">
                <h2 class="text-center mb-4">Your Favourite Villas</h2>

                <div class="row">
                    <!-- Villa Card 1 -->
                <c:forEach items="${villaList}" var="villa">
                    <div class="col-md-4">
                        <div class="villa-card position-relative">
                            <img src="${villa.villaIMG}" alt="Villa Image" class="villa-img">
                            <div class="villa-info">
                                <h5>${villa.villaName}</h5>
                                <p>${villa.villaLocation}</p>
                                <a href="VillaDetails?villaId=${villa.villaId}" class="btn btn-info w-100">View Details</a>
                            </div>
                            <form action="addToWishlist?userId=${sessionScope.user.userId}&villaId=${villa.villaId}" method="post">
                                <button class="wishlist-icon">
                                    <i class="fa fas fa-heart"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                </c:forEach>

            </div>
            <div class="d-flex justify-content-center mt-4">
                <a href="index.jsp" class="btn btn-primary"><i class="fa fa-arrow-left"></i> Back</a>
            </div>
        </div>
        <div class="margin-bottom"></div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
