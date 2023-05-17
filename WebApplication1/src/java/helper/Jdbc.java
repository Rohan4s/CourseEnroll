package helper;

import java.sql.*;

public class Jdbc {

    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con == null) {
//                driver class load
                Class.forName("com.mysql.cj.jdbc.Driver");
//                create a connection
                String url = "jdbc:mysql://localhost:3306/demoApp";
                String user = "root";
                String pass = "1020";
                con = DriverManager.getConnection(url, user, pass);

            }
        } catch (ClassNotFoundException | SQLException e) {
            
        }
        return con;
    }
}
