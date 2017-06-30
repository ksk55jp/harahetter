ready = ->
    $(window).scroll ->
        threshold=400
        height = $(window).scrollTop()
        element = $('#page-top-btn')
        visible = element.is(':visible')
        if height > threshold
          element.fadeIn() if !visible
        else
          element.fadeOut()
    $(document).on 'click', '#move-page-top', ->
      $('html, body').animate({scrollTop: 0}, 'slow')


$(document).ready(ready)
$(document).on('page:load', ready)
