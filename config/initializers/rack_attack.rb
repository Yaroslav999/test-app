class Rack::Attack
  throttle('req/ip', limit: 300, period: 5.minutes) do |req|
    req.ip
  end

  blocklist('block bad IPs') do |req|
    ['192.122.1.1', '245.0.113.0'].include?(req.ip)
  end
end
