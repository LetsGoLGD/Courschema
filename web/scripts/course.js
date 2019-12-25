// generate a full text to display in page
function preCourseJsonToText(json) {

    var obj = JSON.parse(json);
    // var obj = {};
    // var obj = {"preCourseGroups": [{"preCourses": []}]};
    // console.log(obj.preCourseGroups.length);
    // console.log(obj.preCourseGroups[0].preCourses.length);

    var text = '';
    if (!obj || !obj.preCourseGroups || obj.preCourseGroups.length < 1) {
        console.log('no pre course');
        return 'no pre course';
    }
    var name, shortName, id;
    for (var i = 0; i < obj.preCourseGroups.length; i++) {
        text += '(';
        for (var j = 0; j < obj.preCourseGroups[i].preCourses.length; j++) {

            var preCourse = obj.preCourseGroups[i].preCourses[j];
            if (!preCourse)
                continue;

            name = preCourse.name;
            shortName = preCourse.shortName;
            id = preCourse.id;
            text += shortName + ':' + name;
            if (j <= obj.preCourseGroups[i].preCourses.length - 2) {
                text += ' and ';
            }
        }
        text += ')';
        if (i <= obj.preCourseGroups.length - 2) {
            text += ' or ';
        }
    }
    console.log(text);
    return text;
}

function courseInfoToJson() {
    var json = {};
    var preCourseGroups = {};
    var table = $('#preCourseTable');
    for (let i = 0; i < table; i++) {

    }
    json.preCourseGroups = preCourseGroups;

    $('#preCourseTable').tableToJSON()
}

// to display in modal to modified
function preCourseJsonToTable() {

}

function courseInfoToHTML() {

}


$(document).ready(function () {
    // preCourseJsonToText();
    // TODO: use data from database
    var availableTags = [
        "ActionScript",
        "AppleScript",
        "Asp",
        "BASIC",
        "C",
        "C++",
        "Clojure",
        "COBOL",
        "ColdFusion",
        "Erlang",
        "Fortran",
        "Groovy",
        "Haskell",
        "Java",
        "JavaScript",
        "Lisp",
        "Perl",
        "PHP",
        "Python",
        "Ruby",
        "Scala",
        "Scheme"
    ];
    $('#shortName').autocomplete({
        source: availableTags
    });
    $('#addButton').click(function (e) {
        $('#formWindow').show();
    });
    // $('#preCourseTable').delegate('input', 'autocomplete')
    $('#addPreCourseGroup').click(function (e) {

        var newRowNumber = $("#preCourseTable>tbody>tr").length + 1;
        $("#preCourseTable>tbody").append("<tr class='w3-margin'>" +
            "<td><input type='checkbox' name='preCourseGroupItem' /></td>" +
            "<td>" + newRowNumber + "</td>" +
            "<td><input type='text' class='preCourse'/></td>" +
            "<td><input type='text' class='preCourse'/></td>" +
            "<td><input type='text' class='preCourse'/></td>" +
            // "<td><input type='text' class='preCourse'/></td>" +
            "</tr>");
        $('.preCourse').autocomplete({
            source: availableTags
        })
    });
    $('#deletePreCourseGroup').click(function (e) {
        var checkedCounts = $("input[type='checkbox'][name='preCourseGroupItem']:checked").length;
        if (checkedCounts > 0) {
            $("input[type='checkbox'][name='preCourseGroupItem']:checked").each(function () {
                $(this).parents("tr").remove();
            });
            var rowCount = $("#preCourseTable>tbody>tr").length;
            for (var i = 0; i < rowCount; i++) {
                $("#preCourseTable>tbody>tr:eq(" + i + ")>td:eq(1)").html(i + 1);
            }
        } else {
            alert("至少选择一行!");
        }
    });
    $('#submitButton').click(function (e) {
        //TODO: submit form to server
    });
    $('#refreshButton').click(function (e) {
        //TODO: add refresh event, get data from server
        console.log('test')
    });
    $('#courseTable').tablesorter()
});


