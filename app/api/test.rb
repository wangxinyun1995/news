require 'grape'
class Test < Grape::API
	format :json
  get :ping do
    { data: New.all.order("id desc").limit(5) }
  end
	if Rails.env.development?
    add_swagger_documentation(
      mount_path: 'swagger_doc',
      hide_format: true,
      hide_documentation_path: true
    )
  end
end
