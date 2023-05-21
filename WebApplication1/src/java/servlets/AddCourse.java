/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import dao.CourseDao;
import java.util.logging.Logger;

/**
 *
 * @author rohan
 */
public class AddCourse extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddCourse</title>");
            out.println("</head>");
            out.println("<body>");
            
            String dept = request.getParameter("dept");
            String code = request.getParameter("courseCode");
            String courseCode = dept+" "+code;
            String courseTitle = request.getParameter("courseTitle");
            String teacherUsername = request.getParameter("teacherUsername");
            String credit = request.getParameter("credit");
//            out.println(dept);
//            out.println(courseCode);
//            out.println(courseTitle);
//            out.println(credit);
//            out.println(teacherUsername);
            
            
            // create new course and assign teacher
            CourseDao courseDao = new CourseDao();
            courseDao.addCourse(courseCode,courseTitle,teacherUsername,credit);
            response.sendRedirect("Courses.jsp?add=true");
            

            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddCourse.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
