package dao;

import helper.Jdbc;
import java.sql.*;
import entities.Course;
import java.util.ArrayList;
import java.util.List;

public class CourseDao {

    String query;

    public List<Course> getAllCourses() throws SQLException { // Get all courses available in the university
        query = "select ID,Title,Credit,user_name from courses,teacher where TeacherUsername=user_name";
        Connection con = Jdbc.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);

        List<Course> courses = new ArrayList<>();

        while (rs.next()) {
            String ID = rs.getString(1);
            String Title = rs.getString(2);
            int credit = rs.getInt(3);
            String teacherName = rs.getString(4);
            Course course = new Course(ID, Title, credit, teacherName);
            courses.add(course);
        }
        return courses;
    }

    public List<Course> getRegisteredCourses(String username) throws SQLException { // Get all courses a student is taking

        query = "select ID,Title,credit,TeacherUsername from courses,takes where ID=courseID and studentUsername=?";
        Connection con = Jdbc.getConnection();
        PreparedStatement st = con.prepareStatement(query);
        st.setString(1, username);
        ResultSet rs = st.executeQuery();

        List<Course> courses = new ArrayList<>();

        while (rs.next()) {
            String ID = rs.getString(1);
            String Title = rs.getString(2);
            int credit = rs.getInt(3);
            String teacherName = rs.getString(4);
            Course course = new Course(ID, Title, credit, teacherName);
            courses.add(course);
        }
        return courses;
    }
    
    
    public List<Course> getCoursesTeaching(String username) throws SQLException { // Get all courses a teacher is teaching

        query = "select ID,Title,Credit from courses where TeacherUsername=?";
        Connection con = Jdbc.getConnection();
        PreparedStatement st = con.prepareStatement(query);
        st.setString(1, username);
        ResultSet rs = st.executeQuery();

        List<Course> courses = new ArrayList<>();

        while (rs.next()) {
            String ID = rs.getString(1);
            String Title = rs.getString(2);
            int credit = rs.getInt(3);
            Course course = new Course(ID, Title, credit," ");
            courses.add(course);
        }
        return courses;
    }
    

}
