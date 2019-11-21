package bean;

public class CourseBean {
    private int id;
    private String code;
    private String name;
    private int credit;
    private int period;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getCredit() {
        return credit;
    }

    public int getPeriod() {
        return period;
    }

    public void setCredit(int credit) {
        this.credit = credit;
    }

    public void setPeriod(int period) {
        this.period = period;
    }
}

