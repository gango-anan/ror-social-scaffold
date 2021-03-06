require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#friends' do
    it "can list all of the user's friends" do
      user = create(:user)
      friend1 = create(:user)
      friend2 = create(:user)
      friend3 = create(:user)

      Bond.create user: user, friend: friend1, state: true
      Bond.create user: user, friend: friend2, state: true
      Bond.create user: user, friend: friend3, state: false

      expect(user.friends).to include(friend1, friend2)
      expect(user.friends).not_to include(friend3)
    end

    it "can list all of the user's pending friendship requests" do
      user = create(:user)
      friend1 = create(:user)
      friend2 = create(:user)
      friend3 = create(:user)
      friend4 = create(:user)

      Bond.create user: user, friend: friend1, state: true
      Bond.create user: user, friend: friend2, state: true
      Bond.create user: user, friend: friend3, state: false
      Bond.create user: user, friend: friend4, state: false

      expect(user.friend_requests).to include(friend3, friend4)
      expect(user.friend_requests).not_to include(friend1, friend2)
    end
  end
end