class ParkService
  def park_by_state(state)
    get_url("/api/v1/parks?stateCode=#{state}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://developer.nps.gov") do |f|
      f.params["api_key"] = ENV["porks_key"]
    end
  end
end