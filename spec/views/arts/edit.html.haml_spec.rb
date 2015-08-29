require 'rails_helper'

RSpec.describe "arts/edit", :type => :view do
  before(:each) do
    @art = assign(:art, Art.create!(
      :title => "MyString",
      :description => "MyText",
      :latitude => 1.5,
      :longitude => 1.5,
      :address => 1.5
    ))
  end

  it "renders the edit art form" do
    render

    assert_select "form[action=?][method=?]", art_path(@art), "post" do

      assert_select "input#art_title[name=?]", "art[title]"

      assert_select "textarea#art_description[name=?]", "art[description]"

      assert_select "input#art_latitude[name=?]", "art[latitude]"

      assert_select "input#art_longitude[name=?]", "art[longitude]"

      assert_select "input#art_address[name=?]", "art[address]"
    end
  end
end
