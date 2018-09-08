set :branch, 'master'

#role :app, %w{apuser@118.27.20.28}
#role :web, %w{apuser@118.27.20.28}
#role :db,  %w{apuser@118.27.20.28}

server '118.27.20.28', user: 'apuser', roles: %w{web app db}, port: 10022

set :ssh_options, {
  port: 10022, #XXXにポート番号
  keys: [File.expand_path('D:\Create\ruby\key\twitmovie\apuser/id_rsa')], #'~/.ssh/id_rsa'部分をローカル環境の鍵のパスに
  forward_agent: true,
  auth_methods: %w(publickey)
}