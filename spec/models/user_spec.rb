require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation_tests' do 
    it 'should have an email address' do
      user = User.new(password: '222222').save
      expect(user).to eq(false)
    end
    it 'should be saved successfully' do
      user = User.new(email: "test@test.com", password: "testtest").save
      expect(user.present?).to eq(true)
    end
  end

  context 'scope_tests' do
  end
end
