<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manage Service</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img {
                width: 200px;
                height: 120px;
            }
            select{
                height: 25px;
            }
        </style>
    </head>
    <body>
        <script>
            function setIdToDelete(idService) {
                document.getElementById('deleteServiceId').value = idService;
            }

            function setIdToEdit(idService, name, image, price, describe) {
                document.getElementById('editServiceId').value = idService;
                document.getElementById('editServiceName').value = name;
                document.getElementById('editServiceImagePreview').src = image;
                document.getElementById('oldImage').value = image; // Đặt giá trị cho input ẩn oldImage
                document.getElementById('editServicePrice').value = price;
                document.getElementById('editServiceDescribe').value = describe;
            }


            function editImage() {
                var input = document.querySelector("#editServiceImageFile");

                var image = document.querySelector("#editServiceImagePreview");

                console.log("File selected: ", URL.createObjectURL(input.files[0]));
                image.src = URL.createObjectURL(input.files[0]);
            }


            function addImageService() {
                var input = document.querySelector("#addServiceImageFile");
                var image = document.querySelector("#addServiceImagePreview");

                image.src = URL.createObjectURL(input.files[0]);
            }



            const orderBy = (item) => {
                window.location.href = "searchservice?list=" + item.value;
            };
            function formatCurrency(amount) {
                return parseFloat(amount).toLocaleString('en-US', {minimumFractionDigits: 0, maximumFractionDigits: 0}) + ' VNĐ';
            }

            document.addEventListener('DOMContentLoaded', function () {
                var priceElements = document.querySelectorAll('.price');
                priceElements.forEach(function (element) {
                    var price = element.textContent.trim();
                    element.textContent = formatCurrency(price);
                });
            });


        </script>

        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="./index.jsp"><i class="fa fa-home"></i> Home</a>
                            <span>Manager Service</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Service</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <form action="searchservice" method="post">
                                <input style="color: black" type="search" name="search" value="${param.search}" >
                                <select style="color: black" name="list" onchange="orderBy(this)">
                                    <option ${choice == "name" ? "selected" : ""} value="name">Name</option>
                                    <option ${choice == "price" ? "selected" : ""} value="price">Price</option>
                                </select>
                                <input style="color: black" type="submit" value="Search">
                                <a href="#addServiceModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Service</span></a> 
                            </form>                       
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Describe</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listservice}" var="s">
                            <tr>
                                <td>${s.idService}</td>
                                <td>${s.name}</td>
                                <td><img src="${s.image}" alt="${s.image}"></td>
                                <td><span class="price">${s.price}</span></td>
                                <td width="60%">${s.describe}</td>
                                <td>
                                    <a href="#editServiceModal" class="edit" data-toggle="modal"
                                       data-id="${s.idService}"
                                       data-name="${s.name}"
                                       data-image="${s.image}"
                                       data-price="${s.price}"
                                       data-describe="${s.describe}"
                                       onclick="setIdToEdit('${s.idService}', '${s.name}', '${s.image}', '${s.price}', '${s.describe}')">
                                        <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                    </a>
                                    <a href="#deleteServiceModal" class="delete" data-toggle="modal"
                                       data-id="${s.idService}"
                                       onclick="setIdToDelete(${s.idService})">
                                        <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Add Modal HTML -->
        <div id="addServiceModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addservice" method="post" enctype="multipart/form-data">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Service</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input type="file" id="addServiceImageFile" name="img" required onchange="addImageService()"> 
                                <img id="addServiceImagePreview" class="defaultAvatar" src="" alt="Image Preview">
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="number" class="form-control" min="1" required>
                            </div>
                            <div class="form-group">
                                <label>Describe</label>
                                <textarea name="describe" class="form-control" required></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!-- Edit Modal HTML -->
        <div id="editServiceModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="editservice" method="post" enctype="multipart/form-data">
                        <div class="modal-header">
                            <h4 class="modal-title">Edit Service</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <input id="editServiceId" name="idService" type="hidden">
                            <div class="form-group">
                                <label>Name</label>
                                <input id="editServiceName" name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input id="oldImage" name="oldImage" type="hidden"> <!-- Input ẩn để giữ đường dẫn ảnh cũ -->
                                <input type="file" id="editServiceImageFile" name="img" class="form-control" onchange="editImage()">
                                <img id="editServiceImagePreview" src="" alt="Image Preview">
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input id="editServicePrice" name="price" type="number" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Describe</label>
                                <textarea id="editServiceDescribe" name="describe" class="form-control" required></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!-- Delete Modal HTML -->
        <div id="deleteServiceModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="deleteservice" method="post">
                        <div class="modal-header">
                            <h4 class="modal-title">Delete Service</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Are you sure you want to delete these Records?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input id="deleteServiceId" name="idService" type="hidden">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
