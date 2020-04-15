FactoryBot.define do
  factory :item_01, class: Item do
    sequence(:id) { |n| n}
    sequence(:name) { |n| "TEST_SELLING_#{n}" }
    sequence(:introduction) { |n| "TEST_INTRODUCTION_#{n}"}
    sequence(:price) { 10000000 }
    sequence(:category_id) { 3 }
    sequence(:status) { "未使用" }
    sequence(:preparation_day) { 2 }
    sequence(:exhibitor_id) { 1 }
    sequence(:delivery_fee) { "着払い（購入者負担）" }
    sequence(:prefecture_id) { 1 }
  end

  factory :item_02, class: Item do
    sequence(:id) { |n| n}
    sequence(:name) { |n| "TEST_SELLING_#{n}" }
    sequence(:introduction) { |n| "TEST_INTRODUCTION_#{n}"}
    sequence(:price) { 9999999 }
    sequence(:category_id) { 3 }
    sequence(:status) { "未使用" }
    sequence(:preparation_day) { 2 }
    sequence(:exhibitor_id) { 1 }
    sequence(:delivery_fee) { "着払い（購入者負担）" }
    sequence(:prefecture_id) { 1 }
  end

  factory :item_03, class: Item do
    sequence(:id) { |n| n}
    sequence(:name) { |n| "TEST_SELLING_#{n}" }
    sequence(:introduction) { |n| "TEST_INTRODUCTION_#{n}"}
    sequence(:price) { 100 }
    sequence(:category_id) { 3 }
    sequence(:status) { "未使用" }
    sequence(:preparation_day) { 2 }
    sequence(:exhibitor_id) { 1 }
    sequence(:delivery_fee) { "着払い（購入者負担）" }
    sequence(:prefecture_id) { 1 }
  end

  factory :item_04, class: Item do
    sequence(:id) { |n| n}
    sequence(:name) { |n| "TEST_SELLING_#{n}" }
    sequence(:introduction) { |n| "TEST_INTRODUCTION_#{n}"}
    sequence(:price) { 99 }
    sequence(:category_id) { 3 }
    sequence(:status) { "未使用" }
    sequence(:preparation_day) { 2 }
    sequence(:exhibitor_id) { 1 }
    sequence(:delivery_fee) { "着払い（購入者負担）" }
    sequence(:prefecture_id) { 1 }
  end
end
