require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#followings' do
    it "can list all of the user's followers" do
      user = create(:user)
      friend1 = create(:user)
      friend2 = create(:user)
      friend3 = create(:user)

      Bond.create user: user, friend: friend1, state: Bond::FOLLOWING
      Bond.create user: user, friend: friend2, state: Bond::FOLLOWING
      Bond.create user: user, friend: friend3, state: Bond::REQUESTING

      expect(user.followings).to include(friend1, friend2)
      expect(user.follow_requests).to include(friend3)
    end
  end

  describe '#followers' do
    it "can list all of the user's followers" do
      user1 = create(:user)
      user2 = create(:user)
      follower1 = create(:user)
      follower2 = create(:user)
      follower3 = create(:user)
      follower4 = create(:user)

      Bond.create user: follower1, friend: user1, state: Bond::FOLLOWING
      Bond.create user: follower2, friend: user1, state: Bond::FOLLOWING
      Bond.create user: follower3, friend: user2, state: Bond::FOLLOWING
      Bond.create user: follower4, friend: user1, state: Bond::REQUESTING

      expect(user1.followers).to eq([follower1, follower2])
      expect(user2.followers).to eq([follower3])
    end
  end
end
