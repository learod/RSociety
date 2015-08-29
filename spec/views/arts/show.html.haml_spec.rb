require 'rails_helper'

RSpec.describe "arts/show", :type => :view do
  before(:each) do
    @art = assign(:art, Art.create!(
      :title => "Title",
      :description => "MyText",
      :latitude => 1.5,
      :longitude => 1.5,
      :address => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
