<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>SUSTech Courschema System</title>
    <link rel="stylesheet" type="text/css" href="css/login.css"/>
    <link rel="stylesheet" href="css/w3.css">

</head>
<body>
<form action="LoginServlet" method="post">
<div class="w3-bar w3-teal w3-display-container">
    <div class="w3-bar-item ">
        <a href="https://www.sustech.edu.cn/">
            <img src="assert/schoolLogo.png" alt="SUSTech" style="height: 80px;">
        </a>
    </div>
</div>

<div id="main">
    <form name="form1">
        <div class="w3-display-topmiddle w3-center" style="margin-top: 100px;">
            <img src="assert/schoolLogo2.png" alt="SUSTech">
            <div class="input-container">
                <input type="text" id="input" placeholder="text" name="username">
                <label for="input">Username</label>
                <div class="bottom-line"></div>
            </div>

            <div class="input-container">
                <input type="password" id="input2" placeholder="password" name="password">
                <label for="input2">Password</label>
                <div class="bottom-line"></div>
            </div>
            <div id ="btn">
                <input type="submit" id="add" value="Login"><br>
            </div>
        </div>

    </form>
</div>
</form>
</body>

</html>