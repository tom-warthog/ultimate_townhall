require 'json'

arr = [{"ville" => "Grenoble", "email" => "nicolas.bertin0@gmail.com", "departement" => "Isère"},
{"ville" => "Meylan", "email" => "ludovic.bourgoin@gmail.com", "departement" => "Isère"}]


@handles = []

$arr.each_with_index do |h, i|
  h['twitter'] = @handles[i]
end

def create_json(arr)
 File.open("/home/nico/THP/ultimate_townhall/db/townhall.json","w") do |f|
   f.puts JSON.pretty_generate(arr)
 end
end

create_json(arr)

def get_all_cities
  json = File.read('/home/nico/THP/ultimate_townhall/db/townhall.json')
  @cities = []
  JSON.parse(json).each do |h|
    @cities << h["ville"]
  end
  p @cities
end
