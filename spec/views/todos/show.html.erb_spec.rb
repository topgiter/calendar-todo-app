require 'rails_helper'

RSpec.describe "todos/show", :type => :view do
  before(:each) do
    @todo = assign(:todo, Todo.create!(
      :title => "Title",
      :description => "MyText",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Status/)
  end
end
