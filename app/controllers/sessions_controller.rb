class SessionsController < ApplicationController
  def new
    end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
     # 创建一个错误消息
     flash[:danger] = '邮箱/密码不正确' # 不完全正确
     render 'new'
   end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
