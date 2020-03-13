FactoryBot.define do

  factory :item do
    name              {"abe"}
    explanation       {"kkk"}
    price              {"50000"}
    condition         {"0"}
    sent_charge       {"1"}
    shipping_area     {"5"}
    days_to_ship      {"2"}
    size
    brand
    category
    user
  end

end