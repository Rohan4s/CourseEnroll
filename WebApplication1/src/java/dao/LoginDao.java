package dao;

import helper.Jdbc;
import java.sql.*;
public class LoginDao {
    
    String query = "select * from users where user_name=? and pass=?";
    String role;
    
    public boolean check(String uname, String upass) throws SQLException {    
//        Jdbc jdbc = new Jdbc();
        Connection con = Jdbc.getConnection();
        PreparedStatement st = con.prepareStatement(query);
        st.setString(1, uname);
        st.setString(2, upass);
        ResultSet rs = st.executeQuery();
        if (rs.next()){
            role = rs.getString(5);
           return true;
        }
        return false;
    }
    public String getRole(){
        return role;
    }
}
