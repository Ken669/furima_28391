class ShippingFee < ActiveHash::Base
  self.data = [
    { id: 1, name: '購入者（元払い）' },
    { id: 2, name: '出品者（着払い）' }
  ]
end
