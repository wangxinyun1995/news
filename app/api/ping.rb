class Ping < Grape::API
	desc 'Ping pong'
	params do
	 requires :access_token,  type: String, desc: 'access_token.'
	 requires 'resource', type: String,  desc: '来源'
  end
  get :test do
		authenticate_token!
		{ data: New.where(resource: params['resource']).order("id desc").limit(5) }
  end

	desc 'Pingtest'
	get :ping do
		'success!' 
	end
end