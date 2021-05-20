class Shop < ApplicationRecord
  has_many :flavors, dependent: :destroy

  def delivery?
    if has_delivery
      'Yes'
    else
      'No'
    end
  end

  def self.order_shop_by_desc_date
    order('created_at DESC')
  end

  def rounded_rating
    rating.round(1)
  end

end
