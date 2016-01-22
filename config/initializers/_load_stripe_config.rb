StripeData = YAML.load_file(Rails.root.join('config', 'stripe_config.yml'))[Rails.env]
