jQuery ->
  $('#article_category_tokens').tokenInput '/categories.json',
  theme: 'bootstrap'  
  prePopulate: $('#article_category_tokens').data('load')