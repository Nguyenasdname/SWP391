<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Villa</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
        <style>
            body {
                display: flex;
            }
            .content {
                margin-left: 250px;
                padding: 20px;
                width: calc(100% - 250px);
            }
            .form-container {
                background: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                max-width: 800px;
                margin: auto;
            }
            .image-upload {
                display: flex;
                justify-content: center;
                align-items: center;
                width: 150px;
                height: 150px;
                border-radius: 50%;
                background: #ccc;
                cursor: pointer;
                overflow: hidden;
                position: relative;
            }
            .image-upload input {
                opacity: 0;
                position: absolute;
                width: 100%;
                height: 100%;
                cursor: pointer;
            }
            .image-upload img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                display: none;
            }
            .image-upload i {
                font-size: 40px;
                color: white;
            }
        </style>
    </head>
    <body>
        <jsp:include page="adminSideBar.jsp"></jsp:include>

        <div class="content">
            <h2 class="mb-4">Add New Villa</h2>
            <div class="form-container">
                <form action="addNewVilla" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label class="form-label">Villa Name</label>
                        <input name="villaName" type="text" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Villa Price</label>
                        <input name="villaPrice" type="text" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Villa Location</label>
                        <input name="villaLocation" type="text" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Villa Capacity</label>
                        <input name="villaCapacity" type="text" class="form-control" required>
                    </div>
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <label class="form-label">Villa Image</label>
                        <div class="image-upload">
                            <input name="image" type="file" accept="image/*" id="villaImage">
                            <i class="bi bi-camera"></i>
                            <img id="previewImage" alt="Villa Preview">
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Villa Description</label>
                        <textarea name="villaDescription" class="form-control" rows="4" required></textarea>
                    </div>
                    <div class="d-flex justify-content-between">
                        <a href="listVilla" class="btn btn-secondary">Back</a>
                        <button type="submit" class="btn btn-success">Add Villa</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            document.getElementById("villaImage").addEventListener("change", function(event) {
                const file = event.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        document.getElementById("previewImage").src = e.target.result;
                        document.getElementById("previewImage").style.display = "block";
                        document.querySelector(".image-upload i").style.display = "none";
                    };
                    reader.readAsDataURL(file);
                }
            });
        </script>
    </body>
</html>
