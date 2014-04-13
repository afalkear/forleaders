ready = ->
  $('.carousel').carousel({
    interval: false
    })

$(document).ready(ready)
$(document).on('page:load', ready)