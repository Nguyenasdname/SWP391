<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Transaction History</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <style>
            body {
                background-color: #f8f9fa;
                font-family: 'Arial', sans-serif;
            }

            .container {
                margin-top: 50px;
            }

            .transaction-table th {
                background-color: #007bff;
                color: #fff;
                font-weight: bold;
            }

            .transaction-table td {
                vertical-align: middle;
                text-align: left;
                padding: 12px 15px;
                font-size: 16px;
            }

            .transaction-table tr:hover {
                background-color: #f1f8ff;
                transition: background-color 0.3s ease;
            }

            .transaction-table .amount {
                font-weight: bold;
                color: #007bff;
            }

            .btn {
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 25px;
            }

            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
                color: white;
            }

            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #004085;
            }

            .btn-secondary {
                background-color: #6c757d;
                color: white;
            }

            .btn-secondary:hover {
                background-color: #5a6268;
            }

            .footer {
                text-align: center;
                margin-top: 30px;
                font-size: 14px;
                color: #777;
            }

            .header-title {
                font-size: 32px;
                font-weight: 700;
                text-align: center;
                color: #333;
                margin-bottom: 30px;
            }
            .margin-top{
                margin-top: 200px;
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
                <h2 class="header-title">Transaction History</h2>

                <table class="table table-bordered transaction-table">
                    <thead>
                        <tr>

                            <th>Transaction ID</th>
                            <th>Transaction Date</th>
                            <th>Transaction Type</th>
                            <th>Payment Method</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${paymentList}" var="payment">
                        <tr>
                            <td>${payment.paymentDescription}</td>
                            <td>${payment.createDate}</td>
                            <td>${payment.paymentType}</td>
                            <td>${payment.paymentMethod}</td>
                            <td class="amount">${payment.paymentAmount}</td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>

            <div class="d-flex justify-content-center mt-4">
                <a href="index.jsp" class="btn btn-primary"><i class="fa fa-arrow-left"></i> Back</a>
            </div>

        </div>
        <div class="margin-bottom"></div>
        <jsp:include page="footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
