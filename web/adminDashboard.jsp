<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
        <style>
            body {
                display: flex;
            }
            .content {
                margin-left: 250px;
                padding: 20px;
                width: 100%;
            }
            .card {
                border-radius: 10px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="adminSideBar.jsp"></jsp:include>

        <div class="content">
            <h2>Dashboard</h2>
            <div class="row">
                <div class="col-md-3">
                    <div class="card p-3 text-white bg-primary">
                        <h5>Users</h5>
                        <p>1,250</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card p-3 text-white bg-success">
                        <h5>Revenue</h5>
                        <p>$5,200</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card p-3 text-white bg-warning">
                        <h5>Booking</h5>
                        <p>320</p>
                    </div>
                </div>
            </div>

            <div class="mt-4">
                <canvas id="chart"></canvas>
            </div>
        </div>

        <script>
            const ctx = document.getElementById('chart').getContext('2d');
            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May'],
                    datasets: [{
                            label: 'Revenue',
                            data: [3000, 4000, 3500, 6000, 5000],
                            borderColor: 'blue',
                            fill: false
                        }]
                }
            });
        </script>
    </body>
</html>
