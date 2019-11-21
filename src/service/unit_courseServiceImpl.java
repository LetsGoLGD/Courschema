package service;

import bean.unit_courseBean;
import dao.unit_courseDao;
import dao.unit_courseDaoImpl;

import java.util.List;

public class unit_courseServiceImpl implements unit_courseService {
    unit_courseDao unit_coursedao = new unit_courseDaoImpl();
    public List<unit_courseBean> fetchunit_courseList(int year,int id_major,String plan_order){
        List<unit_courseBean> unit_coursebeanList = null;
        try {
            unit_coursebeanList = unit_coursedao.fetchunit_courseList(year,id_major,plan_order);
        }catch (Exception e ){
            e.printStackTrace();
        }
        return  unit_coursebeanList;
        
    }
}
