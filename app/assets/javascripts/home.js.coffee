ready = ->
  $('.carousel').carousel({
    interval: false
    })


  url = document.location.toString()
  if url.match('#') 
    $('#individual-header-container').removeClass()
    $('#individual-header-container').addClass 'individual-with-'+url.split('#')[1]+'-background-header container individual-consultory-container page-title-container'
    $('.nav-pills a[href=#'+url.split('#')[1]+']').tab('show') ;
    $('a[data-toggle="tab"]').on 'show.bs.tab',  (e) ->
        window.location.hash = e.target.hash

  $('.image-link').magnificPopup type: 'image'

  $('.programme-plus').click (event) ->
    event.preventDefault()
    $('.programme-plus').hide()
    $('.programme-minus').show()
    $('.programme-show-with-plus').show()

  $('.programme-minus').click (event) ->
    event.preventDefault()
    $('.programme-plus').show()
    $('.programme-minus').hide()
    $('.programme-show-with-plus').hide()

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

  $('#individual-small-group-teaching-link').click ->
    $('#individual-header-container').removeClass ("individual-with-small-group-training-background-header individual-with-talks-background-header individual-with-workshop-background-header")
    $('#individual-header-container').addClass "individual-with-small-group-teaching-background-header"

  $('#individual-small-group-training-link').click ->
    $('#individual-header-container').removeClass ("individual-with-small-group-teaching-background-header individual-with-talks-background-header individual-with-workshop-background-header")
    $('#individual-header-container').addClass "individual-with-small-group-training-background-header"

  $('#individual-workshop-link').click ->
    $('#individual-header-container').removeClass ("individual-with-small-group-teaching-background-header individual-with-talks-background-header individual-with-small-group-training-background-header")
    $('#individual-header-container').addClass "individual-with-workshop-background-header"

  $('#individual-talks-link').click ->
    $('#individual-header-container').removeClass ("individual-with-small-group-teaching-background-header individual-with-small-group-training-background-header individual-with-workshop-background-header")
    $('#individual-header-container').addClass "individual-with-talks-background-header"

$(document).ready(ready)
$(document).on('page:load', ready)
$(document).on 'page:fetch', ->
  PageSpinner.spin()

@PageSpinner =
  spin: (ms=500)->
    @spinner = setTimeout( (=> @add_spinner()), ms)
    $(document).on 'page:receive', =>
      @remove_spinner()
  spinner_html: '
    <div class="modal fade" id="page-spinner">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
            <i class="fa fa-refresh fa-spin fa-5x"></i>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
  '
  spinner: null
  add_spinner: ->
    $('body').append(@spinner_html)
    $('body div#page-spinner').modal()
  remove_spinner: ->
    clearTimeout(@spinner)
    #$('div#page-spinner').modal('hide')
    #$('div#page-spinner').on 'hidden', ->
      #$(this).remove()
