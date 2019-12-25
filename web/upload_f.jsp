<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upload</title>
    <!--    <link rel="stylesheet" type="text/css" href="css/upload.css"/>-->
    <script src="scripts/jquery-3.4.1.min.js"></script>
    <script src="scripts/schema.js"></script>
    <script src="scripts/upload.js"></script>
    <script src="scripts/jquery.tabletojson.min.js"></script>
    <script src="scripts/xlsx.full.min.js"></script>


    <!--    <script src="/scripts/jBox.all.min.js"></script>-->
    <!--    <link href="/css/jBox.all.min.css" rel="stylesheet">-->
    <script src="scripts/jquery.validate.min.js"></script>
    <link rel="stylesheet" href="css/w3.css">


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
        <p class="w3-margin-right"><b>Hello!<%=(String)session.getAttribute("username")%></b></p>
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
    <!--    <div class="w3-bar w3-teal w3-center">-->
    <!--        <a class="w3-bar-item w3-button w3-xlarge" id="uploadByForm">Upload by Form</a>-->
    <!--        <a class="w3-bar-item w3-button w3-xlarge" id="uploadByFile">Upload by File</a>-->
    <!--    </div>-->
    <div class="w3-container" id="formUpload">
        <div class="w3-right">
            <button type="button" class="w3-btn w3-teal w3-margin w3-round" id="uploadFileButton"
                    onclick="$('#uploadFileWindow').show()">Upload File
            </button>
            <button type="button" class="w3-btn w3-teal w3-margin w3-round" id="saveAsJson">
                Save as json
            </button>
            <button type="button" class="w3-btn w3-teal w3-margin w3-round" id="saveAsExcel">
                Save as excel
            </button>
        </div>
        <table id="table" class="w3-margin w3-table-all w3-centered">
            <tbody>
            <tr>
                <th>Course Name(English)</th>
                <th>Course Name(中文)</th>
                <th>Major</th>
<!--                <th>Credits</th>-->
<!--                <th>Teacher Name</th>-->
                <th>Delete</th>
            </tr>
            </tbody>
        </table>

        <div class="w3-center">
            <button type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="addButton">
                <span>Add a course</span>
            </button>
            <button type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="submuitButton">Submit
            </button>

        </div>

        <div class="w3-modal" id="uploadFileWindow">
            <div class="w3-modal-content w3-animate-bottom">
                <br>
                <br>
                <span onclick="$('#uploadFileWindow').hide()"
                      class="w3-button w3-xlarge w3-hover-red w3-display-topright">&times;</span>
                <div class="w3-margin">
                    <input type="file" id="imFile"
                           accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel"/>
                    <button type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="addByJson" onclick="jsonToTable()">Upload
                    </button>
<!--                    <input type="file" class="w3-input w3-padding" onchange="importFile(event)" id="fileUpload"-->
<!--                           accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel">-->
<!--                    <input type="button" class="w3-center w3-btn w3-green w3-margin w3-round"-->
<!--                           id="submitFileUpload" value="upload">-->
                    <!--                    </input>-->
                </div>


                <br>

            </div>
        </div>
        <div class="w3-modal" id="formWindow">
            <div class="w3-modal-content w3-animate-bottom">
                <br>
                <span onclick="$('#formWindow').hide()"
                      class="w3-button w3-xlarge w3-hover-red w3-display-topright">&times;</span>
                <form id="form">
                    <div class="w3-margin">
                        Course Name(English):
                        <input type="text" class="w3-input" name="courseNameEn">
                    </div>
                    <div class="w3-margin">
                        Course Name(中文):
                        <input type="text" class="w3-input" name="courseNameZh">
                    </div>
                    <div class="w3-margin">
                        Major:
                        <select class="w3-select" name="major">
                            <option value="" disabled selected>Choose Major Names</option>
                            <option value="0">CS</option>
                            <option value="1">Math</option>
                            <option value="2">Physics</option>
                            <option value="3">Chemistry</option>
                            <option value="4">Biology</option>
                        </select>
                    </div>
                </form>
                <button type="button" class="w3-btn w3-green w3-margin w3-round"
                        id="submitFormButton">Submit
                </button>
                <button type="button" class="w3-btn w3-green w3-margin w3-round"
                id="resetButton">Reset
                </button>
                <button onclick="$('#formWindow').hide()" type="button"
                        class="w3-btn w3-red w3-round w3-margin w3-right" id="exitFormButton">Close
                </button>
                <!--                <button type="reset" class="w3-btn w3-yellow w3-round w3-margin w3-right" id="resetFormButton">Reset-->
                <!--                </button>-->


            </div>
        </div>
    </div>
    <!--    <div class="w3-container" id="fileUpload" style="display:none">-->
    <!--        <div id="c">-->

    <!--            <table class="w3-display-right w3-table-all">-->
    <!--                <tbody>-->
    <!--                <th>File name</th>-->
    <!--                <th>Upload time</th>-->
    <!--                <th>File size</th>-->
    <!--                <tr style="display: none">-->
    <!--                    <td></td>-->
    <!--                    <td></td>-->
    <!--                    <td></td>-->
    <!--                </tr>-->
    <!--                </tbody>-->
    <!--            </table>-->
    <!--        </div>-->

    <!--    </div>-->
</div>
</body>

</html>