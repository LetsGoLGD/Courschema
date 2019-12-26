//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package dao;

import bean.TopicBean;
import java.util.List;

public interface PostDao {
    List<TopicBean> getTopics() throws Exception;
    int addPost(String type, String userName, String content, String title) throws Exception;
    int addReply(String topic_id, String userName, String content) throws Exception;
}
