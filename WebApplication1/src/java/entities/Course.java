package entities;

import java.util.List;

public class Course {
    public int credit;
    public String title,teacherUsername,teacherName,code,teacherID,dept;
    
//    public String getTitle(){
//        return title;
//    }
    
    public Course(String code,String title,int credit,String teacherUsername,String teacherName,String dept){
        this.code=code;
        this.title=title;
        this.credit=credit;
        this.teacherUsername=teacherUsername;
        this.teacherName=teacherName;
        this.dept = dept;
    }
    
    

}
