package service;

import bean.CourseBean;
import bean.UserBean;

import java.util.List;

public interface UserService {
    int login(String name, String password);

    List<UserBean> info(String username);

    List<CourseBean> show(String username) throws Exception;

    List<UserBean> notice(String username);

    int getAU(String username) throws Exception;

    int updatePassword(String emailAdd, String newPassword) throws Exception;
}
