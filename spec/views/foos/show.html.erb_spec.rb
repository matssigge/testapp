require 'rails_helper'

RSpec.describe "foos/show", type: :view do
  before(:each) do
    @foo = assign(:foo, Foo.create!(
      :bar => "Bar"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Bar/)
  end
end
