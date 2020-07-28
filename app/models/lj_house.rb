class LjHouse < ApplicationRecord
    has_one :lj_house_info

    def ips
        [*1..11].each do |num|
          doc = HTTP.get("https://zz.rm-rf.one/api/proxy_pools?page=#{num}")
          infos = (JSON.parse doc)['data']
          infos.each do |info|
            Setting.ips = Setting.ips << info['attributes']
          end
        end   
    end
    
    def self.snatch_lianjia
        header = [{'User-Agent': 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.6) Gecko/20091201 Firefox/3.5.6'},
            {'User-Agent': 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.12 Safari/535.11'},
            {'User-Agent': 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)'},
            {'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:34.0) Gecko/20100101 Firefox/34.0'},
            {'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36'},
            {'User-Agent': 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_8; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50'},
            {'User-Agent': 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50'},
            {'User-Agent': 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0'},
            {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:2.0.1) Gecko/20100101 Firefox/4.0.1'},
            {'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; rv:2.0.1) Gecko/20100101 Firefox/4.0.1'},
            {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11'},
            {'User-Agent': 'Opera/9.80 (Macintosh; Intel Mac OS X 10.6.8; U; en) Presto/2.8.131 Version/11.11'},
            {'User-Agent': 'Opera/9.80 (Windows NT 6.1; U; en) Presto/2.8.131 Version/11.11'}]
        Nokogiri::HTML(RestClient.get('https://cd.lianjia.com/xiaoqu/', headers=header[rand(header.size)-1]), 'UTF-8').css('dd div a').each do |zone|
            zone_url = zone.attribute('href').value
            url = "https://cd.lianjia.com#{zone_url}"
            zone_html = Nokogiri::HTML(RestClient.get(url, headers=header[rand(header.size)-1]), 'UTF-8')
            total = zone_html.css('.total span').text.to_f
            puts(total)
            puts(zone_url)
            next if LjHouse.where(zone_url: zone_url).size == total
            page_nums = (total / 30).ceil
            puts(page_nums)
            [*1..page_nums].each do |num|
                house_url = "https://cd.lianjia.com#{zone_url}pg#{num}cro22/"
                puts("#{house_url}")
                h = header[rand(header.size)-1]
                puts(h)
                html = Nokogiri::HTML(RestClient.get(house_url, headers=h), 'UTF-8')
                table = html.css('ul.listContent').first.css("li")
                table.each do |row|
                    info = row.css('.info .title a')
                    chengjiao = row.css('.houseInfo a').first
                    zufang = row.css('.houseInfo a').last
                    sell = row.css('.xiaoquListItemSellCount a')
                    next if LjHouse.exists?(lj_house_name: info.text)
                    h = LjHouse.create(
                            zone_url: zone_url,
                            lj_house_id: row.attribute('data-id').value,
                            lj_house_url: info.attribute('href').text,
                            lj_house_name: info.text,
                            lj_house_chengjiao_url: chengjiao.attribute('href').value,
                            lj_house_chengjiao_num: (chengjiao.text).scan(/\d/).join('').delete('90').to_i,
                            lj_house_zufang_url: (zufang.attribute('href').value rescue nil),
                            lj_house_zufang_num: (zufang.text).to_i,
                            month: (row.css('.priceDesc').text)[/\d+/].to_i,
                            average_price: (row.css('.totalPrice span').text).to_f,
                            lj_house_sell_url: sell.attribute('href').value,
                            lj_house_sell_num: (sell.text)[/\d+/].to_i
                    )
                end
                time = rand(30)
                puts(time)
                sleep time
            end
       end
	end
end