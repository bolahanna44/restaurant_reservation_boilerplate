FactoryBot.define do
  factory :restaurant do
    name { 'KFC' }
    phone { '19777' }
    cuisines { 'fast_food' }
    email { 'kfc@gmail.com' }
    location { 'burj khalifa' }
    opening_hours { '5:00 AM to 12:00 AM' }
  end
end
