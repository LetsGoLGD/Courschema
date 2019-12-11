<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upload</title>
<!--    <link rel="stylesheet" type="text/css" href="css/upload.css"/>-->
    <script src="scripts/jquery-3.4.1.min.js"></script>
    <script src="scripts/schema.js"></script>
    <script src="scripts/upload_new.js"></script>
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
        <p class="w3-margin-right"><b>Hello!<%=(String)session.getAttribute("username")%></b></p>
        <a href="login.jsp" class="w3-margin-right">
            <!--TODO: do something to stop the login in backend?-->
            <button class="w3-btn w3-white w3-border w3-border-blue w3-round ">Log out</button>
        </a>
    </div>
</div>
<button class="w3-button w3-left w3-xlarge" onclick="w3_open()">☰</button>


<div class="w3-sidebar w3-bar-block w3-border-right" style="display:none" id="mySidebar">
    <h3 class="w3-bar-item">Menu</h3>
    <button onclick="w3_close()" class="w3-bar-item w3-large">Close &times;</button>
    <a href="ShowServlet" class="w3-bar-item w3-button">Course Schema</a>
    <!--TODO: if current login is not admin, ask to login as admin-->
    <a href="upload.jsp" class="w3-bar-item w3-button">Upload</a>
    <!--TODO: Q&A model to add-->
    <a href="#" class="w3-bar-item w3-button">Q&A</a>
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
                <th>Course Name</th>
                <th>Major</th>
                <th>Credits</th>
                <th>Teacher Name</th>
                <th>Delete</th>
            </tr>
            </tbody>
        </table>

        <div class="w3-center">
            <button type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="addButton">
                <span>Add a course</span>
            </button>
            <button type="submit" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="submuitButton">Submit
            </button>

        </div>

        <div class="w3-modal" id="uploadFileWindow">
            <div class="w3-modal-content w3-animate-bottom">
                <br>
                <br>
                <span onclick="$('#uploadFileWindow').hide()"
                      class="w3-button w3-xlarge w3-hover-red w3-display-topright">&times;</span>
                <div class="w3-margin">
                    <input type="file" class="w3-input w3-padding">
                </div>
                <div class="w3-center">
                    <button type="button" class="w3-btn w3-green w3-margin w3-round"
                            id="submitFileUpload">upload
                    </button>
                </div>
                <br>

            </div>
        </div>
        <div class="w3-modal" id="formWindow">
            <div class="w3-modal-content w3-animate-bottom">
                <br>
                <span onclick="document.getElementById('formWindow').style.display='none'"
                      class="w3-button w3-xlarge w3-hover-red w3-display-topright">&times;</span>
                <form id="form">
                    <div class="w3-margin">
                        Course Name:
                        <input type="text" class="w3-input" name="courseName">
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
                    <div class="w3-margin">
                        Credits:
                        <select class="w3-select" name="credit">
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
                        Teacher:
                        <input class="w3-input" name="teacher">
                    </div>

                </form>
                <button type="submit" class="w3-btn w3-green w3-margin w3-round"
                        id="submitFormButton">Submit
                </button>
                <button onclick="document.getElementById('formWindow').style.display='none'" type="button"
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