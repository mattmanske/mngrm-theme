# $ ->

#   slides = $('.slideshow-block')
#   leftArrow = $('.icon-arrow-left')
#   rightArrow = $('.icon-arrow-right')

#   cnt = 0
#   changeTimout = null

#   #-----------  Functionality  -----------#

#   nextImage = (clockwise = true) ->
#     clearTimeout(changeTimout)
#     slides.eq(cnt).removeClass('visible')

#     if clockwise
#       cnt = if (cnt+1) >= slides.length then 0 else (cnt+1)
#     else
#       cnt = if (cnt-1) < 0 then (slides.length-1) else (cnt-1)
    
#     slides.eq(cnt).addClass('visible')
#     changeTimout = setTimeout(nextImage, 4000)

#   #-----------  Binding & Initilizers  -----------#

#   leftArrow.bind 'click', ->
#     nextImage(false)

#   rightArrow.bind 'click', ->
#     nextImage()

#   slides.eq(0).addClass('visible')
#   changeTimout = setTimeout(nextImage, 4000)
