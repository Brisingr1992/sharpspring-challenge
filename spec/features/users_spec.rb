require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'SignUp Users' do
    before(:each) do
      visit signup_path
      within('form') do
        fill_in 'user_first_name', with: 'first'
        fill_in 'user_last_name', with: 'last'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
      end
    end

    scenario 'should be successful' do
      within('form') do
        fill_in 'user_email', with: 'test@notes.io'
      end

      click_button 'Sign Up'
      expect(page).to have_content('Thank you for signing up!')
    end

    scenario 'should fail without email' do
      click_button 'Sign Up'
      expect(page).to have_content('Email or password is invalid')
    end
  end
  
  context 'Edit Users' do
    let(:user) { User.create!(first_name: 'first', last_name: 'last', email: 'test@notes.io', password: 'password') }
    before(:each) do
      sign_in(user)
      visit edit_user_path(user.id)
      within('form') do
        fill_in 'user_first_name', with: 'John'
        fill_in 'user_last_name', with: 'Doe'
        fill_in 'user_password', with: 'qweqweQWE'
        fill_in 'user_password_confirmation', with: 'qweqweQWE'
      end
    end

    scenario 'should be successful' do
      within('form') do
        fill_in 'user_email', with: 'johndoe@gmail.com'
      end

      click_button 'Update'
      expect(page).to have_content('User was successfully updated!')
    end

    scenario 'should fail' do
      within('form') do
        fill_in 'user_email', with: 'wrong'
      end

      click_button 'Update'
      expect(page).to have_content('Email or password is invalid')
    end
  end
  
  context 'Delete User' do
  end

  def sign_in(user)
    visit login_path
    within('form') do
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
    end
    
    click_button 'Log In'
  end
end
