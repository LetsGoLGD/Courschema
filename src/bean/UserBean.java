package bean;

public class UserBean {
    private int id;
    private String name;
    private String department;
    private String password;
    private String gender;
    private String grade;
    private String mail;

    public String getGender() {
        return gender;
    }

    public String getGrade() {
        return grade;
    }

    public String getMail() {
        return mail;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public int getId() {
        return id;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public String getDepartment() {
        return department;
    }

    public String getName() {
        return name;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public void setName(String name) {
        this.name = name;
    }
}
