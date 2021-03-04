FactoryBot.define do
  factory :user do
    email { "#{SecureRandom.hex(4)}@gango.org" }
    name { SecureRandom.hex(4).to_s }
    password { SecureRandom.hex(5).to_s }
  end
end
