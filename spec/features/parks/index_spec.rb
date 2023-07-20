require "rails_helper"

RSpec.describe "/parks" do
  it "has information about parks from a given state" do
    visit root_path
    select("Tennessee", from: :state)
    click_button "Find Parks"
    expect(current_path).to eq(parks_path)
    expect(page).to have_content('Andrew Johnson National Historic Site')
    expect(page).to have_content("Andrew Johnson's complex presidency (1865-69) illustrates")
    expect(page).to have_content('GPS The GPS setting for Andrew Johnson NHS may be listed as 121 Monument Ave')
    expect(page).to have_content('wednesday: 9:00AM - 4:00PM')
    expect(page).to have_content('monday: Closed')
  end
end