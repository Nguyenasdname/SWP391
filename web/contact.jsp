

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Hero Section Begin -->
            <section class="hero-section set-bg" data-setbg="img/contact-bg.jpg">
                <div class="hero-text">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <h1>Contact</h1>
                            </div>
                        </div>
                        <div class="page-nav">
                            <a href="home" class="left-nav"
                               ><i class="lnr lnr-arrow-left"></i> Home</a
                            >
                        </div>
                    </div>
                </div>
            </section>
            <!-- Hero Section End -->

            <!-- Contact Section Begin -->
            <section class="contact-section spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="contact-left">
                                <div class="contact-information">
                                    <h2>Contact Information</h2>
                                    <ul>
                                        <li>
                                            <img src="img/placeholder-copy.png" alt="" />
                                            <span>1525 Boring Lane, Los Angeles, CA</span>
                                        </li>
                                        <li>
                                            <img src="img/phone-copy.png" alt="" />
                                            <span>+1 (603)535-4592</span>
                                        </li>
                                        <li>
                                            <img src="img/envelop.png" alt="" />
                                            <span>hello@youremail.com</span>
                                        </li>
                                        <li>
                                            <img src="img/clock-copy.png" alt="" />
                                            <span>Everyday: 06:00 -22:00</span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="social-links">
                                    <h2>Follow us on:</h2>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-linkedin"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-youtube-play"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="contact-form">
                                <h5>Write us ...</h5>
                                <form action="#">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <p>From</p>
                                            <div class="input-group">
                                                <input id="nameUser" type="text" value="${inforUser.name}" placeholder="Full Name" readonly/>
                                            <img src="img/edit.png" alt="" />
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="input-group">
                                            <input id="emailUser" value="${inforUser.email}" type="email" placeholder="Email" readonly/>
                                            <img src="img/envelop-copy.png" alt="" />
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="input-group phone-num">
                                            <input id="phoneUser" value="${inforUser.phone}" type="text" placeholder="Phone" readonly/>
                                            <img src="img/phone-copy.png" alt="" />
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="message">
                                            <p>Message</p>
                                            <div class="textarea">
                                                <textarea id="messageUser" placeholder="Hi ..." required></textarea>
                                                <img src="img/speech-copy.png" alt="" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <button id="submit">
                                            Send <i class="lnr lnr-arrow-right"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Contact Section End -->

        <!-- Map Section Begin -->
        <div class="map">
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.8638223776993!2d108.2579818760616!3d15.968486342125072!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142116949840599%3A0x365b35580f52e8d5!2zxJDhuqFpIGjhu41jIEZQVCAoRlBUIHVuaXZlcnNpdHkp!5e0!3m2!1sen!2s!4v1703145176297!5m2!1sen!2s"
                height="560"
                style="border: 0"
                allowfullscreen=""
                ></iframe>
        </div>
        <!-- Map Section End -->
        <jsp:include page="footer.jsp"></jsp:include>
        <script>
            document.addEventListener("DOMContentLoaded", () => {
                const name = document.getElementById("nameUser");
                const email = document.getElementById("emailUser");
                const phone = document.getElementById("phoneUser");
                const message = document.getElementById("messageUser");
                const submit = document.getElementById("submit");

                submit.addEventListener("click", (e) => {
                    e.preventDefault();
                    if (name.value.length === 0 || email.value.length === 0 || phone.value.length === 0) {
                        alert("Please login and update your information to send message");
                        return;
                    }
                    if (message.value.length === 0) {
                        alert("Need to write content in message");
                        return;
                    }


                    alertModel();


                });
                async function postGoogle(data) {
                    const formURL =
                            "https://docs.google.com/forms/d/e/1FAIpQLSeMzS9L7yqKgwvXPSWQDo4v2rfl_8-gfdj78Q6qNO2-Z0POVA/formResponse";
                    const formData = new FormData();
                    formData.append("entry.397504062", data.name);
                    formData.append("entry.82169676", data.email);
                    formData.append("entry.1373988092", data.phone);
                    formData.append("entry.1751325777", data.message);
                    try {
                        await fetch(formURL, {
                            method: "POST",
                            body: formData
                        });
                    } catch (error) {
                        console.log(error);
                    }
                }


              async  function alertModel() {


                    Swal.fire({
                        title: 'Are You Sure?',
                        text: "Do you really want to sent feedback for us?",
                        icon: 'question',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes, send it!'
                    }).then((result) => {
                        if (result.isConfirmed) {


                            // Gửi yêu cầu xóa đến máy chủ bằng XMLHttpRequest
                            var xhr = new XMLHttpRequest();
                            xhr.open("GET", "contact?name=" + encodeURIComponent(name.value) + "&email=" + encodeURIComponent(email.value) + "&phone=" + encodeURIComponent(phone.value) + "&message=" + encodeURIComponent(message.value));

                            xhr.onreadystatechange = function () {
                                if (xhr.readyState === 4) {


                                    if (xhr.status === 200) {
                                        const response = JSON.parse(xhr.responseText);
                                        if (response.success) {

                                            Swal.fire({
                                                title: 'Success',
                                                text: 'The villa has been deleted.',
                                                icon: 'success'
                                            }).then(() => {

                                               
                                                const data = {
                                                    name: name.value,
                                                    email: email.value,
                                                    phone: phone.value,
                                                    message: message.value
                                                };
                                              postGoogle(data) ;
                                                message.value = "";
//                                                window.location = "contact.jsp";
                                            });
                                        } else {
                                            Swal.fire({
                                                title: 'Error',
                                                text: 'Failed to delete villa.',
                                                icon: 'error'
                                            }).then(() => {

                                               
//                                                window.location = "contact.jsp";
                                            });
                                        }
                                    } else {
                                        Swal.fire({
                                            title: 'Error',
                                            text: 'Failed to delete villa. Server error.',
                                            icon: 'error'
                                        }).then(() => {

                                      
//                                            window.location = "contact.jsp";
                                        });
                                    }
                                }
                            };
                            xhr.send();
                        }
                    });


                }

            });

        </script>
    </body>
</html>
