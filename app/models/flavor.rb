class Flavor < ApplicationRecord
  belongs_to :shop

  def dairy?
    if dairy_free
      'yes'
    else
      'no'
    end
  end

  def nuts?
    if nut_free
      'yes'
    else
      'no'
    end
  end
end
