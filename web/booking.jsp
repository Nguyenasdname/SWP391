<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Resort Booking</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />

        <style>
            body {
                background: #f8f9fa;
            }
            .booking-container {
                max-width: 800px;
                margin: auto;
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            }
            .service-item img {
                width: 100px;
                height: auto;
                border-radius: 5px;
            }
            .qty-input {
                display: flex;
                align-items: center;
                gap: 10px;
            }
            .qty-count {
                cursor: pointer;
                background: #007bff;
                color: white;
                border: none;
                padding: 5px 10px;
                border-radius: 5px;
                font-weight: bold;
            }
            .service-quantity {
                width: 50px;
                text-align: center;
                border: 1px solid #ccc;
                border-radius: 5px;
                padding: 5px;
            }
            body {
                background-image: url("img/backgroundResort.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>

        <div class="container mt-5 mb-5">
            <form action="confirmBooking" method="post">
                <div class="booking-container">
                    <h2 class="text-center">Book Your Stay</h2>
                    <p>Villa: <strong>${villa.villaName}</strong></p>
                    <p>From: <span>${fromDate}</span> To: <span>${toDate}</span></p>
                    <h4>Base Price: <span id="base-price" data-price="${basePrice}">${villa.villaPrice}</span> per night</h4>

                    <div class="form-group mt-3">
                        <label>Select Additional Services:</label>
                        <div class="row" id="service-list">
                            <c:forEach items="${listService}" var="service">
                                <div class="col-md-4 mb-3">
                                    <div class="card p-2 text-center">
                                        <img src="${service.serviceIMG}" class="service-image" />
                                        <input type="checkbox" class="form-check-input service-checkbox" 
                                               data-service-id="${service.serviceId}" 
                                               data-service-price="${service.servicePrice}"
                                               name="selectedServices" 
                                               value="${service.serviceId}-1" />
                                        <label>${service.serviceName} (+${service.servicePrice})</label>
                                        <div class="qty-input mt-2">
                                            <a class="qty-count qty-count--minus" data-service-id="${service.serviceId}" disabled>-</a>
                                            <input type="number" class="service-quantity" data-service-id="${service.serviceId}" value="1" min="1" readonly>
                                            <a class="qty-count qty-count--add" data-service-id="${service.serviceId}" disabled>+</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <h4>Total Price: <input id="total-price" type="text" readonly name="totalPrice" value="${basePrice}" class="form-control"></h4>
                    <input type="hidden" name="villaId" value="${villa.villaId}">
                    <input type="hidden" name="fromDate" value="${fromDate}">
                    <input type="hidden" name="toDate" value="${toDate}">

                    <div class="mt-4 d-flex justify-content-between">
                        <button class="btn btn-danger" onclick="history.back()">Cancel</button>
                        <button type="submit" class="btn btn-primary">Book Now</button>
                    </div>
                </div>
            </form> 
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                            $(document).ready(function () {
                                function updateTotalPrice() {
                                    let total = parseFloat($("#base-price").data("price"));
                                    $(".service-checkbox:checked").each(function () {
                                        let serviceId = $(this).data("service-id");
                                        let servicePrice = parseFloat($(this).data("service-price"));
                                        let quantity = parseInt($(".service-quantity[data-service-id='" + serviceId + "']").val());
                                        total += servicePrice * quantity;
                                    });
                                    $("#total-price").val(total);
                                }

                                function updateCheckboxValue(serviceId) {
                                    let quantity = $(".service-quantity[data-service-id='" + serviceId + "']").val();
                                    $(".service-checkbox[data-service-id='" + serviceId + "']").val(serviceId + "-" + quantity);
                                }

                                $(document).on("change", ".service-checkbox", function () {
                                    let serviceId = $(this).data("service-id");
                                    let qtyInput = $(".service-quantity[data-service-id='" + serviceId + "']");
                                    let decrementBtn = $(".qty-count--minus[data-service-id='" + serviceId + "']");
                                    let incrementBtn = $(".qty-count--add[data-service-id='" + serviceId + "']");

                                    if ($(this).is(":checked")) {
                                        qtyInput.val(1).prop("readonly", false);
                                        decrementBtn.prop("disabled", false);
                                        incrementBtn.prop("disabled", false);
                                    } else {
                                        qtyInput.val(1).prop("readonly", true);
                                        decrementBtn.prop("disabled", true);
                                        incrementBtn.prop("disabled", true);
                                    }
                                    updateCheckboxValue(serviceId);
                                    updateTotalPrice();
                                });

                                $(document).on("click", ".qty-count", function () {
                                    let serviceId = $(this).data("service-id");
                                    let qtyInput = $(".service-quantity[data-service-id='" + serviceId + "']");
                                    let qty = parseInt(qtyInput.val());

                                    if ($(this).hasClass("qty-count--add")) {
                                        qty++;
                                    } else if ($(this).hasClass("qty-count--minus") && qty > 1) {
                                        qty--;
                                    }
                                    qtyInput.val(qty);
                                    updateCheckboxValue(serviceId);
                                    updateTotalPrice();
                                });
                            });
        </script>

    </body>
</html>
