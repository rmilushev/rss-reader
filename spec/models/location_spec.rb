require 'rails_helper'

# RSpec.describe Location, type: :model do
#   pending
# end
#
describe Location, 'validation' do
  it { should validate_presence_of(:url) }
end
