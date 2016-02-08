require 'rails_helper'

feature "New Crew Member" do

  scenairo "visitor assigns new crew member to starship" do
    Given "visitor views new crew member form"
    When "vistor enters crew member info assigning to existing starship"
    Then "visitor views updated starship"
  end

  scenario "visitor creates crew member and starship" do
    Given "visitor views new crew member form"
    When "visitor enters crew member and new starship info"
    Then "visitor views new starship"
  end

  let!(:starship) { FactoryGirl.create(:starship) }

  def visitor_views_new_crew_member_form
    visit starships_path
    click_link "Create New Crew Member"
    expect(page).to have_content("New Crew Member")
  end

  def visitor_enters_crew_member_info_assigning_to_existing_starship
    fill_in("crew member[name]", with: "Reginald Barclay")
    select("Engineering", from: "crew_member[division]")
    select("Enterprise", from: "crew_member[starship_id]")
    click_button "Create Crew Member"
  end

  def visitor_views_updated_starship
    expect(page).to have_content("Reginald Barclay")
    expect(page).to have_content("Voyager")
  end

  def visitor_enters_crew_member_and_new_starship_info
    fill_in("crew_member[name]", with: "Reginald Barclay")
    select("Engineering", from: "crew_member[division]")
    fill_in("crew_member[starship_attributes][name]", with: "Voyager")
    click_button "Create Crew Member"
  end

end
