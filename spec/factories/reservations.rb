FactoryBot.define do
  factory :reservation do
    start_time { '02-11-2019 19:00' }
    covers { %w[Simon Mark] }
    restaurant
    user
  end
end
