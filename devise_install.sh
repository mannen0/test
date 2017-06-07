#!/bin/bash

# rails new myshop
# cd myshop
# rails g scaffold product name:string price:integer stock:integer note:text
echo "gem 'devise'" >> Gemfile
bundle
rails g devise:install
sed -e '$d' config/environments/development.rb > tmp.dat
echo "  config.action_mailer.default_url_options = { host: 'localhost',port: 3000 }
end" >> tmp.dat
rm config/environments/development.rb
mv tmp.dat config/environments/development.rb
sed -i -e '$d' config/routes.rb
echo "  root 'products#index'
end" >> config/routes.rb
sed -i -e 's/<body>/<body>\n\t<p class="notice"><%= notice %><\/p>\n\t<p class="alert"><%= alert %><\/p>/g' app/views/layouts/application.html.erb
rails g devise User

sed -i -e '2i   before_action :authenticate_user!' app/controllers/application_controller.rb
rails g devise:views
sed -i -e 's/# t./t./g' db/migrate/$(ls db/migrate/ | tail -n1)
sed -i -e 's/# add/add/g' db/migrate/$(ls db/migrate/ | tail -n1)
sed -i -e 's/validatable/validatable,\n\t :confirmable, :lockable/g' app/models/user.rb
rails db:migrate
rails s
