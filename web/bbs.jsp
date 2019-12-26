<%@ page import="bean.TopicBean" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.ReplyBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upload</title>
    <!--    <link rel="stylesheet" type="text/css" href="css/upload.css"/>-->
    <script src="scripts/jquery-3.4.1.min.js"></script>
    <script src="scripts/bbs.js"></script>
    <script src="scripts/jquery.tabletojson.min.js"></script>
    <script src="scripts/xlsx.full.min.js"></script>
    <!--    <script src="/scripts/jBox.all.min.js"></script>-->
    <!--    <link href="/css/jBox.all.min.css" rel="stylesheet">-->
    <script src="scripts/jquery.validate.min.js"></script>
    <link rel="stylesheet" href="css/w3.css">
    <link rel="stylesheet" href="css/w32.css">
</head>

<body>
<div class="w3-bar w3-teal w3-display-container">
    <div class="w3-bar-item ">
        <a href="https://www.sustech.edu.cn/">
            <img src="assert/schoolLogo.png" alt="SUSTech" style="height: 80px;">
        </a>
    </div>
    <div class="w3-bar-item w3-display-right" style="display: flex; align-items:center">
        <!--TODO: username from backend-->
        <p class="w3-margin-right"><b>Hello! Username</b></p>
        <a href="login.jsp" class="w3-margin-right">
            <!--TODO: do something to stop the login in backend?-->
            <button class="w3-btn w3-white w3-border w3-border-blue w3-round ">Log out</button>
        </a>
    </div>
</div>
<button class="w3-button w3-left w3-xlarge" onclick="$('#mySidebar').show()">☰</button>

<div class="w3-sidebar w3-bar-block w3-border-right" style="display:none" id="mySidebar">
    <h3 class="w3-bar-item">菜单</h3>
    <button onclick="$('#mySidebar').hide()" class="w3-bar-item w3-large">关闭 &times;</button>
    <a href="self_info.jsp" class="w3-bar-item w3-button">个人资料</a>
    <a href="ShowServlet" class="w3-bar-item w3-button">查看培养方案</a>
    <!--TODO: if current login is not admin, ask to login as admin-->
    <a href="AdjustServlet" class="w3-bar-item w3-button">修改培养方案</a>
    <a href="upload_f.jsp" class="w3-bar-item w3-button">上传课程</a>
    <!--TODO: Q&A model to add-->
    <a href="PostServlet" class="w3-bar-item w3-button">论坛</a>
