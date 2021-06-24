FactoryBot.define do
  factory :contact do
    name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
    birthdate { Faker::Date.birthday }
    email { Faker::Internet.email }
    address { Faker::Address.street_name }
    franchise { "visa_debit" }
    credit_card { Faker::Stripe.valid_card(card_type: franchise) }
  end
end
