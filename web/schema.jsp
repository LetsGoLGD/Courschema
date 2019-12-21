<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <title>CourseSchema</title>
    <link rel="stylesheet" href="css/w3.css">
    <link rel="stylesheet" href="css/theme.default.min.css">
    <script src="scripts/jquery-3.4.1.min.js"></script>
    <script src="scripts/schema.js"></script>
    <script src="scripts/jquery.tablesorter.min.js"></script>

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
    <h3 class="w3-bar-item">Menu</h3>
    <button onclick="$('#mySidebar').hide()" class="w3-bar-item w3-large">Close &times;</button>
    <a href="schema.jsp" class="w3-bar-item w3-button">Course Schema</a>
    <!--TODO: if current login is not admin, ask to login as admin-->
    <a href="course.jsp" class="w3-bar-item w3-button">Adjust Course Schema</a>
    <a href="upload_f.jsp" class="w3-bar-item w3-button">Upload</a>
    <!--TODO: Q&A model to add-->
    <a href="#" class="w3-bar-item w3-button">Q&A</a>
</div>


<div style="margin-left:20%; margin-top:80px;margin-right:20%">

    <div>
        <div class="w3-left w3-margin">
            <select class="w3-select" name="year">
                <option disabled selected>--</option>
                <option value="2019">2019</option>
                <option value="2018">2018</option>
                <option value="2017">2017</option>
                <option value="2016">2016</option>

            </select>
        </div>

        <div class="w3-left w3-margin">
            <select class="w3-select" name="plan">
                <option disabled selected>--</option>
                <option value="2+2">2+2</option>
                <option value="1+3">1+3</option>
            </select>
        </div>

        <div class="w3-left w3-margin">
            <select class="w3-select" name="department">
                <option disabled selected>--</option>
<!--                Add from database-->
                <option value="0"></option>
                <option value="1"></option>
            </select>
        </div>

        <div class="w3-left w3-margin">
            <!--            <i id="refreshButton" class="w3-button fa fa-refresh w3-round-xxlarge w3-center"></i>-->
            <button type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="SubmitFilter">
                <span>Submit</span>
            </button>
        </div>



    </div>
    <table class="tablesorter w3-centered" id="schemaTable">
        <thead>
        <!--TODO: connect with database-->
        <tr>
            <th>Course Name</th>
            <th>Course ID</th>
            <th>Credits</th>
            <th>Recommend Semester</th>
            <th>Department</th>
        </tr>
        </thead>
        <tbody>
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
    <!--    <div class="w3-border w3-display-right w3-margin" style="width: 17%;">-->
    <!--        <h3 class="w3-tag w3-round w3-green w3-border w3-border-white">Falcon Ridge Parkway</h3>-->
    <!--        <div class="w3-panel w3-yellow w3-topbar w3-bottombar w3-border-amber">-->
    <!--            <p>London is the most populous city in the United Kingdom,-->
    <!--                with a metropolitan area of over 9 million inhabitants.</p>-->
    <!--        </div>-->
    <!--    </div>-->
</div>


</body>
</html>
