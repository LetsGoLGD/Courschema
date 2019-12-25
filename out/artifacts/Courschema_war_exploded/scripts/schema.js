$(document).ready(function () {
    $("#SubmitFilter").click(function(e) {
        //TODO: add refresh event, get data from server
        var flag =
            $("#yearSelector option:selected").text() == "--" ||
            $("#departmentSelector option:selected").text() == "--" ||
            $("#planSelector option:selected").text() == "--";

        if (flag) {
            alert("请填入三个选项。");
        } else {
            // TODO: add action here
        }
    });
    $('#schemaTable').tablesorter();

});
