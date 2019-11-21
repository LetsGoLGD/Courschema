package bean;

public class unit_courseBean {
    
 
    
    private String name;
    private String abbre_course;
    private String score_course;
    private int semeter_id;
    private String name_major;
    
    public void setName(String name) {
        this.name = name;
    }
    
    public void setAbbre_course(String abbre_course) {
        this.abbre_course = abbre_course;
    }
    
    public void setScore_course(String score_course) {
        this.score_course = score_course;
    }
    
    public void setSemeter_id(int semeter_id) {
        this.semeter_id = semeter_id;
    }
    
    public void setName_major(String name_major) {
        this.name_major = name_major;
    }
    
    public String getName() {
        return name;
    }
    
    public String getAbbre_course() {
        return abbre_course;
    }
    
    public String getScore_course() {
        return score_course;
    }
    
    public int getSemeter_id() {
        return semeter_id;
    }
    
    public String getName_major() {
        return name_major;
    }
}
