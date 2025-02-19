<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            />

        <link href="css/verifyEmail.css" rel="stylesheet" type="text/css"/>
        <title>Verify Page</title>

    </head>
    <body>
        <div class="row">
            <div class="col-lg-12">
                <div class="main-verification-input-wrap">
                    <ul>
                        <c:if test="${param.action eq 'register'}">
                            <li>
                                You will recieve a verification code on your email after you
                                registered. Enter that code below.
                            </li>
                        </c:if>
                            
                        <c:if test="${param.action eq 'forgotPassword'}">
                            <li>
                                You will recieve a verification code on your email to verify that is
                                you. Enter that code below.
                            </li>
                        </c:if>

                        <li>
                            If somehow, you did not recieve the verification email then
                            <a href="register">resend the verification email</a>
                        </li>

                        <h5 style="color: red">${verifyError}</h5>

                    </ul>
                    <form action="VerifyOTP?action=${param.action}" method="post">

                        <!--Get attribute from servlet-->
                        
                        <div class="main-verification-input fl-wrap">
                            <div class="main-verification-input-item">
                                <input
                                    type="text"
                                    name ="verifyCode"
                                    placeholder="Enter the verification code">
                            </div>
                            <button type="submit" class="main-verification-button">Verify Now</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
