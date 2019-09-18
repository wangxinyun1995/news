class New < ApplicationRecord
	# 全文检索  searchkick
	searchkick
	# only index records per your `search_import` scope above
	# scope :search_import, -> { where("created_at < ?", Time.now - 1) }

	# def search_data
	# 	{
	# 		title: title,
	# 		description: description
	# 	}
	# end
	# after_save do
	# 	self.reindex
	# end

	def self.select(resource)
		begin
			send("snatch_#{resource}")
			msg = '抓取成功'
		rescue Exception => e
			msg = '抓取失败'
		end
		SnatchLog.write_log(msg, resource)
	end

	def self.snatch_weibo
		url = 'https://s.weibo.com/top/summary?cate=realtimehot'
		html_doc = RestClient.get(url)
		doc = Nokogiri::HTML(html_doc, nil, 'UTF-8')
		table = doc.css('table').last
		rows = table.css('tr')
		rows.each do |row|
			data = row.css('td').map(&:text)
			next if data.blank?
			url = 'https://s.weibo.com/' + row.css('.td-02 a').attribute('href').value
			h = New.creat(
																			 resource: 'weibo',
																			 no: data[0],
																			 title: row.css('.td-02 a').text,
																			 origin_url: url,
																		 	 hot: row.css('.td-02 span').text,
																			 description: row.css('.td-03 i').text,
																			 image_url: row.css('td-02 img').present? ? row.css('td-02 img').attribute('src').value : ''

			)
			next if h.title.blank?
			h.save
		end
	end

	def self.snatch_zhihu
		cookie = Setting.zhihu_cookie
		url = 'https://www.zhihu.com/hot'
		headers={
              'Cookie': cookie,
               'User-Agent':'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36'
            }
		html_doc = RestClient.get(url, headers=headers)
		doc = Nokogiri::HTML(html_doc, nil, 'UTF-8')
		table = doc.css('section')

		table.each do |row|
			next if row.blank?
			hot = row.css('.HotItem-content .HotItem-metrics').map(&:text).join().chomp("分享")
			hot = hot.include?('有奖问答') ? '有奖问答' : hot
			h = New.creat(resource: 'zhihu',
																		 no: row.css('.HotItem-rank').text,
																		 title: row.css('.HotItem-content a').attribute('title').value,
																		 origin_url: row.css('.HotItem-content a').attribute('href').value,
																	 	 hot: hot,
																		 description: row.css('.HotItem-content a p').text,
																		 image_url: row.css('a img').present? ? row.css('a img').attribute('src').value : ''
																	 )
			next if h.title.blank?
			h.save
		end
	end
end
