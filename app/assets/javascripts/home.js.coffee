ready = ->
  $('.carousel').carousel({
    interval: false
    })


  url = document.location.toString()
  if url.match('#') 
    $('.nav-pills a[href=#'+url.split('#')[1]+']').tab('show') ;
    $('a[data-toggle="tab"]').on 'show.bs.tab',  (e) ->
        window.location.hash = e.target.hash

  $('.image-link').magnificPopup type: 'image'

  $('.programme-plus').click (event) ->
    event.preventDefault()
    $('.programme-plus').hide()
    $('.programme-show-with-plus').show()


$(document).ready(ready)
$(document).on('page:load', ready)