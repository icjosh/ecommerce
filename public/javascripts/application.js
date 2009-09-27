// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
    $("div#notice").each(function(value, index) {
        value.hide();
    });
    
    $("#cart_actions form").submit(function() {
        $.post($(this).attr("action"), $(this).serialize(), null, "script");
        return false;
    })

})