/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entities.Course;
import entities.Student;
import helper.Jdbc;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author rohan
 */
public class StudentDao {

    String query;

    public List<Student> getStudents(String courseCode) throws SQLException {
        query = "select user_name,full_name,dept,user_ID from takes,students where courseID=? and studentUsername=user_name";
        Connection con = Jdbc.getConnection();
        PreparedStatement st = con.prepareStatement(query);
        st.setString(1, courseCode);
        ResultSet rs = st.executeQuery();

        List<Student> students = new ArrayList<>();

        while (rs.next()) {
            String userName = rs.getString(1);
            String fullName = rs.getString(2);
            String dept = rs.getString(3);
            String id = rs.getString(4);
            Student student = new Student(userName,fullName,dept,id);
            students.add(student);
        }
        return students;
    }

}
