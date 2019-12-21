package dao;

import bean.UserBean;

import java.security.NoSuchAlgorithmException;
import java.util.List;

public interface UserDao {
    int login(String username, String password) throws Exception;

    List<UserBean> info(String username) throws Exception;
}
