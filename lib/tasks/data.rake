# encoding: utf-8
namespace :data do

  desc "同步数据"
  task :sync_data => :environment do
    Setting.resource.each do |resource|
      Setting.snatch_log_resource = SnatchLog.pluck(:resource).uniq
      New.select(resource)
    end
  end
  
end
