class Itemsentcharge < ActiveHash::Base
  self.data = [
      {id: 0, name: "送料込み（出品者負担）"},
      {id: 1, name: "着払い（購入者負担）"}
  ]
end