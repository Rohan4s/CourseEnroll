/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import dao.RegistrationDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rohan
 */
public class Registration extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Registration</title>");            
            out.println("</head>");
            out.println("<body>");
            
            // fetch all data from registration form
            String userName = request.getParameter("userName");
            String fullName = request.getParameter("firstName")+" "+request.getParameter("lastName");
            String userID = request.getParameter("userID");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String role = request.getParameter("role");
            String password = request.getParameter("password");
            String passwordConfirmation = request.getParameter("passwordConfirmation");
            String dept = request.getParameter("dept");
            
            
            out.print(userName+"<br>");
            out.print(fullName+"<br>");
            out.print(userID+"<br>");
            out.print(email+"<br>");
            out.print(role+"<br>");
            out.print(password+"<br>");
            out.print(passwordConfirmation+"<br>");
            out.print(dept+"<br>");
            
            if(password.equals(passwordConfirmation ) == false){
//                response.sendRedirect("Registration.jsp?err=passMismatch");
                    out.println("mismatch");
                return;
            }
            
            // insert into user table
            RegistrationDao registrationDao = new RegistrationDao();
            registrationDao.insertToUser(userName, fullName, userID, password, role);
            
            if(role.equals("student")){
                registrationDao.insertToStudent(userName, fullName, userID, dept);
            }
            else if(role.equals("teacher")){
                registrationDao.insertToTeacher(userName, fullName, userID, dept,phone,email);
            }
            
            response.sendRedirect("index.jsp?user=created");
            
            
//            out.println("<h1>Servlet Registration at " + request.getContextPath() + "</h1>");
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
            Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
