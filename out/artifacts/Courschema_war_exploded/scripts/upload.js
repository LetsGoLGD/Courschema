function deleteTableLine(nowTr) {
    $(nowTr).parent().parent().remove();
}

function resetForm() {

}

function tableToJson() {
    return $('#table').tableToJSON();
}

function jsonToTable() {
    let objFile = document.getElementById("imFile");
    if (objFile.value === "") {
        alert("No file exist");
        return false;
    }

    let files = $('#imFile').prop('files');
    if (files.length === 0) {
        alert('Please choose a file');
    } else {
        let reader = new FileReader();
        reader.readAsText(files[0], "UTF-8");
        reader.onload = function (evt) {
            let fileString = evt.target.result;
            let mydata = JSON.parse(fileString).courses;
            for (let i = 0; i < mydata.length; i++) {
                var deleteButton = "<button type='button' class='w3-btn w3-red w3-round' onclick='deleteTableLine(this)'>delete</button>";
                var tr = "<tr><td>" + mydata[i].courseNameEn + "</td><td>" + mydata[i].courseNameZh + "</td><td>" + mydata[i].departmentShortName + "</td><td>" + deleteButton + "</td></tr>";
                $("#table").append(tr);
                preCourseJsonToText(mydata[i])
            }

            $("#uploadFileWindow").hide();
        }
    }
}

// generate a full text to display in page
function preCourseJsonToText(json) {

    var obj = json;
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

// maybe do not need this
function jsonToXLSX() {

}

// default support only XLSX
function tableToExcel() {
    var wb = XLSX.utils.book_new();
    var ws = XLSX.utils.table_to_sheet($('#table'));
    XLSX.utils.book_append_sheet(wb, ws, "schema");
}

function excelToTable() {

}

function resetForm() {
    $('#form')[0].reset();
}

// only XLSX is supported

$('#imFile').change(function (e) {
    let f = this.files[0];
    let reader = new FileReader();
    reader.readAsArrayBuffer(e.target.files[0]);
    reader.onload = function (e) {
        let data = e.target.result;
        let workbook = XLSX.read(data, {
            type: 'binary'
        });
        console.log('workbook:', workbook);

        let table = XLSX.utils.sheet_to_html();
        console.log(table);
        let json = XLSX.utils.sheet_to_json(workbook.Sheets[workbook.SheetNames[0]]);
        console.log('json:', json);
    };
    reader.readAsBinaryString(f);
});

$(document).ready(function () {
    // $("#addButton").click(function () {
    //     $("#forms").append($("#formLine").clone().toggle());
    // });
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

    $('#courseNameEn').autoComplete({
        source: availableTags
    });
    $("#uploadByForm").click(function () {
        $("#formUpload").show();
        $("#fileUpload").hide();
    });

    $("#uploadByFile").click(function () {
        $("#formUpload").hide();
        $("#fileUpload").show();
    });

    $("#addButton").click(function () {
        $("#formWindow").toggle();
    });
    $("#form").validate();

    $("#resetButton").click(function () {
        resetForm();
    })

    $("#submitFormButton").click(function () {
        if (!$("#form").valid())
            return false;

        var d = {};

        var t = $("#form").serializeArray();
        $.each(t, function () {
            d[this.name] = this.value;
        });


        //TODO: add some check of data here

        var deleteButton = "<button type='button' class='w3-btn w3-red w3-round' onclick='deleteTableLine(this)'>delete</button>";

        var tr = "<tr><td>" + d["courseNameEn"] + "</td><td>" + d["courseNameZh"] + "</td><td>" + d["major"] + "</td><td>" + deleteButton + "</td></td>";
        // "</td><td>" + d["credit"] + "</td><td>" + d["teacher"] +

        $("#table").append(tr);
        $("#formWindow").hide();
        resetForm();
    });



});


