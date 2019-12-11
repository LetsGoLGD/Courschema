package bean;

public class CourseBean {
    private int id;
    private String code;
    private String name;
    private int credit;
    private int period;
    private int planOrder;
    private String attr;
    private int year;

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getAttr() {
        return attr;
    }

    public int getPlanOrder() {
        return planOrder;
    }

    public void setAttr(String attr) {
        this.attr = attr;
    }

    public void setPlanOrder(int planOrder) {
        this.planOrder = planOrder;
    }

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

