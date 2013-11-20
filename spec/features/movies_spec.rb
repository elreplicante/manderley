require "spec_helper"

feature "Moviesmanagement" do
  scenario "adds a new movie" do
    
    visit new_movie_path
    fill_in "Title", with: "hola"
    fill_in "Duration", with: 122
    fill_in "Year", with: 1999
    fill_in "Categories", with: "Action"
    fill_in "Synopsis", with: "My synopsis"

    expect {
      click_button 'Create Movie'
    }.to change(Movie, :count)

    expect(current_path).to eq()

    expect(page).to have_content 'My synopsis'
    within 'h3' do
      expect(page).to have_content('hola')
    end
  end
end