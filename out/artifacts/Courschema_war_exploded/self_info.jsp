<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bean.CourseBean" %>
<%@ page import="java.util.List" %>
<html>
<!--<!DOCTYPE html>-->
<!--<html lang="en">-->
<head>
    <link rel="stylesheet" href="css/self_info.css">
    <meta charset="utf-8">
    <title>CourseSchema</title>
    <script type="text/javascript" src="scripts/self_info.js"></script>
    <script src="scripts/jquery-3.4.1.min.js"></script>
    <script src="scripts/schema.js"></script>
    <script src="scripts/jquery.tablesorter.min.js"></script>
</head>
<body onload="load()">
<!--创建body的时候加载load，设置个人信息和修过的课程-->
<div class="w3-bar w3-teal w3-display-container">
    <div class="w3-bar-item ">
        <a href="https://www.sustech.edu.cn/">
            <img src="assert/schoolLogo.png" alt="SUSTech" style="height: 80px;">
        </a>
    </div>
    <div class="w3-bar-item w3-display-right" style="display: flex; align-items:center">
        <p class="w3-margin-right"><b>Hello!<%=(String)session.getAttribute("username")%></b></p>
        <a href="login.jsp" class="w3-margin-right">
            <!--TODO: do something to stop the login in backend?-->
            <button class="w3-btn w3-white w3-border w3-border-blue w3-round ">Log out</button>
        </a>
    </div>
</div>
<button class="w3-button w3-left w3-xlarge" onclick="$('#mySidebar').show()">☰</button>


<div class="w3-sidebar w3-bar-block w3-border-right" style="display:none" id="mySidebar">
    <h3 class="w3-bar-item">Menu</h3>
    <button onclick="$('#mySidebar').hide()" class="w3-bar-item w3-large">Close &times;</button>
    <a href="schema.jsp" class="w3-bar-item w3-button">Course Schema</a>
    <!--TODO: if current login is not admin, ask to login as admin-->
    <a href="course.jsp" class="w3-bar-item w3-button">Adjust Course Schema</a>
    <a href="upload.html" class="w3-bar-item w3-button">Upload</a>
    <!--TODO: Q&A model to add-->
    <a href="#" class="w3-bar-item w3-button">Q&A</a>
</div>


<div style="margin-left:20%; margin-top:60px;margin-right:20%">
    <div id="block1">
        <div class="info">
            <img class="img" src="assert/self1.png">
            <div>Personal Information</div>
        </div>

        <div class="info">
            <span id="name">Name: </span><br/>
            <span id="uid">UID: </span><br/>
            <span id="gender">Gender: </span><br/>
            <span id="grade">Grade: </span><br/>
            <span id="major">Major: </span><br/>
            <span id="college">College: </span>
        </div>
    </div>
    <div id="block2">
        <div class="info">
            <img class="img" src="assert/self2.png" >
            <div>Courses Taken</div>
        </div>

        <div id="course">
        </div>
    </div>

</div>
</body>
</html>