</div>
<div style="margin-left:10%; margin-top:80px;margin-right:10%">
    <div>
        <ul class="w3-navbar w3-card-2 w3-border w3-light-grey">
            <li onclick="onClickAll()"><a class="w3-green" id="all">所有</a></li>
            <li onclick="onClickCourse()"><a id="courseArr">课程安排</a></li>
            <li onclick="onClickSchema()"><a id="schema">培养方案</a></li>
            <li onclick="onClickWater()"><a id="water">水贴</a></li>
            <li onclick="onClickSelf()"><a id="self">我的帖子</a></li>
            <li onclick="$('#formWindow').show()" class="w3-right"><a><strong>发帖</strong></a></li>
        </ul>

        <div class="w3-modal" id="formWindow">
            <div class="w3-modal-content w3-animate-bottom">
                <div class="w3-container w3-teal">
                    <h2>发帖</h2>
                    <span onclick="$('#formWindow').hide()"
                          class="w3-button w3-xlarge w3-hover-red w3-display-topright w3-teal" style="position: absolute;top: 7%;transform: translateY(-50%);">&times;</span>
                </div>
                    <form class="w3-container w3-card-4" name="post" action="AddPostServlet" method="post">
                    <br>
                    <p>
                        <label class="w3-text-grey">标题</label>
                        <input class="w3-input" type="text" id="title" name="title">
                    </p>
                    <p>
                        <label class="w3-text-grey">类别</label>
                    </p>
                    <div class="w3-row">
                        <div class="w3-half">
                            <input class="w3-radio" type="radio" name="group" value="课程安排" checked="">
                            <label class="w3-validate">课程安排</label>
                            <input class="w3-radio" type="radio" name="group" value="培养方案">
                            <label class="w3-validate">培养方案</label>
                            <input class="w3-radio" type="radio" name="group" value="水贴">
                            <label class="w3-validate">水贴</label>
                        </div>
                    </div>
                    <br>
                    <p>
                        <label class="w3-text-grey">内容</label>
                        <textarea class="w3-input" style="resize:none" spellcheck="false" id="content" name="content"></textarea>
                    </p>
                    <p>
                        <button type="submit" class="w3-btn w3-padding w3-teal" style="width:120px"><strong>发布</strong> &nbsp; ❯</button>
                    </p>
                </form>
            </div>
        </div>
    </div>

    <%
        List<TopicBean> list = (List<TopicBean>) request.getAttribute("List");
    %>
    <div style="margin-top:20px">
        <ul class="w3-ul w3-card-4" id="postList">
            <%
                for (TopicBean topicBean : list) {
            %>
            <li class="w3-padding-16" id="li<%=topicBean.getId()%>" onclick="onClickOpenPost(<%=topicBean.getId()%>)">
                <span class="w3-closebtn w3-padding"><%=topicBean.getType()%></span>
                <span class="w3-xlarge"><%=topicBean.getTitle()%></span><br>
                <span><%=topicBean.getRealName()%></span>
            </li>
            <%
                }
            %>
        </ul>

        <ul class="w3-ul w3-card-4" id="selfPost" style="display: none">
            <%
                for (TopicBean topicBean : list) {
                    if(topicBean.getUser().equals((String) session.getAttribute("username"))){
            %>
            <li class="w3-padding-16" id="li<%=topicBean.getId()%>" onclick="onClickOpenPost(<%=topicBean.getId()%>)">
                <span class="w3-closebtn w3-padding"><%=topicBean.getType()%></span>
                <span class="w3-xlarge"><%=topicBean.getTitle()%></span><br>
                <span><%=topicBean.getRealName()%></span>
            </li>
            <%
                    }
                }
            %>
        </ul>
    </div>

    <%
        for (TopicBean topicBean : list) {
    %>
    <div class="w3-modal" id="postWindow<%=topicBean.getId()%>">
        <div class="w3-modal-content w3-animate-bottom">
            <header class="w3-container w3-light-grey">
                <h3 id="postTitle"><%=topicBean.getTitle()%> [<%=topicBean.getType()%>]</h3>
                <span onclick="$('#postWindow<%=topicBean.getId()%>').hide()"
                      class="w3-button w3-xlarge w3-hover-red w3-display-topright">&times;</span>
            </header>

            <div class="w3-container">
                <div id="replies">
                </div>
                <p><strong><%=topicBean.getRealName()%></strong></p>
                <p><%=topicBean.getContent()%></p>
                <hr>
                <%
                    List<ReplyBean> list2 = topicBean.getReplyBeans();
                    for (int i = 0; i < list2.size(); i++) {
                %>
                <p><strong><%=i+1%>楼　<%=list2.get(i).getRealName()%></strong></p>
                <p><%=list2.get(i).getContent()%></p>
                <hr>
                <%
                    }
                %>
                <div>
                    <input class="w3-input w3-border" type="text" id='postReply<%=topicBean.getId()%>' placeholder="回复">
                    <button type="submit" class="w3-btn w3-green w3-round w3-margin-top"
                            onclick="location.href='AddReplyServlet?topic_id=<%=topicBean.getId()%>&&replyContent='+document.getElementById('postReply<%=topicBean.getId()%>').value"
                            id="submitReply">提交
                    </button>
                </div>
                <hr>
            </div>
        </div>
    </div>
    <%
        }
    %>
</div>
</body>

</html>