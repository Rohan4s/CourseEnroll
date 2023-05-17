<%@page import="entities.Course"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CourseDao"%>
<%@page import="helper.SessionData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Navbar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/newCourses.css">
    </head>
    <body>
        <%//            Getting user data
            SessionData sd = new SessionData();
            String username = sd.getUname(request);
            String role = sd.getRole(request);

//            Fetching All courses data
            CourseDao cd = new CourseDao();
            List<Course> courses = new ArrayList<>();
            courses = cd.getAllCourses();
        %>
        <br><br>
        <h2>Courses</h2>
        <div class="row row-cols-1 row-cols-md-4 g-4" id="card-group">
            <%
                for (Course course : courses) {
            %>
            <div class="col">
                <div class="card text-dark bg-info mb-3" style="min-height: 200px">
                    <div class="card-body">
                        <h5 class="card-title"><b><%=course.code%>:</b> <%=course.title%></h5>
                        <div class="card-text"><%=course.teacher%></div>
                        <a href="#" class="btn btn-primary">Enroll</a>
                    </div>
                </div>
            </div>
            <%
                }
            %>
            <%
                for (Course course : courses) {
            %>
            <div class="col">
                <div class="card text-dark bg-info mb-3" style="min-height: 200px">
                    <div class="card-body">
                        <h5 class="card-title"><b><%=course.code%>:</b> <%=course.title%></h5>
                        <!--<div class="card-footer"><%=course.teacher%></div>-->
                        <p class="card-text ">Professor</p>
                    </div>
                </div>
            </div>
            <%
                }
            %>
            <%
                for (Course course : courses) {
            %>
            <div class="col">
                <div class="card text-dark bg-info mb-3" style="min-height: 200px">
                    <div class="card-body">
                        <h5 class="card-title"><b><%=course.code%>:</b> <%=course.title%></h5>
                        <!--<div class="card-footer"><%=course.teacher%></div>-->
                        <p class="card-text ">Professor</p>
                    </div>
                </div>
            </div>
            <%
                }
            %>
            
            
        </div>
    </body>
</html>
