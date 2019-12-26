package dao;

import bean.CourseBean;
import bean.UserBean;

import java.security.NoSuchAlgorithmException;
import java.util.List;

public interface UserDao {
    int login(String username, String password) throws Exception;

    List<UserBean> info(String username) throws Exception;

    List<CourseBean> show(String username) throws Exception;

    List<UserBean> notice(String username) throws Exception;

    int getAU(String username) throws Exception;
}
