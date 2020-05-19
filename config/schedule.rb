# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
every 10.minutes do
  rake "data:sync_data"
end


# 定时查询昨天wait_pay的订单 未发送成功的 重新发送
every 1.day, :at => ['09:10 am','19:30 pm'] do
  rake "data:send_email"
end

# Learn more: http://github.com/javan/whenever
