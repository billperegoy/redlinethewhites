require 'rails_helper'

feature 'If no user logged in' do
  scenario 'they see an about page' do
    visit root_path
    expect(page).to have_css '.about-page'
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
  end

  scenario 'user can sign up and use an account' do
    visit root_path
    click_link 'Sign up'
    expect(page).to have_text 'Sign up'

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'myPassword'
    click_button 'Sign up'

    expect(page).to have_css('.user-progress-page')
    expect(page).to have_text('user@example.com')
    expect(page).to have_button('Sign out')

    click_button 'Sign out'
    expect(page).to have_text 'Sign in'
  end
end
