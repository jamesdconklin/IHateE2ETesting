FactoryGirl.define do
  factory :goal do
    user_id 1
    title { Faker::StarWars.planet }
    details {Faker::Yoda.quote}
    private {[true, false].sample}
    completed {[true, false].sample}
  end
end
