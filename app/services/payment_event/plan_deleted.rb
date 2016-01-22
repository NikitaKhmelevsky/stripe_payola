module PaymentEvent
  class PlanDeleted
    def self.call(event)
      plan = Plan.find_by_stripe_id(event.data.object['id'])
      plan.destroy
    end
  end
end
