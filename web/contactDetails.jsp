<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contact Details</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <style>
            body {
                background: #eef2f7;
                font-family: 'Poppins', sans-serif;
                height: 100vh;
                display: flex;
                /*                justify-content: center;*/
                align-items: center;
            }

            .container-box {
                max-width: 900px;
                width: 100%;
                margin-left: 445px; /* Né sidebar */
                padding: 30px;
                background: white;
                border-radius: 12px;
                box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.15);

            }

            .header-title {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
                border-bottom: 2px solid #ddd;
                padding-bottom: 10px;
            }

            .info-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                gap: 20px;
            }

            .contact-info {
                flex: 1;
            }

            .contact-info p {
                font-size: 16px;
                margin: 8px 0;
                color: #444;
            }

            .qr-container {
                text-align: center;
                flex-shrink: 0;
            }

            .qr-image {
                width: 250px;
                height: 250px;
                border-radius: 10px;
                box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
                display: none;
            }


            .btn {
                padding: 10px 18px;
                font-size: 16px;
            }

            .btn-primary {
                background: #007bff;
                border: none;
            }

            .btn-secondary {
                background: #6c757d;
                border: none;
            }

            .btn-primary:hover, .btn-secondary:hover {
                opacity: 0.8;
            }

            .popup-overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                justify-content: center;
                align-items: center;
                z-index: 1000;
                opacity: 0;
                transition: opacity 0.3s ease-in-out;
            }

            .popup-content {
                background: white;
                padding: 30px;
                border-radius: 12px;
                text-align: center;
                box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
                width: 900px;
                transform: translateY(-20px);
                transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out;
                opacity: 0;
            }

            .popup-overlay.active {
                display: flex;
                opacity: 1;
            }

            .popup-overlay.active .popup-content {
                transform: translateY(0);
                opacity: 1;
            }

            .popup-header {
                font-size: 22px;
                font-weight: 600;
                margin-bottom: 20px;
                border-bottom: 2px solid #ddd;
                padding-bottom: 10px;
            }

            .popup-label {
                font-size: 14px;
                font-weight: 500;
                color: #555;
                text-align: left;
                display: block;
                margin-bottom: 5px;
            }

            .popup-input, .popup-textarea {
                border-radius: 8px;
                border: 1px solid #ccc;
                padding: 10px;
                width: 100%;
                font-size: 15px;
            }

            .popup-buttons {
                display: flex;
                justify-content: center;
                gap: 15px;
                margin-top: 15px;
            }

            .popup-btn {
                padding: 10px 16px;
                font-size: 16px;
                border-radius: 8px;
                transition: 0.3s;
            }

            .popup-btn:hover {
                opacity: 0.85;
            }

        </style>
    </head>
    <body>

        <c:if test="${sessionScope.user.roleId == 1}">
            <jsp:include page="adminSideBar.jsp"></jsp:include>
        </c:if>

        <div class="container-box">
            <div class="header-title">
                <h3><i class="fa fa-user"></i> ${contact.userFullName}</h3>
                <span id="contactStatus" class="badge bg-${contact.contactStatus eq 'Unseen' ? 'warning' : 'success'}">${contact.contactStatus}</span>
            </div>

            <div class="info-container">
                <div class="contact-info">
                    <p><i class="fa fa-envelope"></i> <strong>Email:</strong> ${contact.userEmail}</p>
                    <p><i class="fa fa-tag"></i> <strong>Title:</strong> ${contact.contactTitle}</p>
                    <p><i class="fa fa-comment"></i> <strong>Content:</strong> ${contact.contactContent}</p>
                </div>

                <!-- QR Code hoặc Trạng thái Refund -->
                <div class="qr-container">
                    <c:choose>
                        <c:when test="${contact.refundStatus eq 'NotRefunded'}">
                            <img id="qrCode" class="qr-image" src="${contact.qrRefund}" alt="QR Code">
                        </c:when>
                        <c:when test="${contact.refundStatus eq 'Refunded'}">
                            <span class="badge bg-success p-3 fs-5">✅ Refunded</span>
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="d-flex justify-content-between mt-4">
                <a href="contactManagement" class="btn btn-secondary"><i class="fa fa-arrow-left"></i> Back</a>
                <c:if test="${contact.refundStatus eq null}">
                    <c:if test="${contact.contactStatus eq 'Unseen'}">
                        <a class="btn btn-primary" onclick="openReplyPopup()"><i class="fa fa-reply"></i> Reply</a>
                    </c:if>
                </c:if>
            </div>
        </div>

        <!-- Popup Reply -->
        <div id="replyPopup" class="popup-overlay">
            <div class="popup-content">
                <h4 class="popup-header"><i class="fa fa-reply text-primary"></i> Reply to Contact</h4>
                <form id="replyForm" action="replyContact" method="post">
                    <input type="hidden" name="contactId" value="${contact.contactId}">

                    <div class="mb-3">
                        <label for="subtitle" class="popup-label"><strong>Subtitle:</strong></label>
                        <input type="text" id="subtitle" name="subtitle" class="form-control popup-input" value="Reply_${contact.contactTitle}" readonly>
                    </div>

                    <div class="mb-3">
                        <label for="replyContent" class="popup-label"><strong>Reply Content:</strong></label>
                        <textarea id="replyContent" name="replyContent" class="form-control popup-textarea" rows="4" required placeholder="Enter your reply..."></textarea>
                    </div>

                    <div class="popup-buttons">
                        <button type="button" class="btn btn-secondary popup-btn" onclick="closeReplyPopup()">Cancel</button>
                        <button type="submit" class="btn btn-success popup-btn"><i class="fa fa-paper-plane"></i> Confirm</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
