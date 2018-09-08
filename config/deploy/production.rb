set :branch, 'master'

role :app, %w{apuser@118.27.20.28}
role :web, %w{apuser@118.27.20.28}
role :db,  %w{apuser@118.27.20.28}

server '118.27.20.28', user: 'apuser', roles: %w{web app db}, port: 10022

set :ssh_options, keys: 'D:\Create\ruby\key\twitmovie\apuser/id_rsa'