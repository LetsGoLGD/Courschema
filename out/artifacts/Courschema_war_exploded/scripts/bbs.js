let all =　document.getElementById("all");
let course =　document.getElementById("courseArr");
let schema =　document.getElementById("schema");
let water =　document.getElementById("water");
let self =　document.getElementById("self");

function getObjects() {
    all =　document.getElementById("all");
    course =　document.getElementById("courseArr");
    schema =　document.getElementById("schema");
    water =　document.getElementById("water");
    self =　document.getElementById("self");
}

function onClickAll() {
    getObjects();
    all.className = "w3-green";
    course.className = "";
    schema.className = "";
    water.className = "";
    self.className = "";
}

function onClickCourse() {
    getObjects();
    all.className = "";
    course.className = "w3-green";
    schema.className = "";
    water.className = "";
    self.className = "";
}

function onClickSchema() {
    getObjects();
    all.className = "";
    course.className = "";
    schema.className = "w3-green";
    water.className = "";
    self.className = "";
}

function onClickWater() {
    getObjects();
    all.className = "";
    course.className = "";
    schema.className = "";
    water.className = "w3-green";
    self.className = "";
}

function onClickSelf() {
    getObjects();
    all.className = "";
    course.className = "";
    schema.className = "";
    water.className = "";
    self.className = "w3-green";
}

function addPost(title, content, type) {
    let lists = document.getElementById("post");
    let li_content =　document.createElement("li");
    //TODO: get username
    li_content.className = "w3-padding-16";
    li_content.onclick = onClickOpenPost;
    li_content.innerHTML =
        "<span class=\"w3-closebtn w3-padding\">" + type + "</span>" +
        "<span class=\"w3-xlarge\">" + title + "</span><br>" +
        "<span>小白</span>";
    lists.append(li_content);
}

function onClickAddReply() {
    let replyContent = document.getElementById('postReply').value;
    if(replyContent.length === 0){
        alert("回复内容不能为空");
        return
    }

//    Todo: get the user name
    let user = '小蓝';
    let replies_div = document.getElementById("replies");
    replies_div.innerHTML = replies_div.innerHTML + getReplyContent(user, replyContent);
    $("#postReply").val("");
}

function getReplyContent(user, content) {
    return "<p><strong>" + user + "</strong></p>" +
    "<p>" + content + "</p>" +
    "<hr>";
}

function onClickOpenPost() {
    let type = "培养方案";
    let title = "2017级面向对象的先修课程是？" + " [" + type + "] ";
    let user = "小红";
    let content = "请问今年的面向对象课程的先修课是？";
    let replies = [{user: "小白", content: "好像是java"}, {user: "小蓝", content: "的确是java"}];
    let replies_div = document.getElementById("replies");
    let replies_html = "<p><strong>" + user + "</strong></p>" +
        "<p>" + content + "</p>" +
        "<hr>";

    for(let i = 0; i < replies.length; i++){
        replies_html = replies_html + getReplyContent(replies[i].user, replies[i].content);
    }

    // replies_html = replies_html + "<input class=\"w3-input w3-border\" type=\"text\" id='postReply' placeholder=\"回复\">";
    // replies_html = replies_html + "<button type=\"button\" onclick='onClickAddReply()' class=\"w3-btn w3-green w3-round w3-margin-top\"" +
    //     "id=\"submitReply\">Submit" +
    //     "</button><hr>";

    replies_div.innerHTML = replies_html;

    let postTitle = document.getElementById("postTitle");
    postTitle.textContent = title;
    $('#postWindow').show();
}

function submitPost() {
    let title = document.getElementById("title").value;
    let content = document.getElementById("content").value;
    if(title.length === 0){
        alert("请输入标题");
        return
    }

    if(content.length === 0){
        alert("内容不能为空");
        return
    }

    let checked = "null";
    for(let i=0;i<document.post.group.length;i++)
    {
        if (document.post.group[i].checked){
            checked = document.post.group[i].value;
        }
    }

    addPost(title, content, checked);
    document.getElementById("formWindow").style.display = 'none';
}