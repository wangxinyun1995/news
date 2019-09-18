module ApplicationHelper

	# 分页显示序号
  def show_index(index, per = 10)
    params[:page] ||= 1
    (params[:page].to_i - 1) * per.to_i + index + 1
  end

end
