// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require_tree .

$(document).on('click', '.filter #toggle_filter', function (event) {
  if ($(".filter #content_filter").is(":hidden")) {
    $(".filter #content_filter").slideDown()
    $(".filter #toggle_filter").text("Esconder")
  } else {
    $(".filter #content_filter").slideUp()
    $(".filter #toggle_filter").text("Mostrar filtro")
  }
})