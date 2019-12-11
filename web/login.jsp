<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>SUSTech Courschema System</title>
    <link rel="stylesheet" type="text/css" href="css/login.css"/>
    <link rel="stylesheet" href="css/w3.css">
    <script type="text/javascript" src="scripts/login.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2.3.2/dist/email.min.js"></script>
    <script type="text/javascript">
        (function(){
            emailjs.init("user_CIefGPKiP4OyNJU4qnzZg");
        })();
    </script>
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
<div class="w3-display-topmiddle w3-center" style="margin-top: 640px;">
    <div id="btn2">
        <input onclick="document.getElementById('id01').style.display='block'" type="submit" id="add" value="Forget Password?"><br>
    </div>
</div>


<div id="id01" class="w3-modal">
    <span onclick="document.getElementById('id01').style.display='none'" class="w3-closebtn w3-hover-red w3-container w3-padding-16 w3-display-topright w3-xxlarge">×</span>
    <div class="w3-modal-content w3-card-8 w3-animate-zoom" style="max-width:600px">
        <div class="w3-container">
            <div class="w3-section">
                <form target="iframe">
                    <label><b>Email Address</b></label>
                    <input name="email-address" class="w3-input w3-border w3-hover-border-black" type="text" placeholder="Enter Email">
                    <button onclick="onClickSendEmail()" class="w3-btn w3-btn-block w3-green w3-section w3-margin-bottom">Send Email</button><br>
                </form>
                <iframe id="iframe" name="iframe" style="display:none;"></iframe>
            </div>
        </div>

        <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
            <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-btn w3-red">Cancel</button>
        </div>

    </div>
</div>

<div id="id02" class="w3-modal">
    <span onclick="document.getElementById('id02').style.display='none'" class="w3-closebtn w3-hover-red w3-container w3-padding-16 w3-display-topright w3-xxlarge">×</span>
    <div class="w3-modal-content w3-card-8 w3-animate-zoom" style="max-width:600px">
        <div class="w3-container">
            <div class="w3-section">
                <form target="iframe">
                    <label><b>Verify Code</b></label>
                    <input class="w3-input w3-border w3-hover-border-black w3-margin-bottom" type="text" placeholder="Enter code">
                    <label><b>New Password</b></label>
                    <input class="w3-input w3-border w3-hover-border-black" type="text" placeholder="Enter Password">
                    <button onclick="" class="w3-btn w3-btn-block w3-green w3-section">Change Password</button>
                </form>
            </div>
        </div>

        <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
            <button onclick="document.getElementById('id02').style.display='none'" type="button" class="w3-btn w3-red">Cancel</button>
        </div>
    </div>
</div>

</body>
</html>