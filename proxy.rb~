require 'em-proxy'
require 'faraday'

Proxy.start(:host => "0.0.0.0", :port => 8080, :debug => false) do |conn|

  conn.on_data do |data|
    http = Faraday.new(:url => 'http://localhost:9292') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    http.get "/?action=#{data}"
  end
end
