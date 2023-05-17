<%-- 
    Document   : index
    Created on : May 12, 2023, 6:40:03 PM
    Author     : rohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css"  href="css/login.css">
        <title>Hello, world!</title>
    </head>
    <body>
        <%
            if (session.getAttribute("uname") != null)
                response.sendRedirect("welcome.jsp");
        %>
        <section class="h-100 gradient-form" style="background-color: #eee;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-xl-10">
                        <div class="card rounded-3 text-black">
                            <div class="row g-0">
                                <div class="col-lg-6">
                                    <div class="card-body p-md-5 mx-md-4">

                                        <div class="text-center">
                                            <!--                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/lotus.webp"
                                                                                             style="width: 185px;" alt="logo">-->
                                            <h2 class="mt-1 mb-5 pb-1">Welcome!</h2>
                                        </div>

                                        <form action="LoginServlet" method="post">
                                            <!--<p>Please login to your account</p>-->

                                            <div class="form-outline mb-4">
                                                <input type="text" id="form2Example11" class="form-control" name="uname"
                                                       placeholder="username" />
                                                <label class="form-label" for="form2Example11">Username</label>
                                            </div>

                                            <div class="form-outline mb-4">
                                                <input type="password" id="form2Example22" class="form-control" placeholder="password" name="pass" />
                                                <label class="form-label" for="form2Example22">Password</label>
                                            </div>

                                            <div class="text-center pt-1 mb-5 pb-1">
                                                <button type="submit" class="btn btn-primary">Sign In</button>
                                            </div>
                                        </form>
                                        <form action="Registration.jsp" method="post">
                                            <div class="d-flex align-items-center justify-content-center pb-4">
                                                <p class="mb-0 me-2">Don't have an account?</p>
                                                <button type="submit" class="btn btn-outline-primary">Create new</button>
                                            </div>

                                        </form>

                                    </div>
                                </div>
                                <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                                    <img src="img/login.png" width="540" height="720" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</body>
</html>
