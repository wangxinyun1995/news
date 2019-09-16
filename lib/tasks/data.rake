# encoding: utf-8
namespace :data do

  desc "同步数据"
  task :sync_data => :environment do
		New.snatch_weibo
  end

end
