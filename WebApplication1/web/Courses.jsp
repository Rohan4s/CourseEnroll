<%@page import="entities.Teacher"%>
<%@page import="dao.TeacherDao"%>
<%@page import="dao.StudentDao"%>
<%@page import="entities.Student"%>
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
        <title>JSP Page</title>        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/newCourses.css">
    </head>
    <body>
        <%//            Getting user data
            SessionData sd = new SessionData();
            String username = sd.getUname(request);
            String role = sd.getRole(request);

//      Fetching All teachers data for admin to assign course
            TeacherDao teacherDao = new TeacherDao();
            List<Teacher> teachers = new ArrayList<>();
            if (role.equals("admin")) {
                teachers = teacherDao.getAllTeachers();
            }

//            Fetching All courses data
            CourseDao cd = new CourseDao();
            List<Course> courses = new ArrayList<>();
            courses = cd.getAllCourses();

            List<Course> registeredCourses = new ArrayList<>();
            List<Course> TeacherCourses = new ArrayList<>();;

//          fetching Student's registered courses data
            if (role.equals("student")) {
                registeredCourses = cd.getRegisteredCourses(username);
            } //          fetching Teacher's registered courses data
            else if (role.equals("teacher")) {
                TeacherCourses = cd.getCoursesTeaching(username);
            }
        %>


        <br><br>




        <!-- Displaying Student's registered course-->
        <%
            if (role.equals("student")) {
        %>
        <h2>Registered Courses</h2>
        <div class="row row-cols-1 row-cols-md-4 g-4" id="card-group">
            <%
                for (Course course : registeredCourses) {
                    String[] courseCode = course.code.split(" ", 2);
            %>
            <div class="col">
                <div class="card text-dark bg-primary mb-3" style="min-height: 200px">
                    <div class="card-body bg-info ">
                        <h5 class="card-header"><b><%=course.code%>:</b> <%=course.title%></h5>
                        <div class="card-text"><%=course.teacherName%></div>
                        <div class="card-text"><%=course.credit%></div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <%
            }
        %>


        <!--Teachers courses-->
        <%
            if (role.equals("teacher")) {
        %>
        <h2>My Courses</h2>
        <div class="row row-cols-1 row-cols-md-4 g-4" id="card-group">
            <%
                for (Course course : TeacherCourses) {
                    String[] courseCode = course.code.split(" ", 2);
            %>
            <div class="col">
                <div class="card text-dark bg-primary mb-3" style="min-height: 200px">
                    <div class="card-body bg-info ">
                        <h5 class="card-header"><b><%=course.code%>:</b> <%=course.title%></h5>
                        <div class="card-text"></div>


                        <!--Get Students button-->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal<%=courseCode[0] + courseCode[1]%>">
                            Students
                        </button>
                        <%
                            // fetching students enrolled in this course
                            List<Student> students = new ArrayList<>();
                            StudentDao studentDao = new StudentDao();
                            students = studentDao.getStudents(course.code);
                        %>
                        <!--Students button calls this modal-->
                        <div class="modal fade" id="exampleModal<%=courseCode[0] + courseCode[1]%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body">

                                        <!--table of enrolled students inside modal-->
                                        <table class="table table-striped">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Department</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    //                      Displaying courses of a Student
                                                    for (Student student : students) {
                                                %>
                                                <tr>
                                                    <td> <%= student.fullName%> </td>
                                                    <td> <%= student.id%> </td>
                                                    <td> <%= student.dept%> </td>
                                                </tr>
                                                <%
                                                    }
                                                    //}
                                                %>                
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <%
            }
        %>

        <!--- All courses-->
        <h2>All Courses</h2>
        <div class="row row-cols-1 row-cols-md-4 g-4" id="card-group">
            <%                for (Course course : courses) {
                    String[] courseCode = course.code.split(" ", 2);
            %>
            <div class="col">
                <div class="card text-dark bg-primary mb-3" style="min-height: 200px">
                    <div class="card-body bg-info ">
                        <h5 class="card-header"><b><%=course.code%>:</b> <%=course.title%></h5>
                        <div class="card-text"><%=course.teacherName%></div>
                        <div class="card-text"><%=course.dept%></div>

                        <!--Enroll button-->
                        <%if (role.equals("student") && cd.isEnrolled(registeredCourses, course.code) == false) {%>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal<%=courseCode[0] + courseCode[1]%>">
                            Enroll
                        </button>

                        <!--Enroll button calls this modal-->
                        <div class="modal fade" id="exampleModal<%=courseCode[0] + courseCode[1]%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        Do you really want to enroll in <%=course.code%>?
                                    </div>
                                    <div class="modal-footer">
                                        <a href="enrollCourse?dept=<%=courseCode[0]%>&code=<%=courseCode[1]%>" class="btn btn-primary">Yes</a>
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>

        <h2>Add Courses</h2>
        <%if (role.equals("admin")) {%>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCourseModal">
            Add Course
        </button>

        <!--Add Course button calls this modal-->
        <div class="modal fade" id="addCourseModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <form action="AddCourse" method="post">
                        <div class="modal-body">

                            <div class="form-group form-floating mb-3">
                                <input type="text" class="form-control" id="dept"  required  placeholder="CSE" name="dept">
                                <label for="dept">Department Name</label>
                            </div>
                            
                            <div class="form-group form-floating mb-3">
                                <input type="text" class="form-control" id="courseCode" required placeholder="137" pattern="\d{3}" name="courseCode">
                                <label for="courseCode">Course Code (must contain exactly 3 digits)</label>
                            </div>
                            <div class="form-group form-floating mb-3">
                                <input type="text" class="form-control" id="courseTitle"  required placeholder="Structured Programming Language" name="courseTitle">
                                <label for="courseTitle">Course Title</label>
                            </div>
                            <select class="form-control form-control-sm" name="teacherUsername" required>
                                <option value="" selected disabled hidden>--Select A Teacher--</option>
                                <%
                                    for (Teacher teacher : teachers) {
                                %>
                                <option><%=teacher.name%></option>
                                <%
                                    }
                                %>
                            </select>
                            <br>
                            <div class="form-group form-floating mb-3 " style="width: 22rem;">
                                <input min="1" max="20" type="number" id="typeNumber" placeholder="Credit" class="form-control"  required/>
                                <label for="typeNumber">Credit (1-20) </label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <button type="text" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%}%>










    </body>
</html>
