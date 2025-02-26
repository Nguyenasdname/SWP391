<%-- 
    Document   : check
    Created on : Feb 26, 2025, 11:42:19 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thông báo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8d7da;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .notification-card {
                background: white;
                padding: 20px;
                border-radius: 10px;
                text-align: center;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                max-width: 500px;
            }
            body{
                background-image: url("img/villaDetailsBackground.jpg") !important;
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>

        <c:if test="">
            <div class="notification-card">
                <h3 class="text-danger">Villa is not available!</h3>
                <p>The villa has already been booked on that day. Please check villa availability before booking.</p>
                <p>You will be redirected in <span id="countdown">10</span> seconds...</p>
                <a href="villaAvailable?action=listAll" class="btn btn-primary mt-3">Check other available villa now</a>
            </div>
        </c:if>
        <c:if test="${param.action == 'feedbackHandle'}">
            <div class="notification-card">
                <h3 class="text-danger">Cannot Feedback!</h3>
                <p>To ensure fair and reliable reviews, only guests who have booked and stayed at this villa can leave feedback.</p>
                <p>You will be redirected in <span id="countdown">10</span> seconds...</p>
                <a href="${param.url}" class="btn btn-primary mt-3">Back</a>
            </div>
        </c:if>



        <script>
            let countdown = 10;
            let countdownElement = document.getElementById("countdown");

            let redirectUrl = "${param.url}" ? "${param.url}" : "villaAvailable?action=listAll";
            
            let interval = setInterval(() => {
                countdown--;
                countdownElement.innerText = countdown;
                if (countdown <= 0) {
                    clearInterval(interval);
                    window.location.href = redirectUrl; // Chuyển hướng sau 10 giây
                }
            }, 1000);
        </script>

    </body>
</html>

