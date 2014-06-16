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
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function() {

    $("body").on("click", ".delete_user", function(){

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

  //  $( "#sortable" ).sortable();


    $("#table-users").tableDnD();
    $("#table-admins").tableDnD();

   $("body").on("click", "#users_list th a, #users_list .pagination a", function() {
        $.getScript(this.href);
        return false;
    });

    $("body").on("click", "#admins_list th a, #admins_list .pagination a", function() {
        $.getScript(this.href);
        return false;
    });

    $("#users_search input").keyup(function() {
        console.log($("#users_search input").val().length);
        console.log($("#users_search input").val());
        if ($("#users_search input").val().length >=3) {
            $.get($("#users_search").attr("action"), $("#users_search").serialize(), null, "script");
            $("#users_search input").focus();
        }
        return false;
    });

    $('.reset_password').click(function() {
        $('#password_form').css('display','block');
    });

    $('.reset_password_admin').click(function() {
        $('#password_form_admin').css('display','block');
    });
});
