<!DOCTYPE html>
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
            .sidebar {
                width: 250px;
                height: 100vh;
                background: #343a40;
                color: white;
                padding: 20px;
                position: fixed;
                display: flex;
                flex-direction: column;
                gap: 20px;
            }
            .sidebar h3 {
                text-align: center;
            }
            .nav-item a {
                display: flex;
                align-items: center;
                gap: 10px;
                padding: 10px;
                color: white;
                text-decoration: none;
                border-radius: 5px;
                transition: 0.3s;
            }
            .nav-item a:hover {
                background: rgba(255, 255, 255, 0.2);
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
        <div class="sidebar">
            <h3><a style="text-decoration: none; color: white" href="#"><i class="bi-shield-lock"></i> Admin</a></h3>
            <ul class="nav flex-column">
                <li class="nav-item"><a href="#"><i class="bi bi-house-door"></i> Home</a></li>
                <li class="nav-item"><a href="profile.jsp"><i class="bi bi-person-circle"></i> Profile</a></li>
                <li class="nav-item"><a href="listAccount"><i class="bi bi-people"></i> Account</a></li>
                <li class="nav-item"><a href="#"><i class="bi bi-houses"></i> Villa</a></li>
                <li class="nav-item"><a href="#"><i class="bi bi-cup-hot"></i> Service</a></li>
                <li class="nav-item"><a href="#"><i class="bi bi-envelope"></i> Contact</a></li>
            </ul>
        </div>

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
                        <h5>Orders</h5>
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
                            data: [3000, 4000, 5000, 6000, 7000],
                            borderColor: 'blue',
                            fill: false
                        }]
                }
            });
        </script>
    </body>
</html>
