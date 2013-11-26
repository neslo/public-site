jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

  $(window).scroll ->
    slider()

  slider = ->
    if (document.body.scrollTop > 698)
      $('.hidden-nav').stop().animate({"margin-top": '0'})
    else
      $('.hidden-nav').stop().animate({"margin-top": '-50'})
