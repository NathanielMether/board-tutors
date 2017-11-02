require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :user => nil,
      :profile_image_data => "Profile Image Data",
      :board_sport => "Board Sport",
      :price => 2,
      :locations => "Locations",
      :bio => "MyText",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Profile Image Data/)
    expect(rendered).to match(/Board Sport/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Locations/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
