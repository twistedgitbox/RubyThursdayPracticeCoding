require 'rails_helper'

feature "visiting the homepage" do
  scenario "the visitor sees welcome text" do
    visit root_path
    expect(page).to_have_text("Welcome to RubyThursday")
  end

end
