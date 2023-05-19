package entities;

public class Teacher {
    public String userName,fullName,dept,number,email;
    public Teacher(String fullName,String dept,String number,String email){
        this.fullName = fullName;
        this.dept = dept;
        this.number = number;
        this.email = email;
    }
    public Teacher(String userName,String fullName,String dept,String number,String email){
        this.userName = userName;
        this.fullName = fullName;
        this.dept = dept;
        this.number = number;
        this.email = email;
    }
}
