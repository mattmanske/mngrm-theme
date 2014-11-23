$ ->

  orderSize     = $('#order-size')
  orderType     = $('#order-type')
  orderMaterial = $('#order-material')

  priceInput    = $('#order-price')
  priceBlock    = $('.price-block')
  selects       = $('.flex-wrapper select')

  #-----------  Bind & Initialize  -----------#

  selects.bind 'change', ->
    updatePrice()

  $(document).ready ->
    updatePrice()

  #-----------  Update Display & Form Value  -----------#

  updatePrice = ->
    size     = orderSize.val()
    type     = orderType.val()
    material = orderMaterial.val()
    newPrice = prices[size][type][material]

    priceInput.val(newPrice)
    priceBlock.text('$' + newPrice.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,'))

  #-----------  Prices Object  -----------#

  prices =
    small:
      necklace:
        stainless_steel   : 49.00
        matte_black_steel : 59.00
        raw_bronze        : 69.00
        raw_brass         : 69.00
        polished_bronze   : 89.00
        polished_brass    : 89.00
        premium_silver    : 149.00
        gold_14_k         : 479.00
        gold_14_k_rose    : 479.00
        gold_14_k_white   : 479.00
        gold_18_k         : 699.00 
        platinum          : 1199.00
      keychain:
        stainless_steel   : 49.00
        matte_black_steel : 59.00
        raw_bronze        : 69.00
        raw_brass         : 69.00
        polished_bronze   : 89.00
        polished_brass    : 89.00
        premium_silver    : 149.00
        gold_14_k         : 479.00
        gold_14_k_rose    : 479.00
        gold_14_k_white   : 479.00
        gold_18_k         : 699.00 
        platinum          : 1199.00
    large:
      necklace:
        stainless_steel   : 69.00
        matte_black_steel : 79.00
        raw_bronze        : 89.00
        raw_brass         : 89.00
        polished_bronze   : 119.00
        polished_brass    : 119.00
        premium_silver    : 199.00
        gold_14_k         : 599.00
        gold_14_k_rose    : 599.00
        gold_14_k_white   : 599.00
        gold_18_k         : 899.00 
        platinum          : 1599.00
      keychain:
        stainless_steel   : 69.00
        matte_black_steel : 79.00
        raw_bronze        : 89.00
        raw_brass         : 89.00
        polished_bronze   : 119.00
        polished_brass    : 119.00
        premium_silver    : 199.00
        gold_14_k         : 599.00
        gold_14_k_rose    : 599.00
        gold_14_k_white   : 599.00
        gold_18_k         : 899.00 
        platinum          : 1599.00
