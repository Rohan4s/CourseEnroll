<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.TeacherDao"%>
<%@page import="entities.Teacher"%>
<%@page import="helper.SessionData"%>
<%@include file="Navbar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/teacher.css">
    </head>
    <body>
        <br><br>
        <%//            Fetching Teachers  data
            TeacherDao td = new TeacherDao();
            List<Teacher> teachers = new ArrayList<>();
            teachers = td.getAllTeachers();
        %>


        <h2>Teachers</h2><hr style="height:2px;background-color:black"><br><br>
        <div class="row row-cols-1 row-cols-md-4 g-4" id="card-group">
            <%
                for (Teacher teacher : teachers) {
            %>
            <div class="col">
                <div class="card">
                    <img src="img/user.png" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title text-white"><%=teacher.fullName%></h5>
                        <p class="card-text text-white"><%=teacher.position%></p>
                        <p class="card-text text-white"><%=teacher.dept%></p>
                        <a href="mailto: <%=teacher.email%>" class="btn btn-primary">Mail</a>
                    </div>
                </div>
            </div>
            <%
                }
            %>
           
        </div>

    </body>
</html>

