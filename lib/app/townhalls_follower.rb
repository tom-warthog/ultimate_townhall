require 'twitter'
require 'dotenv'
require 'pry'
Dotenv.load

$arr = [{"ville" => "Grenoble", "email" => "nicolas.bertin0@gmail.com", "departement" => "Isère"},
{"ville" => "Meylan", "email" => "ludovic.bourgoin@gmail.com", "departement" => "Isère"},
 {"ville" => "Echirolles", "email" => "ludovic.bourgoin@gmail.com", "departement" => "Isère"}]

class Follower

  def initialize
    @client = Twitter::REST::Client.new do |config|
     config.consumer_key        = ENV["TWITTER_API_KEY"]
     config.consumer_secret     = ENV["TWITTER_API_SECRET_KEY"]
     config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
     config.access_token_secret = ENV["TWITTER_SECRET_ACCESS_TOKEN"]
    end
  end

  def get_all_cities
    json = File.read('..//ultimate_townhall/db/townhall.json') #Update path ...
    @cities = []
    if json != ""
      JSON.parse(json).each do |h|
        @cities << h["ville"]
      end
    end
    @cities
  end

  def find_twitter_handle
    @handles = []
    @cities.each do |city|
      user = @client.user_search(city)[0]
      @client.follow(user)
      @handles << user.name
    end
    @handles
  end

  def add_handles_to_json(arr)
    $arr.each_with_index do |h, i|
      h['twitter'] = @handles[i]
    end
    File.open("/home/nico/THP/ultimate_townhall/db/townhall.json", "w") do |f|
	     f.write([])
    end
    File.open("/home/nico/THP/ultimate_townhall/db/townhall.json","w") do |f|
      f.puts JSON.pretty_generate(arr)
    end
  end

  def perform
    get_all_cities
    find_twitter_handle
    add_handles_to_json($arr)
  end
end

Follower.new.perform
