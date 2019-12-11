function choose() {
    document.getElementById("file").click();
}

function upload() {
    document.getElementById("submit").click();
}

function succeed() {
    alert("Upload success!");
}

function fail() {
    alert("Wrong file type!");
}


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
        console.log(t);
        $.each(t, function () {
            d[this.name] = this.value;
        });


        //TODO: add some check of data here

        var deleteButton = "<button type='button' class='w3-btn w3-red' onclick='deleteTableLine(this)'>DEL</button>";

        var tr = "<tr><td>" + d["courseName"] + "</td><td>" + d["major"] +
            "</td><td>" + d["credit"] + "</td><td>" + d["teacher"] + "</td><td>" + deleteButton + "</td></tr>";

        $("#table").append(tr);
        $("#formWindow").hide();
    });
    $(".deleteButton").click(function () {
    })

});

function deleteTableLine(nowTr) {
    $(nowTr).parent().parent().remove();

}


// document.querySelectorAll("[multip]").forEach(function (e) {
//     var opts = [], arr = [], valarr = [], choosevalue = "", op;
//     for (var i = 0; i < e.length; i++) {
//         op = e.item(i);
//         opts.push(op);
//         if (op.hasAttribute("choose")) {
//             if (choosevalue == "") {
//                 choosevalue = op.value
//             } else {
//                 choosevalue += "," + op.value;
//             }
//
//         }
//     }
//
//
//     var option = document.createElement("option");
//     option.hidden = true;
//     e.appendChild(option);
//     e.addEventListener("change", function () {
//         var text = e.options[e.selectedIndex].text;
//         var value = e.options[e.selectedIndex].value;
//         e.options[e.selectedIndex].style = "color: blue;";
//         var ind = arr.indexOf(text);
//         if (ind > -1) {
//             arr.splice(ind, 1);
//             valarr.splice(ind, 1);
//             opts.filter(function (o) {
//                 if (o.value == value) {
//                     o.style = "";
//                 }
//             });
//         } else {
//             arr.push(text);
//             valarr.push(value);
//         }
//         if (arr.length > 0) {
//             e.options[e.length - 1].text = arr.toString();
//             e.options[e.length - 1].value = valarr.toString();
//             e.options[e.length - 1].selected = true;
//         } else {
//             e.options[0].selected = true;
//         }
//     });
// //重新定义标签基础属性的get和set方法，实现取值和赋值的功能
//     Object.defineProperty(e, "value", {
//         get: function () {
//             return this.querySelector("[hidden]").value;
//         },
//         set: function (value) {
//             valarr = value.split(",");
//             arr = [];
//             opts.filter(function (o) {
//                 o.style = "";
//             });
//             if (valarr.toString()) {
//                 for (var i = 0; i < valarr.length; i++) {
//                     opts.filter(function (o) {
//                         if (o.value == valarr[i]) {
//                             o.style = "color: blue;";
//                             arr.push(o.text);
//                         }
//                     });
//                 }
//                 this.options[e.length - 1].text = arr.toString();
//                 this.options[e.length - 1].value = valarr.toString();
//                 this.options[e.length - 1].selected = true;
//             } else {
//                 this.options[0].selected = true;
//             }
//
//         }
//     });
// //添加属性choose 此属性添加到option中用来指定默认值
//     e.value = choosevalue;
// });