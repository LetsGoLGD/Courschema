//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package service;

import bean.TopicBean;
import dao.PostDao;
import dao.PostDaoImpl;
import java.util.List;

public class PostServiceImpl implements PostService {
    PostDao postDao = new PostDaoImpl();

    public PostServiceImpl() {
    }

    public List<TopicBean> getTopics() throws Exception {
        return this.postDao.getTopics();
    }
}
