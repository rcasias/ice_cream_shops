require 'rails_helper'

RSpec.describe Flavor, type: :model do
  it {should belong_to :shop}
end
