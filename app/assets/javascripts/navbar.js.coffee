ready = ->
  $('.my-affix').affix
    offset: 
      top: 100

$(document).ready(ready)
$(document).on('page:load', ready)