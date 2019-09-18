class StaticPagesController < ApplicationController
  def home
    params['resource'] ||= 'weibo'
    @news = New.where(resource: params['resource']).order('id desc').limit(50).reverse
  end

  def help
  end

  def home_resource
    resource = params['resource']
    @news = New.where(resource: resource).limit(50)
    render layout: false
  end

  def search
    conditions = {
      language: "chinese",
      misspellings: false,
      highlight: {tag: "<span class='red'>"},
      load: false,
      index_name: [New],
      page: params[:page],
      per_page: 20
    }
    params[:k] = '*' if params[:k].blank?
    @news = Searchkick.search "#{params[:k]}", conditions
  end

  def log
    @logs = SnatchLog.all.page(params[:page]).per(10)
  end

end
