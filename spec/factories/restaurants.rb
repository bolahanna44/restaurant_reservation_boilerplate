FactoryBot.define do
  factory :restaurant do
    name { 'KFC' }
    phone { '19777' }
    cuisines { 'fast_food' }
    location { 'burj khalifa' }
    opening_hours { '5:00 AM to 12:00 AM' }
    user
  end
end
