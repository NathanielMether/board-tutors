require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :user => nil,
      :profile_image_data => "MyString",
      :board_sport => "MyString",
      :price => 1,
      :locations => "MyString",
      :bio => "MyText",
      :description => "MyText"
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "input[name=?]", "profile[user_id]"

      assert_select "input[name=?]", "profile[profile_image_data]"

      assert_select "input[name=?]", "profile[board_sport]"

      assert_select "input[name=?]", "profile[price]"

      assert_select "input[name=?]", "profile[locations]"

      assert_select "textarea[name=?]", "profile[bio]"

      assert_select "textarea[name=?]", "profile[description]"
    end
  end
end
