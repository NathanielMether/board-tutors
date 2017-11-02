require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
      :user => nil,
      :profile_image_data => "MyString",
      :board_sport => "MyString",
      :price => 1,
      :locations => "MyString",
      :bio => "MyText",
      :description => "MyText"
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

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
