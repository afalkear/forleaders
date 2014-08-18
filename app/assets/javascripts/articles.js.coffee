ready = ->
  $('#article-affix').affix
    offset: 
      top: 135

$(document).ready(ready)
$(document).on('page:load', ready)