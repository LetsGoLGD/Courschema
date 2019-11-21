package dao;

import bean.CourseBean;
import databases.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UpdateDaoImpl implements UpdateDao {
    DBUtil dbutil = new DBUtil();
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    Statement statement = null;
    ResultSetMetaData metaData = null;
    @Override
    public List<CourseBean> showList(String course, String department, String year,String plan) throws Exception {
        List<CourseBean> cb = null;
        connection = dbutil.getConnection();
        String sql0="update ********* from Course";
        preparedStatement=connection.prepareStatement(sql0);
        preparedStatement.execute();
        String sql="select ********* from Course";
        preparedStatement=connection.prepareStatement(sql);
        resultSet=preparedStatement.executeQuery();
        cb=new ArrayList<CourseBean>();
        while (resultSet.next()){
            CourseBean C = new CourseBean();
            //attributes
            cb.add(C);
        }
        return cb;
    }
}
