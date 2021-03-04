FactoryBot.define do
    factory :user do
      email { "#{ SecureRandom.hex(4) }@gango.org" }
      name { ['Max', 'Gango', 'Anan', 'Galiwango', 'Ananiya'].sample }
    end
end