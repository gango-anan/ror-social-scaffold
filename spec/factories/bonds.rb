FactoryBot.define do
  factory :bond do
    user_id { create(:user).id }
    friend_id { create(:user).id }
    state { false }
  end
end
