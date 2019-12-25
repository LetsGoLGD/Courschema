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
        "ActionScript(CS301)",
        "AppleScript(CS301)",
        "Asp(CS301)",
        "BASIC(CS301)",
        "C(CS301)",
        "C++(CS301)",
        "Clojure(CS301)",
        "COBOL(CS301)",
        "ColdFusion(CS301)",
        "Erlang(CS301)",
        "Fortran(CS301)",
        "Groovy(CS301)",
        "Haskell(CS301)",
        "Java(CS301)",
        "JavaScript(CS301)",
        "Lisp(CS301)",
        "Perl(CS301)",
        "PHP(CS301)",
        "Python(CS301)",
        "Ruby(CS301)",
        "Scala(CS301)",
        "Scheme(CS301)"
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
            alert("Please select all 3 value");
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
