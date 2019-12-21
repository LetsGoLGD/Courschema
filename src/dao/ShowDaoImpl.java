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
    public List<CourseBean> showList(String year, String department, String plan) throws Exception {
        if(department==null){
            department = "";
        }
        if(plan==null){
            plan = "";
        }
        if(year==null){
            year = "";
        }
        List<CourseBean> cb = null;
        connection = dbutil.getConnection();
        String sql="select *\n" +
                "from course c\n" +
                "       join plan_course p on c.id_course = p.id_course\n" +
                "      join schema_plan sp on p.id_plan = sp.id_auto\n" +
                "      join major m on c.open_major = m.id_major\n" +
                "order by c.abbr_course;";
        preparedStatement=connection.prepareStatement(sql);
        resultSet=preparedStatement.executeQuery();
        cb=new ArrayList<CourseBean>();
        while (resultSet.next()){
            CourseBean C = new CourseBean();
            C.setId(resultSet.getInt(1));
            C.setMajor(resultSet.getString(19));
            C.setName(resultSet.getString(2));
            C.setCode(resultSet.getString(3));
            C.setCredit(resultSet.getInt(9));
            C.setPeriod(resultSet.getInt(10)*16);
            C.setYear(resultSet.getInt(14));
            int adYear = resultSet.getInt(12);
            String ad = "";
            switch (adYear){
                case 1:
                    ad = "大一上";
                    break;
                case 2:
                    ad = "大一下";
                    break;
                case 3:
                    ad = "大二上";
                    break;
                case 4:
                    ad = "大二下";
                    break;
                case 5:
                    ad = "大三上";
                    break;
                case 6:
                    ad = "大三下";
                    break;
                case 7:
                    ad = "大四上";
                    break;
                case 8:
                    ad = "大四下";
                    break;
                default:
                    ad = "任意";
                    break;
            }
            C.setAd_year(ad);
            int order = resultSet.getInt(15);
            if(order==1){
                C.setPlanOrder(13);
            }else{
                C.setPlanOrder(22);
            }
            String attr = resultSet.getString(12);
            if(attr.equals("1")){
                C.setAttr("必修");
            }else if(attr.equals("1")){
                C.setAttr("选修");
            }else {
                C.setAttr("核心");
            }
            if(C.getCode().contains(department)&&(plan==""||C.getPlanOrder()==Integer.parseInt(plan))
                    &&(year==""||C.getYear()==Integer.parseInt(year))){
                cb.add(C);
            }
        }
        return cb;
    }
}
