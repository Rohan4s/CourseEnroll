<%@page import="helper.SessionData"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <%
            SessionData sessionData = new SessionData();
            String name = sessionData.getUname(request);
        %>
        <div class="m-4">
            <nav class="navbar navbar-expand-lg navbar-dark bg-secondary fixed-top">
                <div class="container-fluid">
                    <a href="Home.jsp" class="nav-item nav-link text-white">Home</a>
                    <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarCollapse">
                        <div class="navbar-nav">
                            <a href="#" class="nav-item nav-link active">About Us</a>
                            <a href="Courses.jsp" class="nav-item nav-link text-white">Courses</a>
                            <a href="Teachers.jsp" class="nav-item nav-link text-white" tabindex="-1">Teachers</a>
                        </div>
                        <div class="nav-item dropdown ms-auto">
                            <a href="#" class="nav-link dropdown-toggle link-light" data-bs-toggle="dropdown" ><%=name%></a>   
                            <div class="dropdown-menu">
                                <a href="Logout" class="dropdown-item">Logout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </body>
</html>