class ZanHua < ApplicationRecord
    # def self.snatch_xqbk
    #     [103, 60,79, 53,78,59,75,45, 4, 43,150,70,40,57,162,152,151, 85,69,99,149,41,7,165,61,512,102,366,80,364,133,9,146,1,166,106,107,410,108,100,196,175].each do |row_id|
    #         url = "https://data-api.xuequbaike.com/mini/v3/primary_schools/#{row_id}"
    #         headers={
    #             'Authorization': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo4MTk0MiwiaWF0IjoxNTk2NDQyODgyLCJleHAiOjE1OTkwNzI2Mjh9.3NklAgdbX8N5PGAWWOIptgdoA3pxLgg6heXUNnxHzH8',
    #             'User-Agent':'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36'
    #             }
    #         html_doc =JSON.parse RestClient.get(url, headers=headers)

    #         html_doc['data']['houses'].each do |row|
    #             name = row['name']
    #             LjHouse.find_by(lj_house_name: name).update!(is_snatch: true) rescue next
    #         end
    #     end
    # end
    
    def self.snatch_price
        ZanHua.where(index: 5).each do |zan|
            url = "https://cd.lianjia.com/xiaoqu/rs#{zan.house_name}/"
            header = {'User-Agent': 'Baiduspider'}
            html = Nokogiri::HTML((HTTP.headers(header).get url).to_s, 'UTF-8')
            zan.price = html.css(".totalPrice").text.to_f
            zan.save!
        end
    end
end
