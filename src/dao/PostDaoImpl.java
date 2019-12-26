//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package dao;

import bean.ReplyBean;
import bean.TopicBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.DBUtil;

public class PostDaoImpl implements PostDao {
    Connection connection = null;
    DBUtil dbutil = new DBUtil();
    PreparedStatement preparedStatement = null;
    ResultSet resultSet1 = null;
    ResultSet resultSet2 = null;
    ResultSet resultSet3 = null;

    public PostDaoImpl() {
    }

    public List<TopicBean> getTopics() throws Exception {
        this.connection = this.dbutil.getConnection();
        String sql1 = "SELECT t.* FROM public.topic t";
        this.preparedStatement = this.connection.prepareStatement(sql1);
        this.resultSet1 = this.preparedStatement.executeQuery();
        ArrayList topicBeans = new ArrayList();

        while(this.resultSet1.next()) {
            TopicBean topicBean = new TopicBean();
            topicBean.setId(this.resultSet1.getInt(1));
            topicBean.setType(this.resultSet1.getInt(2));
            topicBean.setUser(this.resultSet1.getString(3));
            topicBean.setTitle(this.resultSet1.getString(4));
            topicBean.setContent(this.resultSet1.getString(5));
            String sql3 = "select u.real_name from topic f join userinfo u on f.name_user = u.username where f.id_topic = " + topicBean.getId();
            this.preparedStatement = this.connection.prepareStatement(sql3);
            this.resultSet3 = this.preparedStatement.executeQuery();
            this.resultSet3.next();
            topicBean.setRealName(this.resultSet3.getString(1));
            String sql2 = "select f.id_user, u.real_name,f.inside from floor f join userinfo u on f.id_user = u.username where f.id_topic = " + topicBean.getId() + " order by f.id_auto";
            this.preparedStatement = this.connection.prepareStatement(sql2);
            this.resultSet2 = this.preparedStatement.executeQuery();

            while(this.resultSet2.next()) {
                ReplyBean replyBean = new ReplyBean();
                replyBean.setUserName(this.resultSet2.getString(1));
                replyBean.setRealName(this.resultSet2.getString(2));
                replyBean.setContent(this.resultSet2.getString(3));
                topicBean.addReply(replyBean);
            }

            topicBeans.add(topicBean);
        }

        return topicBeans;
    }

    @Override
    public int addPost(String type, String userName, String content, String title) throws Exception {
        this.connection = this.dbutil.getConnection();
        String sql1 = "insert into topic (part, name_user, title, inside) " +
                "values (?,?,?,?);";
        preparedStatement=connection.prepareStatement(sql1);
        preparedStatement.setInt(1, TopicBean.getTypeId(type));
        preparedStatement.setString(2, userName);
        preparedStatement.setString(4, content);
        preparedStatement.setString(3, title);
        return preparedStatement.executeUpdate();
    }

    @Override
    public int addReply(String topic_id, String userName, String content) throws Exception {
        this.connection = this.dbutil.getConnection();
        String sql1 = "insert into floor (id_topic, id_user, inside) " +
                "values (?,?,?);";
        preparedStatement=connection.prepareStatement(sql1);
        preparedStatement.setInt(1, Integer.parseInt(topic_id));
        preparedStatement.setString(2, userName);
        preparedStatement.setString(3, content);
        return preparedStatement.executeUpdate();
    }
}
