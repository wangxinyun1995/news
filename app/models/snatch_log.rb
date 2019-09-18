class SnatchLog < ApplicationRecord
	def self.write_log(msg, resource)
		count = Setting.snatch_log_resource.include?(resource) ? Setting.send("#{resource}_no") : 0
		count += 1
		Setting.send("#{resource}_no=", count)
		SnatchLog.create(resource: resource, no: count, log: msg)
	end
end
