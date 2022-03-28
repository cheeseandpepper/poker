class Card < ApplicationRecord
  #where returns sorted by id
  #was tricky, but now sorted by order
  #in which cards passed in
  scope :in_deal_order, ->(ordering) do
    sql_string = "CASE"
    ordering.each_with_index do |p, i|
      sql_string << " WHEN id = '#{p}' THEN #{i}"
    end
    sql_string << " END"

    order(Arel.sql(sql_string))
  end
end
