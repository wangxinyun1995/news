class LjHouseSelled < ApplicationRecord
  def self.snatch_selled(snatch_day)
    header = [{'User-Agent': 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.6) Gecko/20091201 Firefox/3.5.6'}]

    Parallel.each(LjHouse.all, in_threads: Setting.thread_cout) do |house|
      ActiveRecord::Base.connection_pool.with_connection do
        next if house.id < Setting.xiaoqu_start  || house.id > Setting.xiaoqu_end
        house_name = house.lj_house_name
        begin
          # ip = Setting.ips[rand(Setting.ips.count - 1)]
          url = "https://cd.lianjia.com/chengjiao/c#{house.lj_house_id}/"
          puts("使用url: #{url}")
          html_total_url = HTTP.headers(header[rand(header.size - 1)]).get url
        rescue 
          puts("重新访问网页: #{url}")
          Setting.ips -= [ip]
          retry
        end
        html_total = Nokogiri::HTML(html_total_url.to_s, nil, 'UTF-8')
        total = html_total.css('.total span').text.to_f

        begin
          # ip = Setting.ips[rand(Setting.ips.count - 1)]
          url = "https://cd.lianjia.com/api/listtop?semParams[semResblockId]=#{house.lj_house_id}&semParams[semType]=resblock&semParams[semSource]=chengjiao_xiaoqu"
          puts("使用 url: #{url}")
          html_doc_url = HTTP.headers(header[rand(header.size - 1)]).get url
        rescue
          puts("重新访问网页: #{url}")
          Setting.ips -= [ip]
          retry
        end

        html_doc = Nokogiri::HTML(html_doc_url.to_s, nil, 'UTF-8')
        name = (JSON.parse html_doc)['data']['info']['name'] rescue next
        if name != house_name
          Setting.re_selled << house_name
          next
        end
        puts("#{house_name} total #{total}")
        next if LjHouseSelled.where(lj_house_name: house_name, snatch_day: snatch_day).size == total
        next if total == 0 || total > 10000
        page_nums = (total / 30).ceil
        [*1..page_nums].each do |num|
          page_url = "https://cd.lianjia.com/chengjiao/pg#{num}ddo21c#{house.lj_house_id}/"
          puts("#{house_name} page_total: #{page_nums}, page: #{num}")
          puts("#{page_url}")
  
          begin
            # ip = Setting.ips[rand(Setting.ips.count - 1)]
            url = page_url
            puts("使用 url: #{url}")
            sell_doc_url = HTTP.headers(header[rand(header.size - 1)]).get url
   
          rescue
            puts("重新访问网页: #{url}")
            Setting.ips -= [ip]
            retry
          end

          sell_doc = Nokogiri::HTML(sell_doc_url.to_s, nil, 'UTF-8')
          table = sell_doc.css('ul.listContent').first.css("li")
          table.each_with_index do |row, index|
            info_url = row.css(".title a").attribute('href').value
            real_total = LjHouseSelled.where(lj_house_name: house_name, snatch_day: snatch_day).size
            puts(info_url)
            puts("页码: #{num}, 序号: #{index + 1}, 链家总共: #{total} ,已抓取: #{real_total}, 小区: #{house_name}, 小区id: #{house.id}")

            begin
              # ip = Setting.ips[rand(Setting.ips.count - 1)]
              url = info_url
              puts("使用 url: #{url}")
              info_doc_url = HTTP.headers(header[rand(header.size - 1)]).get url
  
          rescue
              puts("重新访问网页: #{info_url}")
              Setting.ips -= [ip]
              retry
            end

            info = Nokogiri::HTML(info_doc_url.to_s, nil, 'UTF-8')
            images = {}
            info.css('#thumbnail2 ul li').each do |image|
              images.merge!({ "#{image.attribute('data-src').value}" => "#{image.attribute('data-desc').value}" })
            end
            info_msg = info.css('.msg span label')
            content = info.css(".base .content li")
            deal_info = info.css(".transaction .content li")

            deal_record = []
            info.css(".record_list li").each do |record|
              deal_record << record.text
            end
            
            intro = {}
            info.css(".introContent .baseattribute").each do |intro_info|
              intro.merge!({intro_info.css('.name').text => intro_info.css('.content').text.strip})
            end

            yezhu_intro = {}
            info.css(".yezhuSell .bd .txt div").each do |yezhu_info|
              yezhu_intro.merge!({yezhu_info.css('b').text => yezhu_info.css('span').text.strip})
            end

            next if LjHouseSelled.exists?(info_url: info_url, snatch_day: snatch_day)
            self.create!(
                lj_house_name: house_name,
                info_url: info_url,
                desc_name: info.css('.house-title .wrapper .index_h1').text,
                sell_date: info.css('.house-title .wrapper span').text.delete('成交').strip.to_date,
                total: info.css('.dealTotalPrice i').text.to_f,
                average_price: info.css('.price b').text.to_f,
                listing_price: info_msg[0].text.to_f,
                deal_day: info_msg[1].text.to_i,
                price_diff_time: info_msg[2].text.to_i,
                daikan: info_msg[3].text.to_i,
                star: info_msg[4].text.to_i,
                youlan: info_msg[5].text.to_i,
                images: images,
                room_type: content[0].children[1].text.strip,
                floor: content[1].children[1].text.strip,
                area: content[2].children[1].text.to_f,
                room_structure: content[3].children[1].text.strip,
                inner_area: content[4].children[1].text.to_f,
                build_type: content[5].children[1].text.strip,
                look: content[6].children[1].text.strip,
                build_year: content[7].children[1].text.to_i,
                decoration: content[8].children[1].text.strip,
                build_structure: content[9].children[1].text.strip,
                heating: content[10].children[1].text.strip,
                elevator: content[11].children[1].text.strip,
                is_elevator: content[12].children[1].text.strip,
                lj_deal_no: deal_info[0].children[1].text.strip,
                deal_ownership: deal_info[1].children[1].text.strip,
                listing_time: (deal_info[2].children[1].text.to_date rescue nil),
                property: deal_info[3].children[1].text.strip,
                room_age: deal_info[4].children[1].text.strip,
                room_ownership: deal_info[5].children[1].text.strip,
                deal_record: deal_record,
                intro: intro,
                yezhu_intro: yezhu_intro,
                snatch_day: snatch_day)

            time = rand 15..30
            puts("睡眠#{time}秒")
            sleep time
          end
        end
      end
    end
	end
end

