require 'rails_helper'

RSpec.describe "Users", type: :request do
  context 'Get /signup' do
    before do
      get '/signup'
    end

    it { expect(response).to be_success }
  end

  context 'PUT update/:id' do
    let(:attr) do 
      { first_name: 'firstName', last_name: 'lastName', email: 'samplemail@example.com', password: 'testpass' }
    end
  
    before do
      patch :update, params: @user.id, user: attr
      @user.reload
    end

    it { expect(response).to redirect_to(@user) }
    it { expect(@user.email).to eql attr[:email] }
    it { expect(@user.first_name).to eql attr[:first_name] }
    it { expect(@user.last_name).to eql attr[:last_name] } 
    it { expect(@user.password).to eql attr[:password] } 
  end
end
