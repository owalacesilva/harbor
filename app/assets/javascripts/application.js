$(document).on('click', '.filter #toggle_filter', function (event) {
  if ($(".filter #content_filter").is(":hidden")) {
    $(".filter #content_filter").slideDown()
    $(".filter #toggle_filter").text("Esconder")
  } else {
    $(".filter #content_filter").slideUp()
    $(".filter #toggle_filter").text("Mostrar filtro")
  }
})