class Plan < ActiveRecord::Base
  include PriceConverter
  include Payola::Plan
end
