FactoryBot.define do
    factory :comment do
      user_id { create(:user) }
      post_id { create(:post) }
      content { SecureRandom.hex(50).to_s }
    end
end