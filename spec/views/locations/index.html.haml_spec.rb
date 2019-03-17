require 'rails_helper'

RSpec.describe "locations/index", type: :view do
  before(:each) do
    assign(:locations, [
      Location.create!(
        url: "Url",
        title: "Title"
      ),
      Location.create!(
        url: "Url1",
        title: "Title"
      )
    ])
  end

  it "renders a list of locations" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
