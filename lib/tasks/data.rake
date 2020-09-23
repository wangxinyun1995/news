# encoding: utf-8
namespace :data do

  desc "同步数据"
  task :sync_data => :environment do
    Setting.resource.each do |resource|
      Setting.snatch_log_resource = SnatchLog.pluck(:resource).uniq
      New.select(resource)
    end
  end

  desc "发送邮件"
  task :send_email => :environment do
    Email.in_time.find_each do |email|
      NoticeMailer.notice_email('329414837@qq.com', email).deliver_now
    end
  end

  desc "同步西瓜数据"
  task :sync_xigua_data => :environment do
    New.snatch_xigua
    Email.create!(subject: "#{Time.now.strftime("%Y%m%d")}西瓜数据已获取，请点击网址查看!", content: "今日西瓜数据，请点击网址查看!", time: Time.now)
    Email.in_time.find_each do |email|
      NoticeMailer.notice_email('329414837@qq.com', email).deliver_now
    end
  end
  
end
