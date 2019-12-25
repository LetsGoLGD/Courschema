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
        int d = 0;
        int p = 0;
        int y = 0;
        if(department==null){
            department = "";
        }else {
            switch (department){
                case "CS":
                    d = 1;
                    break;
                case "FI":
                    d = 2;
                    break;
                case "PH":
                    d = 3;
                    break;
                case "MA":
                    d = 4;
                    break;
                case "BI":
                    d = 5;
                    break;
                case "EL":
                    d = 6;
                    break;
            }
        }
        if(plan==null){
            plan = "";
        }else{
            switch (plan){
                case "22":
                    p = 2;
                    break;
                case "13":
                    p = 1;
                    break;
            }
        }
        if(year==null){
            year = "";
        }else{
            switch (year){
                case "2016":
                    y = 2016;
                    break;
                case "2017":
                    y = 2017;
                    break;
                case "2018":
                    y = 2018;
                    break;
                case "2019":
                    y = 2019;
                    break;
            }
        }
        List<CourseBean> cb = null;
        connection = dbutil.getConnection();
        String sql="select c.id_course,c.abbr_course,m.name_major,pc.name_course,sp.year,pc.inter_year,pc.adivse_semster,c.open_time,pc.score_course,pc.inter_year,pc.group_message,pc.id_plan\n" +
                "from course c join plan_course pc on c.id_course = pc.id_course join schema_plan sp on pc.id_plan = sp.id_auto\n" +
                "join major m on c.open_major = m.id_major order by c.abbr_course ;";
        preparedStatement=connection.prepareStatement(sql);
        resultSet=preparedStatement.executeQuery();
        cb=new ArrayList<CourseBean>();
        while (resultSet.next()){
            CourseBean C = new CourseBean();
            C.setId(resultSet.getInt(1));
            C.setMajor(resultSet.getString(3));
            C.setName(resultSet.getString(4));
            C.setCode(resultSet.getString(2));
            C.setCredit(resultSet.getInt(9));
            C.setPeriod(resultSet.getInt(9)*16);
            C.setYear(resultSet.getInt(5));
            int adYear = resultSet.getInt(7);
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
            int order = resultSet.getInt(10);
            if(order==1){
                C.setPlanOrder(13);
            }else{
                C.setPlanOrder(22);
            }
            C.setAttr(resultSet.getString(11));
            String open_tim = "";
            switch (resultSet.getInt(8)){
                case 1:
                    open_tim = "秋";
                    break;
                case 2:
                    open_tim = "春";
                    break;
                case 3:
                    open_tim = "春秋";
                    break;
                case 4:
                    open_tim = "小学期";
                    break;
                default:
                    open_tim = "任意";
                    break;
            }
            C.setOpen_time(open_tim);
            sql = "select c2.name_course from pre_course join course c on pre_course.id_course = c.id_course join course c2 on pre_course_id = c2.id_course\n" +
                    "where pre_course.id_course=?";
            PreparedStatement preparedStatement2=connection.prepareStatement(sql);
            preparedStatement2.setInt(1,C.getId());
            ResultSet resultSet2=preparedStatement2.executeQuery();
            String pre = "";
            while ((resultSet2.next())){
                String tmp = resultSet2.getString(1)+" ";
                pre += tmp;
            }
            if(pre==""){
                pre = "无";
            }
            C.setPre(pre);
            int id_plan = resultSet.getInt(12);
            C.setPlanNum(id_plan);
            if(y*d*p!=0){
                sql = "select * from schema_plan sp join plan_course pc on sp.id_auto = pc.id_plan where sp.year=? and sp.inter_year = ?  and sp.major_schema = ?;";
                PreparedStatement preparedStatement3=connection.prepareStatement(sql);
                preparedStatement3.setInt(1,y);
                preparedStatement3.setInt(2,p);
                preparedStatement3.setInt(3,d);
                ResultSet resultSet3=preparedStatement3.executeQuery();
//                C.print_c();
                int num = 0;
                if(resultSet3.next()){
                    num = resultSet3.getInt(6);
                }
                if(num==id_plan){
                    cb.add(C);
                }
            }else {
                cb.add(C);
            }
        }
        return cb;
    }
}
