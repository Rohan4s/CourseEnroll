/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package helper;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rohan
 */
@WebServlet(name = "SessionData", urlPatterns = {"/SessionData"})
public class SessionData {

    public String getUname(HttpServletRequest req) {
        HttpSession session = req.getSession();
        return (String) session.getAttribute("uname");
    }

    public String getRole(HttpServletRequest req) {
        HttpSession session = req.getSession();
        return (String) session.getAttribute("role");
    }

}
