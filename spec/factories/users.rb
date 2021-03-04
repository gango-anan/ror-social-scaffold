FactoryBot.define do
    factory :user do
      email { "#{ SecureRandom.hex(4) }@gango.org" }
      name { "#{ SecureRandom.hex(4) }" }
      password { "#{ SecureRandom.hex(5) }" }
    end
end