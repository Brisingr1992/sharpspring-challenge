require 'rails_helper'

RSpec.feature "Notes", type: :feature do
  context 'Add New Note' do
    let(:user) { User.create!(first_name: 'first', last_name: 'last', email: 'test@notes.io', password: 'password') }
    before(:each) do
      sign_in(user)
      visit new_note_path
    end

    scenario 'create a note successfully without body' do
      within('form') do
        fill_in 'note_title', with: 'Title'
      end

      click_on(class: 'btn btn-primary create')
      expect(page).to have_content('Note successfully created!')
    end

    scenario 'create a note successfully with title and body' do
      within('form') do
        fill_in 'note_title', with: 'Title'
        fill_in 'note_body', with: 'A very large body!!!'
      end

      click_on(class: 'btn btn-primary create')
      expect(page).to have_content('Note successfully created!')
    end

    scenario 'create a note successfully without title' do
      within('form') do
        fill_in 'note_body', with: 'A very large body!!!'
      end

      click_on(class: 'btn btn-primary create')
      expect(page).to have_content('Note successfully created!')
    end

    scenario 'Note creation failed' do
      click_on(class: 'btn btn-primary create')
      expect(page).to have_content('Note successfully created!')
    end
  end

  context 'Edit Note' do
    let(:user) { User.create!(first_name: 'first', last_name: 'last', email: 'test@notes.io', password: 'password') }
    let(:note) { Note.create!(title: 'title', body: 'A very big body!', user_id: user.id) }
    before(:each) do
      sign_in(user)
      visit edit_note_path(note.id)
    end

    scenario 'Note creation failed' do
      click_on(class: 'btn btn-primary create')
      expect(page).to have_content('Note was successfully updated.')
    end

    scenario 'create a note successfully with title and body' do
      within('form') do
        fill_in 'note_title', with: 'Update Title'
        fill_in 'note_body', with: 'A very large updated body!!!'
      end

      click_on(class: 'btn btn-primary create')
      expect(page).to have_content('Note was successfully updated.')
    end
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
