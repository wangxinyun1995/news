module V1
	class NewsApi < Grape::API
		resource :news_api do
			desc '获取信息接口'
			params do
				requires :token,  type: String, desc: 'token.'
				requires :resource, type: String,  desc: '来源'
			end
			get :access_data do
			  authenticate_token!
				{ data: New.where(resource: params['resource']).order("id desc").limit(50) }
			end

			desc 'Pingtest'
			get :ping do
				{data: 'success'}
			end

			desc 'access'
			params do
				optional :token,     type: String,  desc: 'token'
				requires 'resource', type: String,  desc: '来源'
			end
			get :access_data_without_token do
				{ data: New.where(resource: params['resource']).order("id desc").limit(50) }
			end
		end
	end
end
