FactoryBot.define do
  factory :user do
    first_name { 'Bola' }
    last_name { 'Hanna' }
    sequence(:email) { |n| "bola.hanna#{n}#{n}@gmail.com"}
    password { 12345678 }

    factory :restaurant_user do
      role { 'restaurant' }
    end

    factory :guest_user do
      role { 'guest' }
    end

    factory :admin_user do
      role { 'admin' }
    end
  end
end
