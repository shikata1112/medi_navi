source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4', '>= 5.2.4.3'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 4.0.1'
  gem 'rails-controller-testing'
  gem 'launchy', '~> 2.4.3'
  gem 'factory_bot_rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # N+1を検出
  gem 'bullet'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'webdrivers', '~> 4.0'
  gem 'capybara'
  gem "shoulda-matchers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'bootstrap-sass', '~> 3.3.6'
gem 'jquery-rails'

# railsでslimを利用するためのgem
gem 'slim-rails'

#html.erbをhtmle.slimに変換するためのgem
gem 'html2slim'

# devise機能
gem 'devise' 
gem 'devise-bootstrap-views'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'rails-i18n'

# デバッグ binding.pry
gem 'pry-rails'

# reCAPTCHA
gem 'recaptcha', require: "recaptcha/rails"

# 住所自動入力
gem 'jp_prefecture'

# 画像投稿
gem "refile", require: "refile/rails", github: 'manfe/refile'
gem "refile-mini_magick"

# 画像複数投稿
gem 'carrierwave'
gem 'mini_magick'

# 月間登録者推移
gem 'lazy_high_charts'

# 親、子の同時登録
gem 'nested_form_fields'

# カレンダー機能
gem 'fullcalendar-rails'
gem 'momentjs-rails'

gem 'font-awesome-sass'

# タグ付け関連
gem 'acts-as-taggable-on'
gem 'jquery-ui-rails'

# google API関連
gem 'geocoder'

# japanMap
gem 'jcanvas-rails', '~> 0.1.0'

# pv付与
gem 'impressionist', '~>1.6.1'

# SNSログイン
gem 'omniauth'
gem 'omniauth-facebook'

# バッチ処理
gem 'whenever', require: false

# ページネーション
gem 'kaminari'

# ダミーデータ生成
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'

gem 'rubocop', '~> 1.4', require: false

# 環境変数、mysql
gem 'dotenv-rails'
group :production do
  gem 'mysql2'
end