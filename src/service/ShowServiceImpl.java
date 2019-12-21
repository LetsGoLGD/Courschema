package service;

import bean.CourseBean;
import dao.ShowDao;
import dao.ShowDaoImpl;

import java.util.List;

public class ShowServiceImpl implements ShowService{
    ShowDao sd = new ShowDaoImpl();
    @Override
    public List<CourseBean> courseList(String year, String department, String plan) {
        List<CourseBean> cb = null;
        try{
            cb = sd.showList(year,department,plan);
        }catch (Exception e){
            e.printStackTrace();
        }
        return cb;
    }
}
