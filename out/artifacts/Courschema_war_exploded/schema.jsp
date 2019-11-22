<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bean.CourseBean" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <link rel="stylesheet" href="css/w3.css">
    <meta charset="utf-8">
    <title>CourseSchema</title>
    <script type="text/javascript" src="scripts/schema.js"></script>
    <!--    <script type="text/javascript" src="/scripts/jquery-3.4.1.min.js"></script>-->
<!--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->

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
    <a href="upload_new.jsp" class="w3-bar-item w3-button">Upload</a>
    <!--TODO: Q&A model to add-->
    <a href="#" class="w3-bar-item w3-button">Q&A</a>
</div>


<div style="margin-left:20%; margin-top:80px;margin-right:20%">

    <div class="w3-bar w3-teal w3-center" style="background-color: rgb(0,63,67)">
        <div class="w3-center">
            <div></div>
            <div class="w3-dropdown-hover">
                <button class="w3-button">Year</button>
                <div class="w3-dropdown-content w3-bar-block w3-card-4">
                    <a href="ShowServlet?year=" class="w3-bar-item w3-button">All</a>
                    <a href="ShowServlet?year=2019" class="w3-bar-item w3-button">2019</a>
                    <a href="ShowServlet?year=2018" class="w3-bar-item w3-button">2018</a>
                    <a href="ShowServlet?year=2017" class="w3-bar-item w3-button">2017</a>
                </div>
            </div>
            <div class="w3-dropdown-hover">
                <button class="w3-button">Major</button>
                <div class="w3-dropdown-content w3-bar-block w3-card-4">
                    <a href="ShowServlet?department=" class="w3-bar-item w3-button">All</a>
                    <a href="ShowServlet?department=CS" class="w3-bar-item w3-button">Computer Science</a>
                    <a href="ShowServlet?department=MA" class="w3-bar-item w3-button">Math</a>
                    <a href="ShowServlet?department=BO" class="w3-bar-item w3-button">Biology</a>
                </div>
            </div>
            <div class="w3-dropdown-hover">
                <button class="w3-button">Plan</button>
                <div class="w3-dropdown-content w3-bar-block w3-card-4">
                    <a href="ShowServlet?plan=" class="w3-bar-item w3-button">All</a>
                    <a href="ShowServlet?plan=2" class="w3-bar-item w3-button">2+2</a>
                    <a href="ShowServlet?plan=1" class="w3-bar-item w3-button">1+3</a>
                </div>
            </div>
            <div class="w3-dropdown-hover">
                <button class="w3-button">Course Type</button>
                <div class="w3-dropdown-content w3-bar-block w3-card-4">
                    <a href="ShowServlet?type=" class="w3-bar-item w3-button">All</a>
                    <a href="ShowServlet?type=1" class="w3-bar-item w3-button">Compulsory</a>
                    <a href="ShowServlet?type=2" class="w3-bar-item w3-button">Elective</a>
                    <a href="ShowServlet?type=3" class="w3-bar-item w3-button">Core</a>
                </div>
            </div>
        </div>

<!--        <div class="w3-right w3-padding" style="display: flex">-->
<!--            <i class="fa fa-search"></i>-->
<!--            &lt;!&ndash;TODO: Search&ndash;&gt;-->
<!--            <form class="w3-container">-->
<!--                <label>-->
<!--                    <input class="w3-input" type="text">-->
<!--                </label>-->
<!--            </form>-->
<!--        </div>-->
    </div>
    <%
        List<CourseBean> list = (List<CourseBean>) request.getAttribute("List");
    %>
    <table class="w3-table-all w3-centered">
        <tbody>
        <tr>
            <th>Year</th>
            <th>Course ID</th>
            <th>Course Name</th>
            <th>Credit</th>
            <th>Period</th>
            <th>Plan</th>
            <th>Attribute</th>
        </tr>
        <%
            if (list != null && list.size() > 0) {
                for (int i=0;i<list.size();i++) {
        %>
        <tr>
            <td><%=list.get(i).getYear()%></td>
            <td><%=list.get(i).getCode()%></td>
            <td><%=list.get(i).getName()%></td>
            <td><%=list.get(i).getCredit() %></td>
            <td><%=list.get(i).getPeriod() %></td>
            <td><%=list.get(i).getPlanOrder()%></td>
            <td><%=list.get(i).getAttr()%></td>
<%--            <td><a href="someServlet?id=<%=list.get(i).getId()%>">Info</a></td>--%>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6">404 NOT FOUND</td>
        </tr>
        <%
            }
        %>
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
