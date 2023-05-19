<%@page import="helper.SessionData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css"  href="css/login.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    </head>
    <body>
        <%
//        Make page secure
            SessionData sd = new SessionData();
            String userName = sd.getUname(request);
            if (userName != null)
                response.sendRedirect("Home.jsp");
        %>

        <div class="container">
            <div class="row py-5 mt-4 align-items-center">
                <div class="col-md-5 pr-lg-5 mb-5 mb-md-0">
                    <img src="https://bootstrapious.com/i/snippets/sn-registeration/illustration.svg" alt="" class="img-fluid mb-3 d-none d-md-block">
                    <h1>Create an Account</h1>
                </div>

                <!-- Registeration Form -->
                <div class="col-md-7 col-lg-6 ml-auto">
                    <form action="Registration" method="post">
                        <div class="row">
                            <!-- User Name -->
                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-envelope text-muted"></i>
                                    </span>
                                </div>
                                <input id="userName" type="text" name="userName" placeholder="Username" class="form-control bg-white border-left-0 border-md" required>
                            </div>
                            <!-- User ID  -->
                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-envelope text-muted"></i>
                                    </span>
                                </div>
                                <input id="userID" type="text" name="userID" placeholder="User ID" class="form-control bg-white border-left-0 border-md" required>
                            </div>

                            <!-- First Name -->
                            <div class="input-group col-lg-6 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-user text-muted"></i>
                                    </span>
                                </div>
                                <input id="firstName" type="text" name="firstName" placeholder="First Name" required class="form-control bg-white border-left-0 border-md">
                            </div>

                            <!-- Last Name -->
                            <div class="input-group col-lg-6 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-user text-muted"></i>
                                    </span>
                                </div>
                                <input id="lastName" type="text" name="lastName" placeholder="Last Name" required class="form-control bg-white border-left-0 border-md">
                            </div>

                            <!-- Email Address -->
                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-envelope text-muted"></i>
                                    </span>
                                </div>
                                <input id="email" type="email" name="email" placeholder="Email Address" required class="form-control bg-white border-left-0 border-md">
                            </div>

                            <!-- Phone Number -->
                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-phone-square text-muted"></i>
                                    </span>
                                </div>
                                <input id="phoneNumber" type="tel" name="phone" placeholder="Phone Number" required class="form-control bg-white border-md border-left-0 pl-3">
                            </div>


                            <!-- Role -->
                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-black-tie text-muted"></i>
                                    </span>
                                </div>
                                <select id="role" name="role" class="form-control custom-select bg-white border-left-0 border-md">
                                    <option value="student">Student</option>
                                    <option value="teacher">Teacher</option>
                                    <option value="admin">Admin</option>
                                </select>
                            </div>
                            
                            <!--Department-->
                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-black-tie text-muted"></i>
                                    </span>
                                </div>
                                <select id="dept" name="dept" class="form-control custom-select bg-white border-left-0 border-md">
                                    <option value="CSE">CSE</option>
                                    <option value="MAT">MAT</option>
                                    <option value="CHE">CHE</option>
                                </select>
                            </div>

                            <!-- Password -->
                            <div class="input-group col-lg-6 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-lock text-muted"></i>
                                    </span>
                                </div>
                                <input id="password" type="password" name="password" placeholder="Password" required class="form-control bg-white border-left-0 border-md">
                            </div>

                            <!-- Password Confirmation -->
                            <div class="input-group col-lg-6 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-lock text-muted"></i>
                                    </span>
                                </div>
                                <input id="passwordConfirmation" type="text" name="passwordConfirmation" placeholder="Confirm Password" required class="form-control bg-white border-left-0 border-md">
                            </div>

                            <!-- Submit Button -->
                            <div class="form-group col-lg-12 mx-auto mb-0">
                                <button type="submit" class="btn btn-primary btn-block py-2">
                                    <span class="font-weight-bold">Create your account</span>
                                </button>
                            </div>

                            <!-- Divider Text -->
                            <div class="form-group col-lg-12 mx-auto d-flex align-items-center my-4">
                                <div class="border-bottom w-100 ml-5"></div>
                                <span class="px-2 small text-muted font-weight-bold text-muted">OR</span>
                                <div class="border-bottom w-100 mr-5"></div>
                            </div>

                            <!-- Already Registered -->
                            <div class="text-center w-100">
                                <p class="text-muted font-weight-bold">Already Registered? <a href="index.jsp" class="text-primary ml-2">Login</a></p>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
