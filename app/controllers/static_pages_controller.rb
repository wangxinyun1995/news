class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def home_resource
    resource = params['resource']
    @news = New.where(resource: resource).limit(30)
    # render layout: false
  end

end
