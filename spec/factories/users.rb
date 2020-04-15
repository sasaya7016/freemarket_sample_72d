FactoryBot.define do
  
  factory :user do
    nickname                   {"abe"}
    lastname                   {"田中"}
    firstname                  {"太郎"}
    lastnameKANA               {"タナカ"}
    firstnameKANA              {"タロウ"}
    birth_date                 {"1992-01-01"}
    email                      {"mmm@gmail.com"}
    password                   {"00000000"}
    password_confirmation      {"00000000"}

  end
end