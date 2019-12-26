//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package bean;

import java.util.ArrayList;
import java.util.List;

public class TopicBean {
    private int id;
    private String type;
    private String title;
    private String realName;
    private String content;
    private String user;
    private List<ReplyBean> replyBeans = new ArrayList();
    private static String[] typeName = new String[]{"课程安排", "培养方案", "水贴"};

    public TopicBean() {
    }

    public String getType() {
        return this.type;
    }

    public static int getTypeId(String type) {
        for(int i = 0; i < typeName.length; i++){
            if(typeName[i].equals(type)){
                return i + 1;
            }
        }

        return 0;
    }

    public void setType(int typeId) {
        this.type = typeName[typeId - 1];
    }

    public String getUser() {
        return this.user;
    }

    public String getRealName() {
        return this.realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public void addReply(ReplyBean replyBean) {
        this.replyBeans.add(replyBean);
    }

    public List<ReplyBean> getReplyBeans() {
        return this.replyBeans;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
