class New < ApplicationRecord
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
			h = New.find_or_initialize_by(
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
		cookie = 'd_c0="AAAjNL6rqQ2PTiNRRfDuo-5rXK8Kr9xlMoU=|1527504718"; _zap=b50dddb3-d32d-4a33-bbd1-78e43ff1dfcb; _xsrf=jOECpGcQURi29kktYbCLNWueTMlOcMaw; __gads=ID=60398a04d5756724:T=1543572435:S=ALNI_MbdsYXsx8MKGhgw2OsMGGrXfhqgBw; __utma=51854390.2101595817.1560411061.1560411061.1560411061.1; __utmz=51854390.1560411061.1.1.utmcsr=zhihu.com|utmccn=(referral)|utmcmd=referral|utmcct=/; __utmv=51854390.100-1|2=registration_date=20140319=1^3=entry_date=20140319=1; capsion_ticket="2|1:0|10:1567134353|14:capsion_ticket|44:ZGVjMjdiMWRkOTNlNGFmN2E1NTRlY2FmMDA1NDUxOWQ=|93956ceb4ce9077bba0a075e65198bd04d3b5c2e563a17211f5bbdbd706eade0"; l_n_c=1; r_cap_id="ZGFmZTEzNGI1MDZiNGNjM2IyOTM5ZWYxN2ZiNDU2MDI=|1567134361|6f6d298ab73606a22c55ea88a0a25bf61fc90c8b"; cap_id="ODNkYWZjZWM1ZGMxNDgyMGE2YTIzMzQ3MjQ1MTcwNjg=|1567134361|093f0e5b6ea644266dee1f29252a9d5706ced020"; l_cap_id="YmIzMGZkYjFkZGFjNDUyODgxNmZiZTllNDY3MzU4YzY=|1567134361|3860016a6b76a86f9e73f60551a6f560f7e924f8"; n_c=1; z_c0=Mi4xX3ZOQkFBQUFBQUFBQUNNMHZxdXBEUmNBQUFCaEFsVk5wT0JWWGdDRGc3VDdLRjRzM1gzcl9pcnlORkV6dHR3QWV3|1567134372|72db55e79bcb77cedc7d2c3b530bba1d3dca5ebb; tshl=; tst=h; q_c1=84130694e21e44e782006924e7f478ff|1567254451000|1558430927000; tgw_l7_route=f2979fdd289e2265b2f12e4f4a478330'
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
			h = New.find_or_initialize_by(resource: 'zhihu',
																		 no: row.css('.HotItem-rank').text,
																		 title: row.css('.HotItem-content a').attribute('title').value,
																		 origin_url: row.css('.HotItem-content a').attribute('href').value,
																	 	 hot: row.css('.HotItem-content .HotItem-metrics').map(&:text).join().chomp("分享"),
																		 description: row.css('.HotItem-content a p').text,
																		 image_url: row.css('a img').present? ? row.css('a img').attribute('src').value : ''
																	 )
			next if h.title.blank?
			h.save
		end
	end
end
