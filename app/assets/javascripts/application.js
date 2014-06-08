// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.ui.all
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {

    $(".delete_user").click(function(){

        var link = $(this);
        console.log(link);
        console.log(link.parents('tr'));

        $.ajax({
          type: "DELETE",
          url: link.attr("href")
        }).done(function( msg ) {
            alert('user is removed');
        });
        link.parents('tr').remove();
        return false;
    });

    $( "#sortable" ).sortable();

    $("#table-users").tableDnD();
    $("#table-admins").tableDnD();

    $("#users_list th a, #users_list .pagination a").on('click', function() {
        $.getScript(this.href);
        return false;
    });

    $("#admins_list th a").on('click', function() {
        $.getScript(this.href);
        return false;
    });

    $("#users_search input").keyup(function() {
        $.get($("#users_search").attr("action"), $("#users_search").serialize(), null, "script");
        return false;
    });

    $('.reset_password').click(function() {
        $('#password_form').css('display','block');
    });
});
