$ ->
  $('.js-demo-1-btn').on 'click', (e)  ->
    e.preventDefault()
    $(this).next().find('.js-demo-1_r').toggleClass 'col-md-6-10 col-md-1-10'
    $(this).next().find('.js-demo-2_l').toggleClass 'col-md-4-10 col-md-9-10'

  $(window).bind 'scroll', ->
    if $(window).scrollTop() > $('#header').outerHeight()
      $('#menu').addClass 'fixed'
    else
      $('#menu').removeClass 'fixed'

  ###*
  # This part causes smooth scrolling using scrollto.js
  # We target all a tags inside the nav, and apply the scrollto.js to it.
  ###

  $('#menu a').click (evn) ->
    if location.pathname.replace(/^\//, '') == @pathname.replace(/^\//, '') and location.hostname == @hostname
      target = $(@hash)
      target = if target.length then target else $('[name=' + @hash.slice(1) + ']')
      if target.length
        $('html, body').animate { scrollTop: target.offset().top }, 400
        return false
    return

  ###*
  # This part handles the highlighting functionality.
  # We use the scroll functionality again, some array creation and 
  # manipulation, class adding and class removing, and conditional testing
  ###

  aChildren = $('#menu li').children()
  # find the a children of the list items
  aArray = []
  # create the empty aArray
  i = 0
  while i < aChildren.length
    aChild = aChildren[i]
    ahref = $(aChild).attr('href')
    aArray.push ahref
    i++
  # this for loop fills the aArray with attribute href values
  $(window).scroll ->
    `var i`
    windowPos = $(window).scrollTop()
    # get the offset of the window from the top of page
    windowHeight = $(window).height()
    # get the height of the window
    docHeight = $(document).height()
    i = 0
    while i < aArray.length
      theID = aArray[i]
      divPos = $(theID).offset().top
      # get the offset of the div from the top of page
      divHeight = $(theID).height()
      # get the height of the div in question
      if windowPos >= divPos and windowPos < divPos + divHeight
        $('a[href=\'' + theID + '\']').addClass 'active'
      else
        $('a[href=\'' + theID + '\']').removeClass 'active'
      i++
    if windowPos + windowHeight == docHeight
      if !$('#menu li:last-child a').hasClass('active')
        navActiveCurrent = $('.active').attr('href')
        $('a[href=\'' + navActiveCurrent + '\']').removeClass 'active'
        $('#menu li:last-child a').addClass 'active'
    return
  return






