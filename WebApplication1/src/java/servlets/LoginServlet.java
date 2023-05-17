package servlets;

import dao.LoginDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {

        res.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = res.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");

            HttpSession session = req.getSession();
            String name = req.getParameter("uname");
            String pass = req.getParameter("pass");
            LoginDao loginDao = new LoginDao();

            if (loginDao.check(name, pass)) {
                session.setAttribute("uname", name);
                session.setAttribute("pass", pass);
                session.setAttribute("role",loginDao.getRole());
                res.sendRedirect("welcome.jsp");
            } else {
                res.sendRedirect("index.jsp");
            }
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
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }



}
