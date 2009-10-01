// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
    
    // $("div#notice").each(function(value, index) {
    //     value.hide();
    // });
    
    // TODO: Clean this
    $("#cart_actions form.button-to:eq(1)").submit(function() {
        $.post($(this).attr("action"), $(this).serialize(), null, "script");
        return false;
    })
/*
    $("div#product-list.entry .button-to").submit(function() {
        $.post($(this).attr("action"), $(this).serialize(), null, "script");
        return false;
    })
*/
    $("#product-list .button-to").submit(function() {
        $.post($(this).attr("action"), $(this).serialize(), null, "script");
        return false;
    })

})