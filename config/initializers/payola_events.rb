Payola.configure do |config|
  config.subscribe 'plan.deleted', PaymentEvent::PlanDeleted
end
