package service;

import bean.unit_courseBean;

import java.util.List;

public interface unit_courseService {
    public List<unit_courseBean> fetchunit_courseList(int year,int id_major,String plan_order);
}
