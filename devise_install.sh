#!/bin/bash

echo "gem 'devise'" >> Gemfile
bundle
rails g devise:install
echo "config.action_mailer.default_url_options = { host: 'localhost',port: 3000 }" >> config/environments/development.rb
echo "root 'products#index'" >> config/routes.rb
echo "<p class="notice"><%= notice %></p><p class="alert"><%= alert %></p>" >> "app/views/layouts/application.html.erb"
rails g devise User

echo "before_action :authenticate_user!" >> app/controllers/application_controller.rb
rails g devise:views
# comment out db/migrate/20170607082918_devise_create_users.rb
echo ",:confirmable, :lockable" >> app/models/user.rb
rails db:migrate
rails s
 
