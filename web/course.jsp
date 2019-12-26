<%@ page import="bean.CourseBean" %>
<%@ page import="java.util.List" %>
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
<%--    <a href="upload_f.jsp" class="w3-bar-item w3-button">上传课程</a>--%>
    <!--TODO: Q&A model to add-->
    <a href="PostServlet" class="w3-bar-item w3-button">论坛</a>
</div>


<div style="margin-left:20%; margin-top:80px;margin-right:20%">
    <div>
        <form action="AdjustServlet" method="post">
            <div class="w3-left w3-margin">
                <select class="w3-select" name="year" id="yearSelector">
                    <option disabled selected><%=request.getSession().getAttribute("year")
                            !=null?request.getSession().getAttribute("year"):"--"%></option>
                    <option value="2019">2019</option>
                    <option value="2018">2018</option>
                    <option value="2017">2017</option>
                    <option value="2016">2016</option>

                </select>
            </div>

            <div class="w3-left w3-margin">
                <select class="w3-select" name="plan" id="planSelector">
                    <option disabled selected><%=request.getSession().getAttribute("plan")
                            !=null?(((String)request.getSession().getAttribute("plan")).charAt(0)+
                            "+"+((String) request.getSession().getAttribute("plan")).charAt(1)):"--"%></option>
                    <option value="22">2+2</option>
                    <option value="13">1+3</option>
                </select>
            </div>

            <div class="w3-left w3-margin">
                <select class="w3-select" name="department" id="departmentSelector">
                    <option disabled selected><%=request.getSession().getAttribute("department")
                            !=null?request.getSession().getAttribute("department"):"--"%></option>
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
                    <span>提交</span>
                </button>
            </div>
        </form>


<%--        <div class="w3-right">--%>
<%--            <button type="button" class="w3-btn w3-white w3-border w3-border-blue w3-round" id="addButton">--%>
<%--                <span>新增课程</span>--%>
<%--            </button>--%>

<%--        </div>--%>
    </div>
    <div class="w3-container">

        <table id="courseTable" class="w3-margin w3-table-all w3-centered">
            <thead>
            <tr>
                <th>课程名</th>
                <th>学分</th>
                <th>开课学期</th>
                <th>开课院系</th>
                <th>先修要求</th>
                <th>添加</th>
                <th>删除</th>
<%--                <th>修改</th>--%>
            </tr>
            </thead>
            <tbody>
            <%
                List<CourseBean> list = (List<CourseBean>) request.getSession().getAttribute("List");
                if (list != null && list.size() > 0) {
                    for (int i=0;i<list.size();i++) {
            %>
            <tr>
                <td><%=list.get(i).getName()+"("+list.get(i).getCode()+")"%></td>
                <td><%=list.get(i).getCredit() %></td>
                <td><%=list.get(i).getOpen_time() %></td>
                <td><%=list.get(i).getMajor() %></td>
                <td><%=list.get(i).getPre() %></td>
                <td><button type='submit' class='w3-btn w3-green w3-round' onclick="location.href=
                        'DeleteServlet?id=<%=list.get(i).getId()%>&&Planid=<%=list.get(i).getPlanNum()%>'">添加</button></td>
                <td><button type='submit' class='w3-btn w3-red w3-round' onclick="location.href=
                        'DeleteServlet?id=<%=list.get(i).getId()%>&&Planid=<%=list.get(i).getPlanNum()%>'">删除</button></td>
<%--                <td><button type='button' class='w3-btn w3-orange w3-round' onclick='adjustCourseInfo(this)'>修改</button></td>--%>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="6">请先选择培养方案</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>

        <form action="AddServlet" method="post">
        <div class="w3-modal" id="formWindow">
            <div class="w3-modal-content w3-animate-bottom ">
                <div class="w3-container" id="otherInfo">
                    <br>
                    <span onclick="$('#formWindow').hide()"
                          class="w3-button w3-xlarge w3-hover-red w3-display-topright">&times;</span>
                    <form id="form">
                        <div class="w3-margin">
                            课程名:
                            <input type="text" class="w3-input" name="courseName" id="courseName">
                        </div>
                        <div class="w3-margin">
                            课程别名:
                            <input type="text" class="w3-input" name="shortName" id="shortName">

                        </div>
                        <div class="w3-margin">
                            学分数:
                            <select class="w3-select" name="credit">
                                <option disabled selected>--</option>
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                            </select>
                        </div>
                        <div class="w3-margin">
                            建议修读学期:
                            <select class="w3-select" name="semester">
                                <option disabled selected>--</option>
                                <option value="1">大一上</option>
                                <option value="2">大一下</option>
                                <option value="3">大二上</option>
                                <option value="4">大二下</option>
                                <option value="5">大三上</option>
                                <option value="6">大三下</option>
                                <option value="7">大四上</option>
                                <option value="8">大四下</option>
                            </select>
                        </div>
                        <div class="w3-margin">
                            课程类别:
                            <select class="w3-select" name="major">
                                <option disabled selected>--</option>
                                <option value="1">专业先修</option>
                                <option value="2">专业选修</option>
                                <option value="3">专业核心课</option>
                            </select>
                        </div>


                        <table id="preCourseTable" class="w3-table-all">
                            <thead>
                            <tr>
                                <td>先修课1</td>
                                <td>先修课2</td>
                                <td>先修课3</td>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class='w3-margin'>

                                <td><input type='text' class='preCourse' name='pc1'></td>
                                <td><input type='text' class='preCourse' name='pc2'></td>
                                <td><input type='text' class='preCourse' name='pc3'></td>

                            </tr>
                            </tbody>
                        </table>
                    </form>


                    <button type="submit" class="w3-btn w3-green w3-margin w3-round w3-right"
                            id="submitButton">提交
                    </button>
                </div>
            </div>
        </div>
        </form>
    </div>


</div>
</body>
</html>