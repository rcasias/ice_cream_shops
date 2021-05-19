class Flavor < ApplicationRecord
  belongs_to :shop

  def dairy?
    if dairy_free
      'Yes'
    else
      'No'
    end
  end

  def nuts?
    if nut_free
      'Yes'
    else
      'No'
    end
  end

  def self.sort_flavors_by_name
    order(:flavor_name)
  end

  def self.total_number_of_flavors
    self.count
  end

  def self.sort_out_false_booleans
    where('dairy_free' => true, 'nut_free' => true)
  end

end
