/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import helper.Jdbc;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author rohan
 */
public class RegistrationDao {

    String query;

    public void insertToUser(String userName, String fullName, String userID, String pass, String role) throws SQLException {
        query = "insert into users values(?,?,?,?,?)";
        Connection con = Jdbc.getConnection();
        PreparedStatement st = con.prepareStatement(query);
        st.setString(1, userName);
        st.setString(2, fullName);
        st.setString(3, userID);
        st.setString(4, pass);
        st.setString(5, role);
        st.executeUpdate();
    }
    public void insertToStudent(String userName, String fullName, String userID, String dept) throws SQLException {
        query = "insert into students values(?,?,?,?)";
        Connection con = Jdbc.getConnection();
        PreparedStatement st = con.prepareStatement(query);
        st.setString(1, userName);
        st.setString(2, fullName);
        st.setString(3, userID);
        st.setString(4, dept);
        st.executeUpdate();
    }
    public void insertToTeacher(String userName, String fullName, String userID, String dept,String number,String email) throws SQLException {
        query = "insert into teacher values(?,?,?,?,?,?)";
        Connection con = Jdbc.getConnection();
        PreparedStatement st = con.prepareStatement(query);
        st.setString(1, userName);
        st.setString(2, fullName);
        st.setString(3, userID);
        st.setString(4, dept);
        st.setString(5, number);
        st.setString(6, email);
        st.executeUpdate();
    }

}
