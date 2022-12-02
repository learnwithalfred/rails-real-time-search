FactoryBot.define do
  factory :search do
    ip_address { '127.00.00' }
    query { 'MyString' }
    results_count { 'MyString' }
  end
end
