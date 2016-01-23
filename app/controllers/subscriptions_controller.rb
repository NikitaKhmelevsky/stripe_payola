class SubscriptionsController < ApplicationController
  # bring in the `render_payola_status` helper.
  include Payola::StatusBehavior

  authorize_resource class: 'Payola::Subscription'

  def new
    @plan = Plan.find_by(id: params[:plan_id])
  end

  def create
    owner = current_user

    # set your plan in the params hash
    params[:plan] = Plan.find_by(id: params[:plan_id])

    subscription = Payola::CreateSubscription.call(params, owner)

    # Render the status json that Payola's javascript expects
    render_payola_status(subscription)
  end
end
