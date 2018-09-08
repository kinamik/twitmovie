set :branch, 'master'

role :app, %w{apuser@118.27.20.28}
role :web, %w{apuser@118.27.20.28}
role :db,  %w{apuser@118.27.20.28}

server '118.27.20.28', user: 'apuser', roles: %w{web app db}

set :ssh_options, {
    forward_agent: true,
    auth_methods: %w(publickey),
    port: 10022
}