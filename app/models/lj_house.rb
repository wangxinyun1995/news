class LjHouse < ApplicationRecord
    has_one :lj_house_info

    # def ips
    #     [*1..11].each do |num|
    #       doc = HTTP.get("https://zz.rm-rf.one/api/proxy_pools?page=#{num}")
    #       infos = (JSON.parse doc)['data']
    #       infos.each do |info|
    #         Setting.ips = Setting.ips << info['attributes']
    #       end
    #     end   
    # end
    
    def self.snatch_lianjia
        header = [{'User-Agent': 'Baiduspider'}]
        Nokogiri::HTML(RestClient.get('https://cd.lianjia.com/xiaoqu/', headers=header[rand(header.size)-1]), 'UTF-8').css('dd div a').each do |zone|
            zone_url = zone.attribute('href').value
            url = "https://cd.lianjia.com#{zone_url}"
            zone_html = Nokogiri::HTML(RestClient.get(url, headers=header[rand(header.size)-1]), 'UTF-8')
            total = zone_html.css('.total span').text.to_f
            puts(total)
            puts(zone_url)
            next if LjHouse.where(zone_url: zone_url, day: 20200801).size == total
            page_nums = (total / 30).ceil
            puts(page_nums)
            [*1..page_nums].each do |num|
                house_url = "https://cd.lianjia.com#{zone_url}pg#{num}cro22/"
                puts("page_nums: #{page_nums}, page: #{num}")
                puts("zone_url: #{zone_url},total: #{total}, yizhuaqu: #{LjHouse.where(zone_url: zone_url, day: 20200801).size}, #{house_url}")
                h = header[rand(header.size)-1]
                puts(h)
                html = Nokogiri::HTML(RestClient.get(house_url, headers=h), 'UTF-8')
                table = html.css('ul.listContent').first.css("li")
                table.each do |row|
                    info = row.css('.info .title a')
                    chengjiao = row.css('.houseInfo a').first
                    zufang = row.css('.houseInfo a').last
                    sell = row.css('.xiaoquListItemSellCount a')
                    next if LjHouse.exists?(lj_house_name: info.text, day: 20200801)
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
                            lj_house_sell_num: (sell.text)[/\d+/].to_i,
                            day: 20200801
                    )
                end
            end
       end
	end
end