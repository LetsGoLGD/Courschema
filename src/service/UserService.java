package service;

import bean.CourseBean;
import bean.UserBean;

import java.util.List;

public interface UserService {
    int login(String name, String password);

    List<UserBean> info(String username);

    List<CourseBean> show(String username) throws Exception;
}
