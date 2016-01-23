$ ->
  expDate    = $('#subscription_exp_date')
  expMonth   = $('#subscription_exp_month')
  expYear    = $('#subscription_exp_year')
  cardNumber = $('#subscription_card_number')
  cvc        = $('#subscription_cvc')

  expDate.payment    'formatCardExpiry'
  cardNumber.payment 'formatCardNumber'
  cvc.payment        'formatCardCVC'

  expDate.on 'keyup', ->
    e  = $(this).first()
    out = $.payment.cardExpiryVal(e.val())
    expMonth.val out.month
    expYear.val  out.year
    return

  cardNumber.on 'keyup', ->
    e    = $(this).first()
    type = $.payment.cardType(e.val())

    img = 'credit.png'
    switch type
      when 'visa'       then img = 'visa.png'
      when 'mastercard' then img = 'mastercard.png'
      when 'discover'   then img = 'discover.png'
      when 'amex'       then img = 'amex.png'
    e.css 'background-image', 'url(/images/credit_cards/' + img + ')'
