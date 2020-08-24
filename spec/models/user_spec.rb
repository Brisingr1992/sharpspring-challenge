# == Schema Information
#
# Table Name: Users
#
# t.string "first_name", limit: 20, null: false
# t.string "last_name", limit: 20
# t.string "email", limit: 200, null: false
# t.string "password_digest", null: false
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false
#

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensure presence of first name' do
      user = User.new(email: 'sample@example.com', password: 'test').save
      expect(user).to be_falsey
    end

    it 'ensure presence of email' do
      user = User.new(first_name: 'first', password: 'test').save
      expect(user).to be_falsey
    end

    it 'ensure presence of password' do
      user = User.new(email: 'sample@example.com', password: 'test').save
      expect(user).to be_falsey
    end

    it 'ensure uniqueness of email' do
      User.create!(first_name: 'first', email: 'sample@example.com', password: 'test')
      user = User.new(first_name: 'first', email: 'sample@example.com', password: 'test')
      expect(user).to_not be_valid
    end

    it 'ensure email is in right pattern' do
      user = User.new(first_name: 'first', email: 'sample', password: 'test')
      expect(user).to_not be_valid
    end

    it 'user should save successfully' do
      user = User.new(first_name: 'first', email: 'sample@example.com', password: 'test').save
      expect(user).to be
    end
  end

  context 'scope tests' do
    # let(:params) { {first_name: 'first', last_name: 'last', email: 'sample@example.com', password: 'test'} }
    # before(:each) do
    #   User.new(params).save
    # end
  end
end