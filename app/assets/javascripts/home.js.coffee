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

  $('#individual-personal-link').click ->
    $('#individual-header-container').removeClass ("individual-with-training-background-header individual-with-intensive-background-header individual-with-consultory-background-header")
    $('#individual-header-container').addClass "individual-with-personal-background-header"

  $('#individual-training-link').click ->
    $('#individual-header-container').removeClass ("individual-with-personal-background-header individual-with-intensive-background-header individual-with-consultory-background-header")
    $('#individual-header-container').addClass "individual-with-training-background-header"

  $('#individual-consultory-link').click ->
    $('#individual-header-container').removeClass ("individual-with-personal-background-header individual-with-intensive-background-header individual-with-training-background-header")
    $('#individual-header-container').addClass "individual-with-consultory-background-header"

  $('#individual-intensive-link').click ->
    $('#individual-header-container').removeClass ("individual-with-personal-background-header individual-with-training-background-header individual-with-consultory-background-header")
    $('#individual-header-container').addClass "individual-with-intensive-background-header"

$(document).ready(ready)
$(document).on('page:load', ready)