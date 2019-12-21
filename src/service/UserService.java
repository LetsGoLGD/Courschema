package service;

import bean.UserBean;

import java.util.List;

public interface UserService {
    int login(String name, String password);

    List<UserBean> info(String username);
}
