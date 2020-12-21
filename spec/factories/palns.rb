FactoryBot.define do
  factory :plan do
    title        { 'タイトル'}
    concept      { 'これはテスト文章です。' }
    item         {'①アイテム'}
    process      {'これはテスト文章です。'}
    time         { 15 }
    timezone_id    { 1 }
    category_id  { 1 }
    season_id  { 1 }
    user_id { 1 }
    place { '屋内' }
    cost { 3000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

