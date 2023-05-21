package dao;

import helper.Jdbc;
import helper.SessionData;
import java.sql.*;
import entities.Teacher;
import java.util.ArrayList;
import java.util.List;

public class TeacherDao {

    String query;

    public List<Teacher> getAllTeachers() throws SQLException {
        query = "select full_name,dept,number,email,user_name,position from Teacher;";
        Connection con = Jdbc.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);

        List<Teacher> teachers = new ArrayList<>();

        while (rs.next()) {
            String fullName = rs.getString(1);
            String dept = rs.getString(2);
            String number = rs.getString(3);
            String email = rs.getString(4);
            String userName = rs.getString(5);
            String position = rs.getString(6);
            Teacher teacher = new Teacher(userName,fullName,dept,number,email,position);
            teachers.add(teacher);
        }
        return teachers;
    }


}
