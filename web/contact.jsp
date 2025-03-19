
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/contact.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <title>Contact Us</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <div class="marginTop"></div>
        <div class="container">
            <h1>LET'S CONNECT</h1>
            <div class="contact-info">
                <div class="info-item">
                    <i class="fas fa-map-marker-alt"></i>
                    <h3>OUR MAIN LOCATION</h3>
                    <p>FPT Urban Area, Ngu Hanh Son District, Da Nang City</p>
                </div>
                <div class="info-item">
                    <i class="fas fa-phone"></i>
                    <h3>PHONE NUMBER</h3>
                    <p>123-456-7890</p>
                </div>
                <div class="info-item">
                    <i class="fas fa-fax"></i>
                    <h3>FAX</h3>
                    <p>1-234-567-8900</p>
                </div>
                <div class="info-item">
                    <i class="fas fa-envelope"></i>
                    <h3>MAIL</h3>
                    <p>MyResortSe18C02@gmail.com</p>
                </div>
            </div>

            <div class="content-wrapper">
                <div class="form-map-wrapper">
                    <div class="form-section">
                        <h2>GET A FREE CASE EVALUATION TODAY!</h2>
                        <p>AVAILABLE 24 HOURS A DAY!</p>
                        <form action="confirmContact" method="post">
                            <input name="contactTitle" type="text" placeholder="Enter title" required>
                            <textarea name="contactContent" placeholder="Enter your message" required></textarea>
                            <button type="submit">Submit</button>
                        </form>
                    </div>

                    <div class="map-section">
                        <h2>WE ARE HERE</h2>
                        <p>MON-FRI 8:30AM - 5PM / PHONES ARE OPEN 24/7</p>
                        <iframe src="https://www.google.com/maps/embed?..." width="100%" height="250" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
        </div>
        <div class="marginBottom"></div>
         <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>