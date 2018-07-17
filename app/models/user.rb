class User < ActiveRecord::Base
    #引数に関連するユーザーが存在すればそれを返し、存在しければ新規に作成する
      def self.find_or_create_from_auth_hash(auth_hash)
    #OmniAuthで取得した各データを代入していく
        provider = auth_hash[:provider]
        uid = auth_hash[:uid]
        nickname = auth_hash[:info][:nickname]
        image_url = auth_hash[:info][:image]
    
        User.find_or_create_by(provider: provider, uid: uid) do |user|
          user.username = nickname
          user.image_url = image_url
        end
      end
    end