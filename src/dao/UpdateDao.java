package dao;

import bean.CourseBean;

import java.util.List;

public interface UpdateDao {
    List<CourseBean> showList(String course, String department, String year, String plan) throws Exception;

    void Delete(int id, int planId) throws Exception;

    int add(String pre,String courseName, String shortName, String credit, String semester, String major,Object year,Object department
    , Object plan) throws Exception;
}
