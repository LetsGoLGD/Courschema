package dao;

import bean.CourseBean;

import java.util.List;

public interface ShowDao {
    List<CourseBean> showList(String year, String department, String plan,String type) throws Exception;
}
