FactoryBot.define do

  factory :user do
    nickname              {"菅田将暉"}
    first_name            {"将暉"}
    first_name_kana       {"マサキ"}
    last_name             {"菅田"}
    last_name_kana        {"スダ"}
    email                 {"sudamasaki@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end

end