module PriceConverter
  extend ActiveSupport::Concern

  def real_price
    self.amount.to_f / 100.0
  end
end
