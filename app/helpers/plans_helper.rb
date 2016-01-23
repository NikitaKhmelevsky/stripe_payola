module PlansHelper
  def plan_difference(current_plan, new_plan)
    if current_plan == new_plan
      'current'
    elsif current_plan.amount > new_plan.amount
      'downgrade'
    elsif current_plan.amount < new_plan.amount
      'upgrade'
    end
  end
end
