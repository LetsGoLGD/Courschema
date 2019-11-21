package dao;

import bean.unit_courseBean;
import databases.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class unit_courseDaoImpl implements unit_courseDao {
    DBUtil dbutil = new DBUtil();
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    Statement statement = null;
    ResultSetMetaData metaData = null;
    @Override
    public List<unit_courseBean> fetchunit_courseList(int year, int id_major, String plan_order) throws Exception {
        System.out.println("year: "+year + " id_major: "
                +id_major + " plan_order: "+plan_order);
        List<unit_courseBean> unit_courseList = null;
        connection = dbutil.getConnection();
        String sql1 =
                "select uc.name,c.abbre_course,c.score_course,uc.semster_id,m.name_major from course c inner join unit_course uc on c.id_course = uc.id_course\n" +
                "inner join major m on uc.id_major = m.id_major where uc.year = ? and uc.id_major = ? and uc.plan_order = ?";
        preparedStatement = connection.prepareStatement(sql1);
        preparedStatement.setInt(1,year);
        preparedStatement.setInt(2,id_major);
        preparedStatement.setString(3,plan_order);
        resultSet = preparedStatement.executeQuery();
        unit_courseList = new ArrayList<unit_courseBean>();
        while (resultSet.next()){
            unit_courseBean unit_coursebean = new unit_courseBean();
            unit_coursebean.setName(resultSet.getString("name"));
            unit_coursebean.setAbbre_course(resultSet.getString("abbre_course"));
            unit_coursebean.setScore_course(resultSet.getString("score_course"));
            unit_coursebean.setSemeter_id(resultSet.getInt("semster_id"));
            unit_coursebean.setName_major(resultSet.getString("name_major"));
            unit_courseList.add(unit_coursebean);
        }
        dbutil.closeDBResource(connection,preparedStatement,resultSet);
        return unit_courseList;
    }
}