//            function openReplyPopup() {
//                let popup = document.getElementById("replyPopup");
//                popup.style.display = "flex";
//                setTimeout(() => {
//                    popup.classList.add("active");
//                }, 50);
//            }
//
//            function closeReplyPopup() {
//                let popup = document.getElementById("replyPopup");
//                popup.classList.remove("active");
//                setTimeout(() => {
//                    popup.style.display = "none";
//                }, 300);
//            }
            document.addEventListener("DOMContentLoaded", function () {
                function openReplyPopup() {
                    let popup = document.getElementById("replyPopup");
                    popup.style.display = "flex";
                    setTimeout(() => {
                        popup.classList.add("active");
                    }, 50);
                }

                function closeReplyPopup() {
                    let popup = document.getElementById("replyPopup");
                    popup.classList.remove("active");
                    setTimeout(() => {
                        popup.style.display = "none";
                    }, 300);
                }

                // Gán hàm vào `window` để có thể gọi từ HTML
                window.openReplyPopup = openReplyPopup;
                window.closeReplyPopup = closeReplyPopup;
            });


            document.addEventListener("DOMContentLoaded", function () {
                let qrImage = document.getElementById("qrCode");
                if (qrImage && qrImage.src && qrImage.src !== " ") {
                    qrImage.style.display = "block";
                }
            });
            var refundAmount = ${amountRefund == null ? 0 : amountRefund}
            var refundCode = "${description == null ? '1' : description}";

            let autoCheckRefund
            var contactStatus = document.getElementById("contactStatus")
            if (contactStatus.textContent.trim() !== "Seen") {
                autoCheckRefund = setInterval(() => {

                    checkPayment(refundAmount, refundCode)

                }, 1000)
            }


            async function checkPayment(refundAmount, refundCode) {
                let bookingId = "${bookingContactId}";
                let userEmail = "${contact.userEmail}";
                let title = "${contact.contactTitle}";
                let contactId = "${contact.contactId}";

                let bankNumber;
                try {
                    const response = await fetch("https://script.google.com/macros/s/AKfycbxj-3eYlCmTW63LxUUPVi9QEUMA4kbb8tyWRoeVeslFY8Ymo0Yu6Sa_wmt3rQbfxrbP/exec");
                    const data = await response.json();
                    const lastPaid = data.data[data.data.length - 1];
                    lastPrice = Math.abs(lastPaid["Giá trị"]);
                    lastContent = lastPaid["Mô tả"];
                    bankNumber = lastPaid["Số tài khoản đối ứng"];
                    bankBin = lastPaid["Mã BIN ngân hàng đối ứng"];

                    if (lastPrice === refundAmount && lastContent.includes(refundCode)) {
                        if (!localStorage.getItem("refundAlertShown")) {
                            alert("Successful REFUND!");
                            localStorage.setItem("refundAlertShown", "true");
                        }

                        contactStatus.textContent = "Seen";
                        contactStatus.className = "badge bg-success";

                        clearInterval(autoCheckRefund);

                        let form = document.createElement("form");
                        form.method = "POST";
                        form.action = "confirmRefund";

                        let params = {
                            bookingId: bookingId,
                            bankNumber: bankNumber,
                            refundCode: refundCode,
                            bankBin: bankBin,
                            refundAmount: refundAmount,
                            userEmail: userEmail,
                            title: title,
                            contactId: contactId
                        };

                        for (let key in params) {
                            let input = document.createElement("input");
                            input.type = "hidden";
                            input.name = key;
                            input.value = params[key];
                            form.appendChild(input);
                        }

                        document.body.appendChild(form);
                        form.submit();
                    }
                } catch {
                    console.error("Error");
                }
            }

// Xóa trạng thái alert khi trang được tải lại
            window.addEventListener("load", () => {
                localStorage.removeItem("refundAlertShown");
            });

        </script>

    </body>
</html>