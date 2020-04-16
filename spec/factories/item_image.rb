FactoryBot.define do
  factory :item_image01, class: ItemImage do
    sequence(:id) { |n| n}
    sequence(:image) { |n| "TEST_IMAGE_#{n}"}
    sequence(:item_id) { 10 }
  end

  factory :item_XX, class: Item do
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
  
end