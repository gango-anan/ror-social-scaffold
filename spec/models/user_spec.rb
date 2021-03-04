require 'rails_helper'

RSpec.describe User, type: :model do
    describe '#followinds' do
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
end