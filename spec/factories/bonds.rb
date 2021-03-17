FactoryBot.define do
  factory :bond do
    user_id { create(:user).id }
    friend_id { create(:user).id }
    confirmed { false }
  end
end
