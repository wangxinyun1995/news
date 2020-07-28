class LjHouseSell < ApplicationRecord
  def self.snatch_sell(snatch_day)
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
    LjHouse.all.find_each do |house|
      start = Setting.sell_start_bd
      endd = Setting.sell_end_bd
      next if house.id < start  || house.id > endd
      house_name = house.lj_house_name
      html_doc = Nokogiri::HTML(RestClient.get(URI.escape("https://cd.lianjia.com/ershoufang/c#{house.lj_house_id}/"), headers=header[rand(header.size)-1]), 'UTF-8')
      total = html_doc.css('.total span').text.to_f
      html_doc = Nokogiri::HTML(RestClient.get(URI.escape("https://cd.lianjia.com/api/listtop?semParams[semResblockId]=#{house.lj_house_id}&semParams[semType]=resblock&semParams[semSource]=ershou_xiaoqu"), headers=header[rand(header.size)-1]), 'UTF-8')
      name = (JSON.parse html_doc)['data']['info']['name']
      if name != house_name
        Setting.re_sell << house_name
        next
      end
      puts("#{house_name} total #{total}")
      next if LjHouseSell.where(lj_house_name: house_name, snatch_day: snatch_day).size == total
      next if total == 0 || total > 3000
      page_nums = (total / 30).ceil
      [*1..page_nums].each do |num|
        page_url = "https://cd.lianjia.com/ershoufang/pg#{num}co21c#{house.lj_house_id}/"
        puts("#{house_name} page_total: #{page_nums}, page: #{num}")
        puts("#{page_url}")
        sell_doc = Nokogiri::HTML(RestClient.get(URI.escape(page_url), headers=header[rand(header.size)-1]), 'UTF-8')
        table = sell_doc.css('ul.sellListContent').first.css("li")
        table.each_with_index do |row, index|
          info_url = row.css(".title a").attribute('href').value
          next if LjHouseSell.exists?(info_url: info_url, snatch_day: snatch_day)
          real_total = LjHouseSell.where(lj_house_name: house_name, snatch_day: snatch_day).size
          puts(info_url)
          puts("页码: #{num}, 序号: #{index + 1}, 链家总共: #{total} ,已抓取: #{real_total}, 小区: #{house_name}, #{house.id}")
          info = Nokogiri::HTML(RestClient.get(info_url, headers=header[rand(header.size)-1]), 'UTF-8')
          images = {}
          info.css('#thumbnail2 ul li').each do |image|
            images.merge!({ "#{image.attribute('data-src').value}" => "#{image.attribute('data-desc')&.value}" })
          end
          content = info.css(".introContent .base .content li")
          deal_info = info.css(".transaction .content li span")
          
          intro = {}
          info.css(".introContent .baseattribute").each do |intro_info|
            intro.merge!({intro_info.css('.name').text => intro_info.css('.content').text.strip})
          end
          property = deal_info[7].text
          if property == '车库'
            floor = content[0].children[1].text
            area = content[1].children[1].text.to_f
            look = content[2].children[1].text
            room_type = info.css(".houseInfo .room .mainInfo").text
          else  
            floor = content[1].children[1].text
            area = content[2].children[1].text.to_f
            look = content[6].children[1].text
            room_type = content[0].children[1].text
          end
          name = info.css('.communityName .info').text
          next if name != house_name
          self.create!(
              lj_house_name: name,
              info_url: info_url,
              desc_name: info.css('.sellDetailHeader h1').text,
              listing_price: info.css('.price .total').text.to_f,
              square_price: info.css('.unitPrice span').text.to_f,
              build_year: info.css('.area .subInfo').text.to_i,
              lj_house_no: info.css('.houseRecord .info').children[0].text,
              room_type: room_type,
              floor: floor,
              area: area,
              room_structure: (content[3].children[1].text rescue nil),
              inner_area: (content[4].children[1].text.to_f rescue nil),
              build_type: (content[5].children[1].text rescue nil),
              look: look,
              build_structure: (content[7].children[1].text rescue nil),
              decoration: (content[8].children[1].text rescue nil),
              elevator: (content[9].children[1].text rescue nil),
              is_elevator: (content[10].children[1].text rescue nil),
              listing_date: deal_info[1].text&.to_date,
              deal_ownership: deal_info[3].text,
              last_deal: deal_info[5].text,
              property: deal_info[7].text,
              room_year: deal_info[9].text,
              room_ownership: deal_info[11].text,
              mortgage_info: deal_info[13].text.strip,
              deed_image: deal_info[15].text,
              star: info.css('#favCount').text.to_i,
              intro: intro,
              images: images,
              snatch_day: snatch_day)

          time = rand 3..6
          puts(time)
          sleep time
        end
      end
    end
	end
end

