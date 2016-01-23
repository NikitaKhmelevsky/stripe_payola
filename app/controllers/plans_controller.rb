class PlansController < ApplicationController
  load_and_authorize_resource

  def index
    @plans        = Plan.last(3)
    @subscription = current_user.subscription
  end
end
