class StaticPagesController < ApplicationController
  def home
    params['resource'] ||= 'weibo'
    @news = New.where(resource: params['resource']).order('id desc').limit(51).reverse
  end

  def help
  end

  def home_resource
    resource = params['resource']
    @news = New.where(resource: resource).limit(30)
    render layout: false
  end

end
