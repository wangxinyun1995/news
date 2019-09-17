# elastic_urls = ["localhost:9200"]
elastic_urls = ["localhost:9200"]
Searchkick.client = Elasticsearch::Client.new(hosts: elastic_urls, retry_on_failure: true)
