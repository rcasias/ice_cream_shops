class Shop < ApplicationRecord
  has_many :flavors, dependent: :destroy

  def delivery?
    if has_delivery
      'yes'
    else
      'no'
    end
  end
end
