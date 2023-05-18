<%-- 
    Document   : Courses
    Created on : May 13, 2023, 2:23:34 PM
    Author     : rohan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.CourseDao"%>
<%@page import="entities.Course"%>
<%@page import="helper.SessionData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Navbar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="css/courses.css">

    </head>
    <body>
        <br><br>
        <%//            Getting Session
            SessionData sd = new SessionData();
            String username = sd.getUname(request);
            String role = sd.getRole(request);

//            Fetching All courses data
            CourseDao cd = new CourseDao();
            List<Course> courses = new ArrayList<>();
            courses = cd.getAllCourses();
        %>

        <div class="getAllCourses">
            <h2>Courses</h2>

            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Course Code</th>
                        <th scope="col">Title</th>
                        <th scope="col">Credits</th>
                        <th scope="col">Teacher</th>
                    </tr>
                </thead>
                <tbody>
                    <%
//                      Displaying all courses 
                        for (Course course : courses) {
                    %>
                    <tr>
                        <td> <%= course.code%> </td>
                        <td> <%= course.title%> </td>
                        <td> <%= course.credit%> </td>
                        <td> <%= course.teacherName%> </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>


        <!--Add Course-->     
        <%
            if (role.equals("admin")) {
        %>
   
        <div id="addCourses">
            <button type="button">Add Course</button>
        </div>
        <%
            }
        %>

        <div class="registeredCourses">
            <%
//                Fetching My Courses of a Student
                if (role.equals("student")) {
                    List<Course> myCourses = new ArrayList<>();
                    myCourses = cd.getRegisteredCourses(username);
            %>
            <h2>Registered Courses</h2>

            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Course Code</th>
                        <th scope="col">Title</th>
                        <th scope="col">Credits</th>
                        <th scope="col">Teacher</th>
                    </tr>
                </thead>
                <tbody>
                    <%
//                      Displaying courses of a Student
                        for (Course course : myCourses) {
                    %>
                    <tr>
                        <td> <%= course.code%> </td>
                        <td> <%= course.title%> </td>
                        <td> <%= course.credit%> </td>
                        <td> <%= course.teacherName%> </td>
                    </tr>
                    <%
                            }
                        }
                    %>                
                </tbody>
            </table>
        </div>
        <div class="courses teaching">
            <%
//                Fetching My Courses of a Student
                if (role.equals("teacher")) {
                    List<Course> myCourses = new ArrayList<>();
                    myCourses = cd.getCoursesTeaching(username);
            %>
            <h2>My Courses</h2>

            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Course Code</th>
                        <th scope="col">Title</th>
                        <th scope="col">Credits</th>
                        <th scope="col">Students</th>
                    </tr>
                </thead>
                <tbody>
                    <%
//                      Displaying courses of a Student
                        for (Course course : myCourses) {
                    %>
                    <tr>
                        <td> <%= course.code%> </td>
                        <td> <%= course.title%> </td>
                        <td> <%= course.credit%> </td>
                        <td> <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">
                                Students
                            </button>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>                
                </tbody>
            </table>
        </div>

    </body>
</html>
