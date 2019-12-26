package service;

import bean.CourseBean;
import dao.UpdateDao;
import dao.UpdateDaoImpl;

import java.util.List;

public class UpdateServiceImpl implements UpdateService{
    UpdateDao ud = new UpdateDaoImpl();
    @Override
    public List<CourseBean> courseInfo(String course, String department, String year, String plan) {
        List<CourseBean> cb = null;
        try{
            cb = ud.showList(course,department,year,plan);
        }catch (Exception e){
            e.printStackTrace();
        }
        return cb;
    }

    @Override
    public void Delete(int id, int planId) throws Exception {
        ud.Delete(id,planId);
    }

    @Override
    public int add(String pre,String courseName, String shortName, String credit, String semester, String major, Object year, Object department, Object plan) throws Exception {
        return ud.add(pre,courseName,shortName,credit,semester,major,year,department,plan);
    }


}
