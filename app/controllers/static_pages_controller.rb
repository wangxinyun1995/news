class StaticPagesController < ApplicationController
  def home
    params['resource'] ||= 'weibo'
    @news = New.where(resource: params['resource']).limit(50)
  end

  def help
  end

  def home_resource
    resource = params['resource']
    @news = New.where(resource: resource).limit(30)
    render layout: false
  end

end
