require 'grape'
require 'grape-swagger'
class Test < Grape::API
	format :json
	# 捕获 ActiveRecord::RecordNotFound 异常
	 rescue_from ActiveRecord::RecordNotFound do |_|
		 # rack_response('{"error": "资源不存在！"}', 404)
		 error!({success: false, desc: '资源不存在!'}, 404)
	 end

	 rescue_from Grape::Exceptions::ValidationErrors do |e|
		 error!({success: false, desc: e.full_messages.to_s}, 200)
	 end

	helpers TestHelpers
 	mount Ping
	mount Auth
	if Rails.env.development?
    add_swagger_documentation(
      mount_path: 'swagger_doc',
      hide_format: true,
      hide_documentation_path: true
    )
  end
end
