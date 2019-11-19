package dao;

import java.security.NoSuchAlgorithmException;

public interface UserDao {
    int login(String username, String password) throws Exception;
}
