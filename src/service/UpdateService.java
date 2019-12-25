package service;

import bean.CourseBean;

import java.util.List;

public interface UpdateService {

    List<CourseBean> courseInfo(String course, String department, String year, String plan);

    void Delete(int id, int planId) throws Exception;
}
