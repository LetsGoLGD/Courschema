$(document).ready(function () {
    $('#schemaTable').tablesorter()
});
$(function () {
    $('#ss').click(function () {
        var sstxt = $('#filtertxt').val();
        $("table tbody tr").hide().filter(":contains('" + sstxt + "')").show();
    })
})