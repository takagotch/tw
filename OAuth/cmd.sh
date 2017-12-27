./bin bundle install

./bin/rails g model user provider:string uid:string screen_name:string
./bin/rake db:migrate

./bin/rails g controller base
./bin/rails g controller home index
./bin/rails g controller sessions


