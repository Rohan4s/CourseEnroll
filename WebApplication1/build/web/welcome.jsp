<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@page import="helper.SessionData"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Insert title here</title>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

//            String name = (String) session.getAttribute("uname");
//            String role = (String) session.getAttribute("role");
            SessionData sd = new SessionData();
            String name = sd.getUname(request);
            String role = sd.getRole(request);
            if (name==null) {
                response.sendRedirect("login.jsp");
                return;
            }

        %>
        Welcome   <%
            out.println(name+". You are a "+role);
        %>
        
        <form action="Logout" >
            <input type="submit" value="logout"/>
        </form>
        <a href="Home.jsp" > Home</a>
    </body>
</html>