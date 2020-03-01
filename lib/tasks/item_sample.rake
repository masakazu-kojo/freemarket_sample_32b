namespace :item_sample do
  desc "アイテムのテストデータ挿入"
  task create_item_sample: :environment do
    3.times do |num|
      Item.create(
        id:1000 + num,
        name: "test#{num}",
        explanation: "test#{num}",
        price: 1000 + num,
        condition: "未使用に近い",
        sent_charge: "送料込み（出品者負担）",
        shipping_area: "北海道",
        days_to_ship: "１〜２日で発送",
        user_id: 1,
        brand_id:1,
        category_id:1001
      )
    end
    3.times do |num|
      Item.create(
        id:2000 + num,
        name: "sample#{num}",
        explanation: "sample#{num}",
        price: 2000 + num,
        condition: "未使用に近い",
        sent_charge: "送料込み（出品者負担）",
        shipping_area: "北海道",
        days_to_ship: "１〜２日で発送",
        user_id: 1,
        brand_id:1,
        category_id:1001
      )
    end
    # テスト用取引ステータスの作成
    3.times do |num|
      Trading.create(id: 1000 + num, status: true, item_id: 1000 + num, user_id: 1)
    end
    3.times do |num|
      Trading.create(id: 2000 + num, status: true, item_id: 2000 + num, user_id: 1)
    end
  end
end
