<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upload</title>
    <link rel="stylesheet" type="text/css" href="upload.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link href="https://cdn.bootcss.com/bootstrap-select/1.12.1/css/bootstrap-select.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-select/1.12.1/js/bootstrap-select.min.js"></script>
    <script src="scripts/test.js"></script>

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

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


    <div id="b">
        <h2>Upload by Form</h2>
    </div>

    <form style="text-align: center">

        <div id="forms">
            <span id="oneform">
                <div class="w3-margin">

                    Course name: <input type="text" class="course_name">
                    Major:
                    <span id="mul">
                        <select class="selectpicker show-menu-arrow form-control" multiple>
                            <option value="0">CS</option>
                            <option value="1">Math</option>
                            <option value="2">Physics</option>
                            <option value="3">Chemistry</option>
                            <option value="4">Biology</option>
                        </select>
                    </span>
                    Credits:
                    <select class="credit">
                        <option>--</option>
                        <option>1</option>
                        <option>1.5</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                    </select>
                    Course hours: <input type="number" class="course_number">
                    Teacher name: <input type="text" class="tname"><br>
                    <!--<button class="del_form">Delete this course</button>-->
                </div>
            </span>

        </div>
        <button type="button" onclick="add_form()"><span>Add a course</span></button>
        <button type="submit">Submit</button>
    </form>

    <div id="c">
        <h2>Upload by File</h2>
    </div>

    <div id="a">
        <h3>Upload Record</h3>
    </div>

    <div id="ta">
        <table id="table-1">
            <thead>
                <th>File name</th>
                <th>Upload time</th>
            </thead>
            <tbody id="tbody" style="display: none">
                <tr>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div id="background" class="back">
        <form name="form1" id="form" method="post" enctype="multipart/form-data">
            <input type="file" id="file" name="file" style="display:none" onchange="upload()">
            <input type="submit" id="submit" name="submit" style="display:none">
            <span id="prompt">Please choose a schema to upload from your computer.</span><br>
            <button type="button" id="sub" onclick="choose()"><span>Choose file</span></button>
        </form>
    </div>

    <script type="text/javascript" src="upload.js"></script>
</body>

</html>