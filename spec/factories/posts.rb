FactoryBot.define do
    factory :post do
      user = create{ :user }
      user_id { user.id }
      content { SecureRandom.hex(50).to_s }
    end
end