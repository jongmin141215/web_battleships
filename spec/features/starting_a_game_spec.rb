require 'spec_helper'

feature 'Starting a new game' do
  scenario 'There is a link to a new game' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
  end

  scenario 'There is a form to enter your name' do
    visit '/new_game'
    fill_in('name', with: 'Jongmin')
    click_button 'submit'
    expect(page).to have_content "Welcome Jongmin"
  end

  scenario 'You can start a game by clicking the button' do
    visit 'new_game?name=Usman'
    click_button 'Start Game'
    expect(page).to have_button('Place Ship')
  end
end
