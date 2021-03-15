FactoryBot.define do
    factory :user do
        username { "username Test" }
        password { "user password" }
        email { "user@mail.com" }
    end
end