package dao;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import util.DBUtil;
import java.math.BigInteger;
import java.security.MessageDigest;
public class UserDaoImpl implements UserDao {
    Connection connection=null;
    DBUtil dbutil = new DBUtil();
    ResultSet resultSet =null;
    PreparedStatement preparedStatement = null;
    @Override
    public int login(String username, String password) throws Exception {
        int result = 0;
        connection = dbutil.getConnection();
        String sql = "select count(*) from userinfo where username=? and password=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, username);
        String ShaPwd = SHAPassword(password);
        preparedStatement.setString(2, password);
        resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            result = resultSet.getInt(1);
        }
        dbutil.closeDBResource(connection, preparedStatement, resultSet);
        return result;
    }

    public static final String KEY_SHA = "SHA";
    public String SHAPassword(String password) throws NoSuchAlgorithmException {
        BigInteger sha = null;
        byte[] data = password.getBytes();
        MessageDigest messageDigest = MessageDigest.getInstance(KEY_SHA);
        messageDigest.update(data);
        sha = new BigInteger(messageDigest.digest());
        return sha.toString(32);
    }
}
