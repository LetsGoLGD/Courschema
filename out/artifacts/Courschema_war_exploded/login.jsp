<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>SUSTech Courschema System</title>
    <link rel="stylesheet" type="text/css" href="login.css"/>
    <script language="javascript">
        function alertMessage(str) {
            if(str != null){
                alert(String);
            }
        }
    </script>
</head>
<body>
<form action="LoginServlet" method="post">
<div>
    <img src="logo1.png" alt="logo1" width=15%/>
</div>

<div id="logo2">
    <img src="logo2.png" alt="logo2" width="9%"/>
</div>

<div id="main">
    <form name="form1">
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
<%--        <%=request.getAttribute("msg")%>--%>

    </form>
</div>
</form>
</body>
</html>