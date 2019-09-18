# encoding: utf-8
namespace :data do

  desc "同步数据"
  task :sync_data => :environment do
    Setting.resource.each do |resource|
      New.select(resource)
    end
  end

  desc "同步抓取resource"
  task :sync_resource => :environment do
    Setting.snatch_log_resource = SnatchLog.pluck(:resource).uniq
  end
end
