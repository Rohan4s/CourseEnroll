/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import helper.Jdbc;
import helper.SessionData;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EnrollCourse extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addCourse</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addCourse at " + request.getContextPath() + "</h1>");

            //fetch session data
            SessionData sd = new SessionData();
            String uName = sd.getUname(request);
            String courseCode = request.getParameter("dept") + " " + request.getParameter("code");
            String courseName, uFullname;
            out.println(uName);
            out.println(courseCode);

            // fetch course title
            Connection con = Jdbc.getConnection();
            String queryGetCourseTitle = "select title from courses where ID = \"" + courseCode + "\"";
            out.println(queryGetCourseTitle);
            Statement st = con.createStatement();
//            out.println("executing");
            ResultSet rs = st.executeQuery(queryGetCourseTitle);

            if (rs.next()) {
                courseName = rs.getString(1);
                out.println("courseName=" + courseName);
            } else {
                out.println("Cant find course name");
                return;
            }
//            out.println(courseName);

            // fetch user's full name
            String queryGetFullname = "select full_name from students where user_name=\"" + uName + "\"";
            st = con.createStatement();
            rs = st.executeQuery(queryGetFullname);

            if (rs.next()) {
                uFullname = rs.getString(1);
                out.println("uFullname=" + uFullname);
            } else {
                out.println("Cant find full name");
                return;
            }

            // register course
            String queryRegisterCourse = "insert into takes values (?,?,?,?)";
            out.print(queryRegisterCourse);
            PreparedStatement pst = con.prepareStatement(queryRegisterCourse);
            pst.setString(1, uName);
            pst.setString(2, uFullname);
            pst.setString(3, courseCode);
            pst.setString(4, courseName);
            pst.executeUpdate();
            pst.close();

            out.println("</body>");
            out.println("</html>");
            response.sendRedirect("Courses.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EnrollCourse.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
