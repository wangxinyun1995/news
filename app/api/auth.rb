class Auth < Grape::API
	resource :auth do
		desc 'access_token'
		params do
			requires :name,  type: String, desc: 'username.'
	    requires :password,  type: String, desc: 'password.'
		end
		post :access_token do
			authenticate!
			generate_token!
			{success: true, desc: 'refresh_new_token!', access_token: @user_key.access_token, expires_at: @user_key.expires_at.strftime('%Y-%m-%d %H:%M:%S') }
		end
	end
end
