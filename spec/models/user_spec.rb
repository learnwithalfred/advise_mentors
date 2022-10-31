require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user should have valid attributes' do
    user = FactoryBot.build(:user)

    it 'expect user to be valid with valid input filds' do
      expect(user).to be_valid
    end

    it 'user should not be valid without a name' do
      user = FactoryBot.build(:user, name: '')
      expect(user).to_not be_valid
    end
  end
end
