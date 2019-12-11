package service;

import bean.CourseBean;

import java.util.List;

public interface ShowService {
    public List<CourseBean> courseList(String year,String department,String plan,String type);
}
