Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'], path_prefix: '/auth/entry', callback_path: '/auth/entry/twitter/callback'
    provider :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'], path_prefix: '/auth/post', callback_path: '/auth/post/twitter/callback'
  end