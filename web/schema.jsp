<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <meta charset="utf-8">
    <title>CourseSchema</title>
    <script type="text/javascript" src="scripts/test.js"></script>
</head>
<body>

<div class="w3-bar w3-teal w3-display-container">
    <div class="w3-bar-item ">
        <img src="assert/schoolLogo.png" alt="SUSTech" style="height: 80px;">
    </div>
    <div class="w3-bar-item w3-display-right" style="display: flex; align-items:center">
        <!--TODO: username from backend-->
        <p class="w3-margin-right"><b>Hello! Username</b></p>
        <a href="login.jsp" class="w3-margin-right">
            <!--TODO: do something to stop the login in backend?-->
            <button class="w3-btn w3-white w3-border w3-border-blue w3-round ">Logout</button>
        </a>
    </div>

</div>
<button class="w3-button w3-left w3-xlarge" onclick="w3_open()">☰</button>


<div class="w3-sidebar w3-bar-block w3-border-right" style="display:none" id="mySidebar">
    <h3 class="w3-bar-item">Menu</h3>
    <button onclick="w3_close()" class="w3-bar-item w3-large">Close &times;</button>
    <!--TODO: ADD link here-->
    <a href="#" class="w3-bar-item w3-button">Link 1</a>
    <a href="#" class="w3-bar-item w3-button">Link 2</a>
    <a href="#" class="w3-bar-item w3-button">Link 3</a>
</div>


<div style="margin-left:20%; margin-top:80px;margin-right:20%">
    <!--    <div>-->
    <!--        <div class="w3-panel w3-amber">-->
    <!--            <h3 class="w3-opacity">-->
    <!--                <b>Preview</b></h3>-->
    <!--        </div>-->
    <!--        &lt;!&ndash;TODO: this picture is only for test, we will remove it after release newer version&ndash;&gt;-->
    <!--        <img src="assert/test.png" alt="this is only for test" class="w3-border">-->
    <!--    </div>-->

    <div class="w3-bar w3-teal" style="background-color: rgb(0,63,67);align-items:center">
        <div></div>
        <div class="w3-dropdown-hover">
            <button class="w3-button">Dropdown1</button>
            <div class="w3-dropdown-content w3-bar-block w3-card-4">
                <!--TODO: ADD link here-->
                <a href="#" class="w3-bar-item w3-button">Link 1</a>
                <a href="#" class="w3-bar-item w3-button">Link 2</a>
                <a href="#" class="w3-bar-item w3-button">Link 3</a>
            </div>
        </div>
        <div class="w3-dropdown-hover">
            <button class="w3-button">Dropdown2</button>
            <div class="w3-dropdown-content w3-bar-block w3-card-4">
                <!--TODO: ADD link here-->
                <a href="#" class="w3-bar-item w3-button">Link 1</a>
                <a href="#" class="w3-bar-item w3-button">Link 2</a>
                <a href="#" class="w3-bar-item w3-button">Link 3</a>
            </div>
        </div>
        <div class="w3-dropdown-hover">
            <button class="w3-button">Dropdown3</button>
            <div class="w3-dropdown-content w3-bar-block w3-card-4">
                <!--TODO: ADD link here-->
                <a href="#" class="w3-bar-item w3-button">Link 1</a>
                <a href="#" class="w3-bar-item w3-button">Link 2</a>
                <a href="#" class="w3-bar-item w3-button">Link 3</a>
            </div>
        </div>
    </div>
    <div class="w3-bar w3-teal w3-topbar">
        <div class="w3-bar-item w3-hover-red">Required</div>
        <div class="w3-bar-item w3-hover-green">Elective</div>
        <div class="w3-bar-item w3-hover-blue">Core</div>
    </div>
    <div>

    </div>

    <table class="w3-table-all w3-centered">
        <tbody>
        <!--TODO: connect with database-->
        <tr>
            <th>Course Name</th>
            <th>Course ID</th>
            <th>Credits</th>
            <th>Recommend Semester</th>
            <th>Department</th>
        </tr>
        <tr>
            <td>OOAD</td>
            <td>CS309</td>
            <td>3</td>
            <td>5</td>
            <td>Computer Science</td>
        </tr>
        <tr>
            <td>OOAD</td>
            <td>CS309</td>
            <td>3</td>
            <td>5</td>
            <td>Computer Science</td>
        </tr>
        <tr>
            <td>OOAD</td>
            <td>CS309</td>
            <td>3</td>
            <td>5</td>
            <td>Computer Science</td>
        </tr>
        <tr>
            <td>OOAD</td>
            <td>CS309</td>
            <td>3</td>
            <td>5</td>
            <td>Computer Science</td>
        </tr>
        <tr>
            <td>OOAD</td>
            <td>CS309</td>
            <td>3</td>
            <td>5</td>
            <td>Computer Science</td>
        </tr>
        <tr>
            <td>OOAD</td>
            <td>CS309</td>
            <td>3</td>
            <td>5</td>
            <td>Computer Science</td>
        </tr>
        <tr>
            <td>OOAD</td>
            <td>CS309</td>
            <td>3</td>
            <td>5</td>
            <td>Computer Science</td>
        </tr>
        <tr>
            <td>OOAD</td>
            <td>CS309</td>
            <td>3</td>
            <td>5</td>
            <td>Computer Science</td>
        </tr>
        <tr>
            <td>OOAD</td>
            <td>CS309</td>
            <td>3</td>
            <td>5</td>
            <td>Computer Science</td>
        </tr>
        <tr>
            <td>OOAD</td>
            <td>CS309</td>
            <td>3</td>
            <td>5</td>
            <td>Computer Science</td>
        </tr>
        <tr>
            <td>OOAD</td>
            <td>CS309</td>
            <td>3</td>
            <td>5</td>
            <td>Computer Science</td>
        </tr>
        </tbody>
    </table>
    <div class="w3-border w3-display-right">
        <span class="w3-tag">Credits requirement</span>
        <p></p>
    </div>
</div>




</body>
</html>
