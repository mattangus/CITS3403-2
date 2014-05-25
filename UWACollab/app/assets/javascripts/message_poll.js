/**
 * Created by Matt on 25/05/2014.
 */
$(document).ready(function (e) {
        $("#messages").animate({ "scrollTop": $('#messages')[0].scrollHeight}, "slow");
        setTimeout(updateComments, 3000);
    }
)

function updateComments () {
    var group_id = $("#group_id").attr('value');
    var children = $("#messages").children()
    if (children.length > 0) {
        var after = children.last().attr("data-time");
    } else {
        var after = "0";
    }
    $.getScript("/messages.js?group_id=" + group_id + "&after=" + after);
    setTimeout(updateComments, 3000);
}