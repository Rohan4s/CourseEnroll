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
        query = "select full_name,dept,number,email from Teacher;";
        Connection con = Jdbc.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);

        List<Teacher> teachers = new ArrayList<>();

        while (rs.next()) {
            String name = rs.getString(1);
            String dept = rs.getString(2);
            String number = rs.getString(3);
            String email = rs.getString(4);
            Teacher teacher = new Teacher(name,dept,number,email);
            teachers.add(teacher);
        }
        return teachers;
    }


}
