require 'rails_helper'
RSpec.describe Restaurant, type: :model do
  it { should have_many(:dishes) }
end
