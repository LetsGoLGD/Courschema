function deleteTableLine(nowTr) {
    $(nowTr).parent().parent().remove();
}

function resetForm() {

}

function tableToJson() {
    return $('#table').tableToJSON();
}

function jsonToTable() {

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

        var tr = "<tr><td>" + d["courseName"] + "</td><td>" + d["major"] +
            "</td><td>" + d["credit"] + "</td><td>" + d["teacher"] + "</td><td>" + deleteButton + "</td></tr>";

        $("#table").append(tr);
        $("#formWindow").hide();
    });



});


