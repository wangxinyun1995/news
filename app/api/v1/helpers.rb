module V1
  module Helpers
    def current_user
      name = params[:name].to_s
      password = params[:password].to_s
      @current_user = User.find_by(name: name)
      auth = false
      auth = true if @current_user && @current_user.authenticate(password)
      auth ? @current_user : nil
    end

    def authenticate!
      error!({success: false, desc: '帐号或密码错误!'}, 200) unless current_user
    end

    def generate_token!
      @user_key = UserKey.create(user_id: @current_user.id)
    end

    def authenticate_token!
      @user_key ||= UserKey.find_by(access_token: params[:token].to_s)
      if @user_key.blank?
        error!({success: false, desc: 'token_not_found!'}, 200)
      elsif @user_key.expires_at < Time.current
        error!({success: false, desc: 'token_expired!'}, 200)
      else
        @user_key.user
      end
    end
  end
end
