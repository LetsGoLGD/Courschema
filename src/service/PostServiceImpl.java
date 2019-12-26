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

    @Override
    public int addPost(String type, String userName, String content, String title) throws Exception {
        return this.postDao.addPost(type, userName, content, title);
    }

    @Override
    public int addReply(String topic_id, String userName, String content) throws Exception {
        return postDao.addReply(topic_id, userName, content);
    }
}
