/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// Hàm mở popup đặt cọc với hiệu ứng mượt
function openDepositPopup(bookingId, userId, bookingTotal) {
    let depositAmount = bookingTotal * 0.3; // Tính 30% của tổng tiền
    let depositCode = `DEPOSIT_${bookingId}_${userId}`; // Mã chuyển khoản

    document.getElementById("depositAmount").innerText = `$${depositAmount.toFixed(2)}`;
    document.getElementById("depositCode").innerText = depositCode;

    let popup = document.getElementById("depositPopup");
    popup.style.display = "flex"; // Hiển thị popup

    // Hiệu ứng mượt khi mở popup
    popup.style.opacity = "0";
    setTimeout(() => {
        popup.style.opacity = "1";
        popup.style.transition = "opacity 0.3s ease-in-out";
    }, 10);

    let timeLeft = 300; // Đếm ngược 5 phút
    updateCountdownDisplay(timeLeft);

    countdownTimer = setInterval(() => {
        timeLeft--;
        updateCountdownDisplay(timeLeft);

        if (timeLeft <= 0) {
            clearInterval(countdownTimer);
            closeDepositPopup();
            alert("Deposit Failed! Time expired.");
        }
    }, 1000);
}

// Cập nhật đếm ngược hiển thị phút:giây
function updateCountdownDisplay(timeLeft) {
    let minutes = Math.floor(timeLeft / 60);
    let seconds = timeLeft % 60;
    document.getElementById("countdown").innerText = `${minutes}:${seconds < 10 ? "0" : ""}${seconds}`;
}

// Hàm đóng popup mượt
function closeDepositPopup() {
    let popup = document.getElementById("depositPopup");
    popup.style.opacity = "0"; // Làm mờ trước khi ẩn popup

    setTimeout(() => {
        popup.style.display = "none";
        clearInterval(countdownTimer);
    }, 300); // Đợi hiệu ứng hoàn tất trước khi ẩn popup
}

