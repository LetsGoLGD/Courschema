<%@ page import="bean.CourseBean" %>
<%@ page import="java.util.List" %>
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


<div style="margin-left:20%; margin-top:80px;margin-right:20%">
    <form action="ShowServlet" method="post">
    <div>
        <div class="w3-left w3-margin">
            <select class="w3-select" name="year">
                <option disabled selected><%=(String) request.getSession().getAttribute("year")!=null?
                        (String) request.getSession().getAttribute("year"):"--"%></option>
                <option value="2019">2019</option>
                <option value="2018">2018</option>
                <option value="2017">2017</option>
                <option value="2016">2016</option>

            </select>
        </div>

        <div class="w3-left w3-margin">
            <select class="w3-select" name="plan">
                <option disabled selected><%=(String) request.getSession().getAttribute("plan")!=null?
                        (((String) request.getSession().getAttribute("plan")).charAt(0)+"+"
                        +((String) request.getSession().getAttribute("plan")).charAt(1)):"--"%></option>
                <option value="22">2+2</option>
                <option value="13">1+3</option>
            </select>
        </div>

        <div class="w3-left w3-margin">
            <select class="w3-select" name="department">
                <option disabled selected><%=(String) request.getSession().getAttribute("department")!=null?
                        (String) request.getSession().getAttribute("department"):"--"%></option>
                <option value="CS">CS</option>
                <option value="MA">MA</option>
                <option value="BO">BO</option>
                <option value="EL">EL</option>
                <option value="PH">PH</option>
                <option value="FI">FI</option>
            </select>
        </div>

        <div class="w3-left w3-margin">
            <!--            <i id="refreshButton" class="w3-button fa fa-refresh w3-round-xxlarge w3-center"></i>-->
            <button type="submit" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="SubmitFilter">
                <span>Submit</span>
            </button>
        </div>



    </div>
    </form>
    <%
        List<CourseBean> list = (List<CourseBean>) request.getAttribute("List");
    %>
    <table class="tablesorter w3-centered" id="schemaTable">
        <thead>
        <!--TODO: connect with database-->
        <tr>
            <th>Course Name</th>
            <th>Course ID</th>
            <th>Credits</th>
            <th>Recommend Semester</th>
            <th>Course department</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (list != null && list.size() > 0) {
                for (int i=0;i<list.size();i++) {
        %>
        <tr>
            <td><%=list.get(i).getName()%></td>
            <td><%=list.get(i).getCode()%></td>
            <td><%=list.get(i).getCredit() %></td>
            <td><%=list.get(i).getAd_year() %></td>
            <td><%=list.get(i).getMajor() %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6">can not get infomation</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>


</body>
</html>
