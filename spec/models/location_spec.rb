require 'rails_helper'

describe Location do
  it 'has a valid factory' do
    expect(build(:location)).to be_valid
  end

  let(:rss_feed) { build(:location, url: nil) }

  describe ' ActiveModel validations' do
    it { expect(rss_feed).to_not be_valid }
  end
end
