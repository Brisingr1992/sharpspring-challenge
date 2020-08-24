# == Schema Information
#
# Table Name: Notes
#
# t.string "first_name", limit: 20, null: false
# t.string "last_name", limit: 20
# t.string "email", limit: 200, null: false
# t.string "password_digest", null: false
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false
#
# add_foreign_key "notes", "users"
#

require 'rails_helper'

RSpec.describe Note, type: :model do
  context 'validation tests' do
    let(:user) { User.create!(first_name: 'first', email: 'sample@example.com', password: 'test') }

    it 'validate presence of user id' do
      note = Note.new(title: 'Sample title', body: 'Sample body').save
      expect(note).to be_falsey
    end

    it 'validate presence of title, body' do
      note = Note.new(user_id: user.id).save
      expect(note).to be_falsey
    end

    it 'validate presence of title with body' do
      note = Note.new(body: 'Sample body', user_id: user.id).save
      expect(note).to be_truthy
    end

    it 'note should save successfully' do
      note = Note.new(title: 'Sample title', body: 'Sample body', user_id: user.id).save
      expect(user).to be
    end
  end
end