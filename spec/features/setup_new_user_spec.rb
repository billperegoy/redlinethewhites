require 'rails_helper'

feature 'If no user logged in' do
  scenario 'they see an info page' do
    visit root_path
    expect(page).to have_css '.about-page'
    expect(page).to have_link('Sign In')
    expect(page).to have_link('Sign Up')
  end

  scenario 'user can sign up for an account' do
    pending
    visit root_path
    click_link 'Sign Up'
    expect(page).to have_css '.sign-up-form'
  end
end
#feature 'User creates a foobar' do
#  scenario 'they see the foobar on the page' do
#    visit new_foobar_path
#
#    fill_in 'Name', with: 'My foobar'
#    click_button 'Create Foobar'
#
#    expect(page).to have_css '.foobar-name', 'My foobar'
#  end
#end
