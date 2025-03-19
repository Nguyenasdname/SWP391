<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service Details</title>
    </head>
    <body>

        <!-- Check if the service attribute is set -->
        <c:choose>
            <c:when test="${not empty service}">
                <h1>Service Detail</h1>
                <div>
                    <h2>${service.serviceId}</h2>
                    <img src="${service.serviceIMG}" alt="${service.serviceName}" />
                    <p><strong>Description: </strong>${service.serviceDescription}</p>
                    <p><strong>Price: </strong><fmt:formatNumber value="${service.servicePrice}" type="currency" /></p>
                    <p><strong>Created on: </strong><fmt:formatDate value="${service.createDate}" pattern="dd MMM yyyy" /></p>
                </div>
            </c:when>
            <c:otherwise>
                <!-- If service is not found, display error message -->
                <p>${message}</p>
            </c:otherwise>
        </c:choose>
        
    </body>
</html>
