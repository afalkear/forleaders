ready = ->
  $('.carousel').carousel({
    interval: false
    })

$(document).ready(ready)
$(document).on('page:load', ready)

url = document.location.toString()
if url.match('#') 
  $('.nav-pills a[href=#'+url.split('#')[1]+']').tab('show') ;
  $('a[data-toggle="tab"]').on 'show.bs.tab',  (e) ->
      window.location.hash = e.target.hash
