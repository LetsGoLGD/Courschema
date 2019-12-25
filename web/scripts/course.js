// generate a full text to display in page
function preCourseJsonToText(json) {
    var obj = JSON.parse(json);
    // var obj = {};
    // var obj = {"preCourseGroups": [{"preCourses": []}]};
    // console.log(obj.preCourseGroups.length);
    // console.log(obj.preCourseGroups[0].preCourses.length);

    var text = "";
    if (!obj || !obj.preCourseGroups || obj.preCourseGroups.length < 1) {
        console.log("no pre course");
        return "no pre course";
    }
    var name, shortName, id;
    for (var i = 0; i < obj.preCourseGroups.length; i++) {
        text += "(";
        for (var j = 0; j < obj.preCourseGroups[i].preCourses.length; j++) {
            var preCourse = obj.preCourseGroups[i].preCourses[j];
            if (!preCourse) continue;

            name = preCourse.name;
            shortName = preCourse.shortName;
            id = preCourse.id;
            text += shortName + ":" + name;
            if (j <= obj.preCourseGroups[i].preCourses.length - 2) {
                text += " and ";
            }
        }
        text += ")";
        if (i <= obj.preCourseGroups.length - 2) {
            text += " or ";
        }
    }
    console.log(text);
    return text;
}

function courseInfoToJson() {
    var json = {};
    var preCourseGroups = {};
    var table = $("#preCourseTable");
    for (let i = 0; i < table; i++) {}
    json.preCourseGroups = preCourseGroups;

    $("#preCourseTable").tableToJSON();
}

// to display in modal to modified
function preCourseJsonToTable() {}

function deleteTableLine(nowTr) {
    $(nowTr)
        .parent()
        .parent()
        .remove();
}

function courseInfoToHTML(nowTr) {}

let isAdjust = 0;
let adjustTr;
function adjustCourseInfo(nowTr) {
    $("#formWindow").show();
    isAdjust = 1;
    adjustTr = nowTr;
}

