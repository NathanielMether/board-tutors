require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :user => nil,
      :profile => nil,
      :content => "MyText",
      :rating => 1
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do

      assert_select "input[name=?]", "review[user_id]"

      assert_select "input[name=?]", "review[profile_id]"

      assert_select "textarea[name=?]", "review[content]"

      assert_select "input[name=?]", "review[rating]"
    end
  end
end
