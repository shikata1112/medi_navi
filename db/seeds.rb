# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Member.create!(
  [
    {
      name: '秀',
      email: 'shu@gmail.com',
      password: '111111',
      password_confirmation: '111111',
      prefecture_code: '27',
      address: '大阪市淀川区西中島3-14-28',
      postcode: '5320011',
      birthday: '1994-11-12',
      sex: 'true',
    }
  ]
)


Prefecture.create(name: '北海道', slug: 'hokkaido')
Prefecture.create(name: '青森', slug: 'aomori')
Prefecture.create(name: '秋田', slug: 'akita')
Prefecture.create(name: '岩手', slug: 'iwate')
Prefecture.create(name: '宮城', slug: 'miyagi')
Prefecture.create(name: '山形', slug: 'yamagata')
Prefecture.create(name: '福島', slug: 'fukushima')
Prefecture.create(name: '栃木', slug: 'tochigi')
Prefecture.create(name: '茨城', slug: 'ibaraki')
Prefecture.create(name: '群馬', slug: 'gunma')
Prefecture.create(name: '埼玉', slug: 'saitama')
Prefecture.create(name: '千葉', slug: 'chiba')
Prefecture.create(name: '東京', slug: 'tokyo')
Prefecture.create(name: '神奈川', slug: 'kanagawa')
Prefecture.create(name: '新潟', slug: 'nigata')
Prefecture.create(name: '富山', slug: 'toyama')
Prefecture.create(name: '石川', slug: 'ishikawa')
Prefecture.create(name: '福井', slug: 'fukui')
Prefecture.create(name: '山梨', slug: 'yamanashi')
Prefecture.create(name: '長野', slug: 'nagano')
Prefecture.create(name: '岐阜', slug: 'gifu')
Prefecture.create(name: '静岡', slug: 'shizuoka')
Prefecture.create(name: '愛知', slug: 'aichi')
Prefecture.create(name: '三重', slug: 'mie')
Prefecture.create(name: '滋賀', slug: 'shiga')
Prefecture.create(name: '京都', slug: 'kyoto')
Prefecture.create(name: '大阪', slug: 'osaka')
Prefecture.create(name: '兵庫', slug: 'hyougo')
Prefecture.create(name: '奈良', slug: 'nara')
Prefecture.create(name: '和歌山', slug: 'wakayama')
Prefecture.create(name: '鳥取', slug: 'tottori')
Prefecture.create(name: '島根', slug: 'simane')
Prefecture.create(name: '岡山', slug: 'okayama')
Prefecture.create(name: '広島', slug: 'hiroshima')
Prefecture.create(name: '山口', slug: 'yamaguchi')
Prefecture.create(name: '徳島', slug: 'tokushima')
Prefecture.create(name: '香川', slug: 'kagawa')
Prefecture.create(name: '愛媛', slug: 'ehime')
Prefecture.create(name: '高知', slug: 'kouchi')
Prefecture.create(name: '福岡', slug: 'fukuoka')
Prefecture.create(name: '佐賀', slug: 'saga')
Prefecture.create(name: '長崎', slug: 'nagasaki')
Prefecture.create(name: '熊本', slug: 'kumamoto')
Prefecture.create(name: '大分', slug: 'oita')
Prefecture.create(name: '宮崎', slug: 'miyazaki')
Prefecture.create(name: '鹿児島', slug: 'kagoshima')
Prefecture.create(name: '沖縄', slug: 'okinawa')