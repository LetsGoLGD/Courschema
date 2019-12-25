package dao;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

import bean.CourseBean;
import bean.UserBean;
import util.DBUtil;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;

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

    @Override
    public List<UserBean> info(String username) throws Exception{
        connection = dbutil.getConnection();
        String sql = "select * from userinfo join major m on userinfo.id_major = m.id_major where username=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, username);
        resultSet = preparedStatement.executeQuery();
        List<UserBean> list = new ArrayList<UserBean>();
        while (resultSet.next()) {
            UserBean ub = new UserBean();
            ub.setName(resultSet.getString(5));
            ub.setDepartment(resultSet.getString(12));
            ub.setId(resultSet.getInt(2));
            ub.setGender(resultSet.getInt(8)==1?"男":"女");
            int g = resultSet.getInt(7);
            String gr = "";
            switch (g){
                case 1:
                    gr = "大一";
                    break;
                case 2:
                    gr = "大二";
                    break;
                case 3:
                    gr = "大三";
                    break;
                case 4:
                    gr = "大四";
                    break;
            }
            ub.setGrade(gr);
            ub.setMail(resultSet.getString(4));
            list.add(ub);
        }
        dbutil.closeDBResource(connection, preparedStatement, resultSet);
        return list;
    }

    @Override
    public List<CourseBean> show(String username) throws Exception {
        connection = dbutil.getConnection();
        String sql = "select abbr_course,name_course from (select username,id_course from userinfo join user_course uc on userinfo.id = uc.id_user) x join course c on c.id_course = x.id_course\n" +
                "where username = ?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, username);
        resultSet = preparedStatement.executeQuery();
        List<CourseBean> list = new ArrayList<CourseBean>();
        while (resultSet.next()) {
            CourseBean cb= new CourseBean();
            cb.setAbbr_name(resultSet.getString(0));
            cb.setCourse_name(resultSet.getString(1));
            list.add(cb);
        }
        dbutil.closeDBResource(connection, preparedStatement, resultSet);
        return list;
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
