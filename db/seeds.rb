
Member.create!(
  [
    {
      name: '四方秀',
      email: 'shu.42111227@gmail.com',
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


Admin.create!(
  [
    {
      email: 'admin@gmail.com',
      password: '111111',
      password_confirmation: '111111',
    }
  ]
)


Clinic.create!(
  [
    {
      name: '西中島南方クリニック',
      doctor: '西中島太郎',
      address: '大阪市淀川区西中島3-14-28',
      phone_number: '111111111',
      official_site: 'https://infratop.jp/',
      explanation: '患者に寄り添うことを第一に考えるクリニックです',
      postcode: '5320011',
      nearest_station: '南方駅（阪急）、西中島南方駅（大阪メトロ）',
    },
    {
      name: '新大阪クリニック',
      doctor: '新大阪太郎',
      address: '大阪市淀川区西中島5',
      phone_number: '000000000',
      official_site: 'https://infratop.jp/',
      explanation: '患者に寄り添うことを第一に考えるクリニックです',
      postcode: '5320011',
      nearest_station: '新大阪駅（JR）',
    },

    {
      name: '十三クリニック',
      doctor: '十三太郎',
      address: '大阪市淀川区十三東2',
      phone_number: '222222222',
      official_site: 'https://infratop.jp/',
      explanation: '患者に寄り添うことを第一に考えるクリニックです',
      postcode: '5320011',
      nearest_station: '十三駅（阪急）',
    },
    {
      name: '梅田スカイクリニック',
      doctor: '梅田太郎',
      address: '大阪市帰宅大淀中1-1-88',
      phone_number: '333333333',
      official_site: 'https://infratop.jp/',
      explanation: '患者に寄り添うことを第一に考えるクリニックです',
      postcode: '5320011',
      nearest_station: '梅田駅（阪急）、大阪駅（JR）',
    },
  ]
)


Genre.create!(
  [
    {medical_department: '整形外科'},
    {medical_department: '内科'},
    {medical_department: '心療内科'},
    {medical_department: '外科'},
    {medical_department: '耳鼻科'},
    {medical_department: '皮膚科'},
    {medical_department: '小児科'},
    {medical_department: '産婦人科'},
    {medical_department: '精神科'},
    {medical_department: '歯科'},
    {medical_department: 'リウマチ科'},
    {medical_department: '循環器内科'},
    {medical_department: '美容外科'},
    {medical_department: '眼科'},
    {medical_department: '形成外科'},
    {medical_department: '泌尿器科'},
    {medical_department: 'リハビリテーション科'},
    {medical_department: '耳鼻咽喉科'},
  ]
)


GenreMap.create!(
  [
    {
      clinic_id: 1,
      genre_id: 1,
    },
    {
      clinic_id: 1,
      genre_id: 11,
    },
    {
      clinic_id: 1,
      genre_id: 16,
    },
    {
      clinic_id: 2,
      genre_id: 2,
    },
    {
      clinic_id: 3,
      genre_id: 1,
    },
    {
      clinic_id: 3,
      genre_id: 14,
    },
    {
      clinic_id: 4,
      genre_id: 5,
    },
    {
      clinic_id: 4,
      genre_id: 17,
    },
  ]
)


Prefecture.create!(
  [
    {name: '北海道', slug: 'hokkaido'},
    {name: '青森', slug: 'aomori'},
    {name: '秋田', slug: 'akita'},
    {name: '岩手', slug: 'iwate'},
    {name: '宮城', slug: 'miyagi'},
    {name: '山形', slug: 'yamagata'},
    {name: '福島', slug: 'fukushima'},
    {name: '栃木', slug: 'tochigi'},
    {name: '茨城', slug: 'ibaraki'},
    {name: '群馬', slug: 'gunma'},
    {name: '埼玉', slug: 'saitama'},
    {name: '千葉', slug: 'chiba'},
    {name: '東京', slug: 'tokyo'},
    {name: '神奈川', slug: 'kanagawa'},
    {name: '新潟', slug: 'nigata'},
    {name: '富山', slug: 'toyama'},
    {name: '石川', slug: 'ishikawa'},
    {name: '福井', slug: 'fukui'},
    {name: '山梨', slug: 'yamanashi'},
    {name: '長野', slug: 'nagano'},
    {name: '岐阜', slug: 'gifu'},
    {name: '静岡', slug: 'shizuoka'},
    {name: '愛知', slug: 'aichi'},
    {name: '三重', slug: 'mie'},
    {name: '滋賀', slug: 'shiga'},
    {name: '京都', slug: 'kyoto'},
    {name: '大阪', slug: 'osaka'},
    {name: '兵庫', slug: 'hyougo'},
    {name: '奈良', slug: 'nara'},
    {name: '和歌山', slug: 'wakayama'},
    {name: '鳥取', slug: 'tottori'},
    {name: '島根', slug: 'simane'},
    {name: '岡山', slug: 'okayama'},
    {name: '広島', slug: 'hiroshima'},
    {name: '山口', slug: 'yamaguchi'},
    {name: '徳島', slug: 'tokushima'},
    {name: '香川', slug: 'kagawa'},
    {name: '愛媛', slug: 'ehime'},
    {name: '高知', slug: 'kouchi'},
    {name: '福岡', slug: 'fukuoka'},
    {name: '佐賀', slug: 'saga'},
    {name: '長崎', slug: 'nagasaki'},
    {name: '熊本', slug: 'kumamoto'},
    {name: '大分', slug: 'oita'},
    {name: '宮崎', slug: 'miyazaki'},
    {name: '鹿児島', slug: 'kagoshima'},
    {name: '沖縄', slug: 'okinawa'},
  ]
)

