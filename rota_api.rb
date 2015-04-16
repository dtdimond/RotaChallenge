require 'rest-client'
require 'pp'
require 'json'
 
class RotaAPI
 
  def initialize
    @base_url = 'http://rota.praetorian.com/rota/service/play.php'
    res = RestClient.get("#{@base_url}?request=new")
    @cookies = res.cookies
  end
 
  def place(x)
    JSON.parse(RestClient.get("#{@base_url}?request=place&location=#{x}", :cookies => @cookies))
  end
 
  def move(x, y)
    JSON.parse(RestClient.get("#{@base_url}?request=move&from=#{x}&to=#{y}", :cookies => @cookies))
  end
 
  def status
    JSON.parse(RestClient.get("#{@base_url}?request=status", :cookies => @cookies))
  end
 
  def reset
    res = RestClient.get("#{@base_url}?request=new")
    @cookies = res.cookies
    JSON.parse(res)
  end
 
end


