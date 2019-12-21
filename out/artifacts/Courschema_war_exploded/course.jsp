<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>add_course</title>
    <link rel="stylesheet" href="css/w3.css">
    <link rel="stylesheet" href="css/jquery-ui.min.css">

    <script src="scripts/jquery-3.4.1.min.js"></script>
    <script src="scripts/course.js"></script>
    <script src="scripts/jquery-ui.min.js"></script>
    <script src="scripts/jquery.tabletojson.min.js"></script>
    <script src="scripts/jquery.tablesorter.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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


<div style="margin-left:10%; margin-top:80px;margin-right:10%">
    <!--    <div class="w3-bar w3-teal w3-center">-->
    <!--        <a class="w3-bar-item w3-button w3-xlarge" id="uploadByForm">Upload by Form</a>-->
    <!--        <a class="w3-bar-item w3-button w3-xlarge" id="uploadByFile">Upload by File</a>-->

    <!--    </div>-->
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


        <div class="w3-right">
            <button type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="addButton">
                <span>Add a course</span>
            </button>

        </div>
    </div>
    <div class="w3-container">

        <table id="courseTable" class="w3-margin w3-table-all w3-centered">
            <tbody>
            <tr>
                <th>课程名</th>
                <th>学分</th>
                <th>开课学期</th>
                <th>开课院系</th>
                <th>先修要求</th>
                <th>删除</th>
                <th>修改</th>
            </tr>
            </tbody>
        </table>


        <div class="w3-modal" id="formWindow">
            <div class="w3-modal-content w3-animate-bottom ">
                <div class="w3-container" id="otherInfo">
                    <br>
                    <span class="w3-button w3-xlarge w3-hover-red w3-display-topright" id="hideButton">&times;</span>
                    <form id="form" id="otherInfoForm">
                        <div class="w3-margin">
                            课程名:
                            <input type="text" class="w3-input" name="courseName" id="courseName">
                        </div>
<!--                        <div class="w3-margin">-->
<!--                            课程简称:-->
<!--                            <input type="text" class="w3-input" name="shortName" id="shortName">-->
<!--                        </div>-->
                        <div class="w3-margin">
                            学分数:
                            <select class="w3-select" name="credit" id="credit">
                                <option disabled selected>--</option>
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="1.5">1.5</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                            </select>
                        </div>
                        <div class="w3-margin">
                            开课学期:
                            <select class="w3-select" name="semester" id="semester">
                                <option disabled selected>--</option>
                                <option value="春">春</option>
                                <option value="秋">秋</option>
                                <option value="秋/春">秋/春</option>
                            </select>
                        </div>
                        <div class="w3-margin">
                            开课院系:
                            <select class="w3-select" name="department" id="department">
                                <option disabled selected>--</option>
                                <!--TODO: 后端返回数据填充-->
                            </select>
                        </div>


                    </form>
                    <button type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round w3-margin w3-right"
                            id="jumpTo" onclick="$('#otherInfo').hide();$('#preInfo').show()">先修课程选择
                    </button>
                </div>
                <div class="w3-container" id="preInfo" style="display: none">
                    <br>
                    <span onclick="$('#formWindow').hide()"
                          class="w3-button w3-xlarge w3-hover-red w3-display-topright">&times;</span>
                    <button type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round w3-margin w3-left"
                            id="addPreCourseGroup">添加一行

                    </button>
                    <button type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round w3-margin w3-left"
                            id="deletePreCourseGroup">删除选中行

                    </button>
                    <form class="w3-margin" id="preCourseForm">
                        <table id="preCourseTable" class="w3-table-all">
                            <thead>
                            <tr>
                                <td>选中</td>
                                <td>id</td>
                                <td>先修课1</td>
                                <td>先修课2</td>
                                <td>先修课3</td>
<!--                                <td>先修课4</td>-->
                            </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </form>
                    <button type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round w3-margin w3-left"
                            id="jumpToBefore" onclick="$('#preInfo').hide();$('#otherInfo').show()">返回其他信息修改
                    </button>

                    <button type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round w3-margin w3-right"
                            id="submitButton">Submit
                        <!--TODO: submit后提交表单-->
                    </button>
                </div>


            </div>
        </div>
    </div>

</div>
</body>
</html>