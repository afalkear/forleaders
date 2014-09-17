ready = ->
  $('#article-affix').affix
    offset: 
      top: 135
  $(".select2").select2()

$(document).ready(ready)
$(document).on('page:load', ready)