function resetForm() {
    $("#otherInfoForm")[0].reset();
    $("#preCourseForm")[0].reset();
}
$(document).ready(function() {
    // preCourseJsonToText();
    // TODO: use data from database

    var availableTags = [
        "数据结构与算法分析(CS203)",
        "数字逻辑(CS207)",
        "概率论与数理统计(MA212)",
        "数据库原理(CS307)",
        "离散数学(CS201)",
        "计算机组成原理(CS202)",
        "算法设计与分析(CS208)",
        "计算机程序设计基础A(CS102A)",
        "数学分析II(MA102A)",
        "高等数学A下(MA102B)",
        "线性代数A(MA107A)",
        "高等数学A上(MA10B)",
        "大学物理B上(PHY103B)",
        "大学物理B下(PHY105B)",
        "生命科学概论(BIO102B)",
        "普通物理实验(PHY104B)",
        "思想道德修养和法律基础(IPE101)",
        "马克思主义基本原理概论(IPE102)",
        "中国近现代史纲要(IPE103)",
        "毛泽东思想和中国特色社会主义概论(IPE104)",
        "形势与政策(IPE105)",
        "写作与交流(HUM032)",
        "嵌入式系统与微机原理(CS301)",
        "人工智能(CS303)",
        "计算机网络(CS305)",
        "面向对象分析与设计(CS309)",
        "创新实践I(CS321)",
        "计算机科学与技术前沿讲座(CS317)",
        "计算机操作系统(CS302)",
        "软件工程(CS304)",
        "创新实验II(CS326)",
        "计算机科学与技术前沿讲座II(CS318)",
        "创新实践III(CS413)",
        "计算机科学与技术前沿讲座III(CS415)",
        "工业实习(CS470)",
        "毕业论文(CS490)",
        "计算机导论(CS102A)",
        "认知科学导论(CS106)",
        "计算机系统设计及应用A(CS209A)",
        "信号与系统(EE205)",
        "C/C++程序设计(CS205)",
        "时间序列分析(MA309)",
        "数值分析(MA305)",
        "数字信号处理(EE323)",
        "计算机视觉(CS308)",
        "编译原理(CS323)",
        "计算机安全(CS315)",
        "大数据导论(MA333)",
        "数字图像处理(EE326)",
        "数据挖掘(CS306)",
        "深度学习(CS324)",
        "计算机图形学(CS312)",
        " 物联网技术(CS314)",
        "智能机器人(CS401)",
        "信息论与编码(EE411)",
        "密码学与网络安全(CS403)",
        "机器学习(CS405)",
        "高级计算机网络与大数据(CS407)",
        "软件测试(CS409)",
        "高级算法(CS419)",
        "高级人工智能(CS421)",
        "演化计算及应用(CS408)",
        "高级优化算法(CS406)",
        "计算机科学与技术前沿讲座IV(CS402)",
        "军事理论(GE102)",
        "军事技能(GE104)",
        "体育I(GE102)",
        "体育II(GE131)",
        "体育III(GE132)",
        "体育IV(GE133)",
        "体育IV(GE134)",
        "SUSTech english I(CLE021)",
        "SUSTech english II(CLE022)",
        "SUSTech english III(CLE023)",
        "English for Academic Purposes(CLE030)",
        "化学原理B(CH101B)",
        "电路基础(EE104)",
        "Matlab工程应用(ME121)",
        "机器人引论(ME232)",
        "人工智能导论(CS103)",
        "计算机程序设计基础B(CS102B)",
        "材料科学进展(MSE102)",
        "普通生物学实验(BIO104)",
        "基础物理开放实验(PHYS1001)",
        "线性代数精讲(MA109)",
        "综合物理实验(PHY201-15)",
        "综合物理开放实验(PHY221)",
        "数学建模(MA206)",
        "产品设计与工程实现导论(ME111)",
        "CAD与工程制图 (ME102)",
        "制造工程认知实践(ME103)",
        "工程材料-科学工艺与设计(ME261)",
        "材料科学与工程基础(MSE001)",
        "理论力学I-B(MAE203B)",
        "常微分方程B(MA201b)",
        "材料力学(MAE202)",
        "工程流体力学(MAE207)",
        "工程热力学(MAE305)",
        "传热学(MAE308)",
        "机械设计基础(ME303)",
        "控制工程基础(ME307)",
        "动力学与机械振动(ME301)",
        "机械制造基础(ME302)",
        "先进制造实践(ME308)",
        "能源工程基础(ME304)",
        "机器人基础(ME306)",
        "机器人建模和控制(ME331)",
        "精密加工技术(ME407)",
        "测试与检测技术基础(ME310)",
        "创新设计理论与实践(ME405)",
        "增材制造与设计(ME462)",
        "制造系统(ME453)",
        "微机电系统基础(EE306)",
        "嵌入式系统和机器人(ME432)",
        "现代控制与最优估计(ME424)",
        "行走机器人(ME434)",
        "燃料电池技术(ME482)",
        "新能源技术(ME411)",
        "新能源系统(ME483)",
        "材料能源学(MSE334)",
        "能源材料学实验(MSE336)",
        "光伏光热技术导论(MSE320)",
        "专业实践(ME491)",
        "创新创业(ME492)",
        "毕业设计(ME493)",
        "高等图形学与CAD(ME211)",
        "模拟电路(EE201-17)",
        "模拟电路实验(EE201-17L)",
        "生物医学工程概论(BMEM131)",
        " 数字电路(EE202-17)",
        "数字电路实验(EE202-17L)",
        "工程电磁场概论(EE208)",
        "机械设计II(ME312)",
        "复合制造技术前沿(ME355)",
        "现金激光加工与检测技术(ME356)",
        "金属增材制造理论基础(ME361)",
        "微型机器人(ME335)",
        "微观组织表征与分析(ME364)",
        "先进复合材料原理与应用(ME363)"
    ];
    $("#courseName").autocomplete({
        source: availableTags
    });
    $("#addButton").click(function(e) {
        $("#formWindow").show();
    });
    // $('#preCourseTable').delegate('input', 'autocomplete')
    $("#addPreCourseGroup").click(function(e) {
        var newRowNumber = $("#preCourseTable>tbody>tr").length + 1;
        let namePreCourse = "preCourse" + newRowNumber.toString();
        console.log(namePreCourse);
        $("#preCourseTable>tbody").append(
            "<tr class='w3-margin'>" +
            "<td><input type='checkbox' name='preCourseGroupItem' /></td>" +
            "<td>" +
            newRowNumber +
            "</td>" +
            "<td><input type='text' class='preCourse' name=" +
            namePreCourse +
            "></td>" +
            "<td><input type='text' class='preCourse' name=" +
            namePreCourse +
            "></td>" +
            "<td><input type='text' class='preCourse' name=" +
            namePreCourse +
            "></td>" +
            // "<td><input type='text' class='preCourse'/></td>" +
            "</tr>"
        );
        $(".preCourse").autocomplete({
            source: availableTags
        });
    });
    $("#deletePreCourseGroup").click(function(e) {
        var checkedCounts = $(
            "input[type='checkbox'][name='preCourseGroupItem']:checked"
        ).length;
        if (checkedCounts > 0) {
            $("input[type='checkbox'][name='preCourseGroupItem']:checked").each(
                function() {
                    $(this)
                        .parents("tr")
                        .remove();
                }
            );
            var rowCount = $("#preCourseTable>tbody>tr").length;
            for (var i = 0; i < rowCount; i++) {
                $("#preCourseTable>tbody>tr:eq(" + i + ")>td:eq(1)").html(i + 1);
            }
        } else {
            alert("至少选择一行!");
        }
    });
    $("#submitButton").click(function(e) {
        let courseName = document.querySelector('form	input[name="courseName"]')
            .value;
        let creditObj = document.getElementById("credit");
        let credit = creditObj.options[creditObj.selectedIndex].value;
        let semesterObj = document.getElementById("semester");
        let semester = semesterObj.options[semesterObj.selectedIndex].value;
        let departmentObj = document.getElementById("department");
        let department = departmentObj.options[departmentObj.selectedIndex].value;
        let preCourseInfo = "";

        let preCourseName = 1;
        let preCourse = document.getElementsByName(
            "preCourse" + preCourseName.toString()
        );
        console.log("preCourse" + preCourseName.toString());
        while (preCourse.length !== 0) {
            if (preCourseName > 1) {
                preCourseInfo = preCourseInfo + "或者";
            }

            let notEmpty = new Array(3);
            let preLength = 0;
            for (let i = 0; i < preCourse.length; i++) {
                if (preCourse[i].value.length !== 0) {
                    notEmpty[preLength] = preCourse[i];
                    preLength++;
                }
            }

            for (let i = 0; i < preLength; i++) {
                if (i !== preLength - 1) {
                    preCourseInfo = preCourseInfo + notEmpty[i].value + "和";
                } else {
                    preCourseInfo = preCourseInfo + notEmpty[i].value;
                }
            }

            preCourseName += 1;
            preCourse = document.getElementsByName(
                "preCourse" + preCourseName.toString()
            );
        }

        if (preCourseInfo.length === 0) {
            preCourseInfo = "--";
        }

        if (
            courseName.length === 0 ||
            credit.length === 0 ||
            semester.length === 0 ||
            department === 0
        ) {
            alert("请完成表格");
        } else {
            var deleteButton =
                "<button type='button' class='w3-btn w3-red w3-round' onclick='deleteTableLine(this)'>删除</button>";
            var changeButton =
                "<button type='button' class='w3-btn w3-orange w3-round' onclick='adjustCourseInfo(this)'>修改</button>";
            var tr =
                "<tr><td>" +
                courseName +
                "</td><td>" +
                credit +
                "</td><td>" +
                semester +
                "</td><td>" +
                department +
                "</td><td>" +
                preCourseInfo +
                "</td><td>" +
                deleteButton +
                "</td><td>" +
                changeButton +
                "</td></tr>";
            $("#courseTable").append(tr);
            $("#formWindow").hide();
            if (isAdjust === 1) {
                deleteTableLine(adjustTr);
            }
        }

        if (isAdjust === 1) {
            isAdjust = 0;
        }
    });

    $("#SubmitFilter").click(function(e) {
        //TODO: add refresh event, get data from server
        var flag =
            $("#yearSelector option:selected").text() == "--" ||
            $("#departmentSelector option:selected").text() == "--" ||
            $("#planSelector option:selected").text() == "--";

        if (flag) {
            alert("请填入三项内容。");
        } else {
            resetForm();
        }
    });

    $("#hideButton").click(function(e) {
        $("#formWindow").hide();
        if (isAdjust) {
            isAdjust = 0;
        }
    });
    $("#courseTable").tablesorter();
});
