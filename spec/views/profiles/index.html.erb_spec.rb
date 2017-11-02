require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        :user => nil,
        :profile_image_data => "Profile Image Data",
        :board_sport => "Board Sport",
        :price => 2,
        :locations => "Locations",
        :bio => "MyText",
        :description => "MyText"
      ),
      Profile.create!(
        :user => nil,
        :profile_image_data => "Profile Image Data",
        :board_sport => "Board Sport",
        :price => 2,
        :locations => "Locations",
        :bio => "MyText",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Profile Image Data".to_s, :count => 2
    assert_select "tr>td", :text => "Board Sport".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Locations".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
