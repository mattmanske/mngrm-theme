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
        stainless_steel   : 52.72
        matte_black_steel : 59.62
        raw_bronze        : 66.33
        raw_brass         : 66.33
        polished_bronze   : 90.44
        polished_brass    : 90.44
        premium_silver    : 153.48
        gold_14_k         : 481.78
        gold_14_k_rose    : 481.78
        gold_14_k_white   : 481.78
        gold_18_k         : 707.55
        platinum          : 1233.70
      keychain:
        stainless_steel   : 52.72
        matte_black_steel : 59.62
        raw_bronze        : 66.33
        raw_brass         : 66.33
        polished_bronze   : 90.44
        polished_brass    : 90.44
        premium_silver    : 153.48
        gold_14_k         : 481.78
        gold_14_k_rose    : 481.78
        gold_14_k_white   : 481.78
        gold_18_k         : 707.55
        platinum          : 1233.70
    large:
      necklace:
        stainless_steel   : 70.12
        matte_black_steel : 74.53
        raw_bronze        : 88.22
        raw_brass         : 88.22
        polished_bronze   : 120.29
        polished_brass    : 120.29
        premium_silver    : 204.13
        gold_14_k         : 640.77
        gold_14_k_rose    : 640.77
        gold_14_k_white   : 640.77
        gold_18_k         : 941.04
        platinum          : 1640.82
      keychain:
        stainless_steel   : 70.12
        matte_black_steel : 79.29
        raw_bronze        : 88.22
        raw_brass         : 88.22
        polished_bronze   : 120.29
        polished_brass    : 120.29
        premium_silver    : 204.13
        gold_14_k         : 640.77
        gold_14_k_rose    : 640.77
        gold_14_k_white   : 640.77
        gold_18_k         : 941.04
        platinum          : 1640.82
