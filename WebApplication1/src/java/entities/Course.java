package entities;

import java.util.List;

public class Course {
    public int credit;
    public String title,teacher,code,teacherID;
    
//    public String getTitle(){
//        return title;
//    }
    
    public Course(String code,String title,int credit,String teacher){
        this.code=code;
        this.title=title;
        this.credit=credit;
        this.teacher=teacher;
    }
    
    

}
