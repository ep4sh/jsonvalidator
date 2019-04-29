$(document).ready(function () {

    $("#validate").bind("click", function () {
        $.ajax({
            url: "/a",
            type: "POST",
            data: ({
                str: "text"
            }),
            dataType: "text",
            success: function (data) {
                $("#btn").text(data);
            }
        });
    });
});