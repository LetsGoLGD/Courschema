package dao;

import bean.CourseBean;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ShowDaoImpl implements ShowDao {
    DBUtil dbutil = new DBUtil();
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    Statement statement = null;
    ResultSetMetaData metaData = null;
    @Override
    public List<CourseBean> showList(String year, String department, String plan,String type) throws Exception {
        List<CourseBean> cb = null;
        connection = dbutil.getConnection();
        String sql="select * from course";
        preparedStatement=connection.prepareStatement(sql);
        resultSet=preparedStatement.executeQuery();
        cb=new ArrayList<CourseBean>();
        while (resultSet.next()){
            CourseBean C = new CourseBean();
            C.setId(resultSet.getInt(1));
            C.setName(resultSet.getString(2));
            C.setCode(resultSet.getString(3));
            C.setCredit(resultSet.getInt(4));
            C.setPeriod(resultSet.getInt(5));
            // filter
            cb.add(C);
        }
        return cb;
    }
}
