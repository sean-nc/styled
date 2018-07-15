ready = ->
  if $('#infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      more_posts_url = $('#infinite-scrolling a.next_page').attr('href')
      if more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
        $('.pagination').html('')
        $.getScript more_posts_url, ->
      return
  return

$(document).on('turbolinks:load', ready)