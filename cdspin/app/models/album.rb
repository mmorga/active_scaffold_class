class Album < ActiveRecord::Base
  composed_of :price, :class_name => "Money", 
      :mapping => [%w(price_in_cents cents), %w(currency currency)],
      :converter => Proc.new {|value| value.to_money}
end
