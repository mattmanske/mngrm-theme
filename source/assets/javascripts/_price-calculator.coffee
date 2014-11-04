$ ->

  priceBlock = $('.price-block')
  selects = $('.flex-wrapper select')

  selects.bind 'change', ->
    updatePrice()

  updatePrice = ->
    console.log 'price'
    # newPrice = ???
    # priceBlock.text '$' + newPrice