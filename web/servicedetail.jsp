<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Service Details</title>
    <style>
        /* CSS chỉ áp dụng cho phần nội dung chính */
        #service-page {
            font-family: 'Poppins', sans-serif;
            margin: 150px;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #service-page .container {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            max-width: 550px;
            text-align: center;
            transition: transform 0.3s ease-in-out;
        }

        #service-page .container:hover {
            transform: scale(1.02);
        }

        #service-page .container img {
            max-width: 100%;
            border-radius: 10px;
            margin: 15px 0;
        }

        #service-page .container h1 {
            color: #333;
            margin-bottom: 15px;
        }

        #service-page .container p {
            color: #555;
            font-size: 16px;
            line-height: 1.6;
        }

        #service-page .container .error {
            color: red;
            font-size: 18px;
            font-weight: bold;
        }

        #service-page .container .price {
            font-size: 20px;
            font-weight: bold;
            color: #27ae60;
            margin-top: 10px;
        }

        #service-page .container .date {
            font-style: italic;
            color: #777;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div id="service-page">
        <div class="container">
            <c:choose>
                <c:when test="${not empty service}">
                    <h1>Service Details</h1>
                    <h2>${service.serviceName}</h2>
                    <img src="${service.serviceIMG}" alt="${service.serviceName}" />
                    <p><strong>Description:</strong> ${service.serviceDescription}</p>
                    <p class="price"><strong>Price:</strong> $<fmt:formatNumber value="${service.servicePrice}" pattern="#0.00" /></p>
                    <p class="date"><strong>Created on:</strong> <fmt:formatDate value="${service.createDate}" pattern="dd MMM yyyy" /></p>
                </c:when>
                <c:otherwise>
                    <p class="error">${message}</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
