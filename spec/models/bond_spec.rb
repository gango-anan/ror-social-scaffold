require 'rails_helper'

RSpec.describe Bond, type: :model do
  describe '#valid?' do
    it 'is invalid if user_id is blank' do
      user = create(:user)
      friend = create(:user)
      bond = Bond.new(user_id: user.id, friend_id: friend.id)
      expect(bond).to be_valid

      bond.user_id = nil
      expect(bond).not_to be_valid
    end

    it 'is invalid if friend_id is blank' do
      user = create(:user)
      friend = create(:user)
      bond = Bond.new(user_id: user.id, friend_id: friend.id)
      expect(bond).to be_valid

      bond.friend_id = nil
      expect(bond).not_to be_valid
    end
  end
end
