require 'rails_helper'

RSpec.describe "arts/index", :type => :view do
  before(:each) do
    assign(:arts, [
      Art.create!(
        :title => "Title",
        :description => "MyText",
        :latitude => 1.5,
        :longitude => 1.5,
        :address => 1.5
      ),
      Art.create!(
        :title => "Title",
        :description => "MyText",
        :latitude => 1.5,
        :longitude => 1.5,
        :address => 1.5
      )
    ])
  end

  it "renders a list of arts" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
