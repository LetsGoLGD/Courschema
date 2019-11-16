package service;

import dao.UserDao;
import dao.UserDaoImpl;

public class UserServiceImpl implements UserService{
    private UserDao userDao = new UserDaoImpl();
    @Override
    public int login(String username, String password) {

        int result = 0;
        try {
            result = userDao.login(username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
