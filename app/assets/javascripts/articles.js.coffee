ready = ->
  $('#article-affix').affix
    offset: 
      top: 135
  $(".select2").select2()
  $.fn.datepicker.defaults.format = "dd-mm-yyyy";
  $.fn.datepicker.defaults.startDate = "0d";
  $.fn.datepicker.defaults.todayBtn = "linked";

$(document).ready(ready)
$(document).on('page:load', ready)