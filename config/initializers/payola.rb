Payola.configure do |config|
  config.secret_key      = StripeData['secret_key']
  config.publishable_key = StripeData['publishable_key']
end
