ready = ->
  $('#article_category_tokens').tokenInput '/categories.json',
  theme: 'bootstrap'  
  prePopulate: $('#article_category_tokens').data('load')

  $('#article-affix').affix
    offset: 
      top: 135

$(document).ready(ready)
$(document).on('page:load', ready)