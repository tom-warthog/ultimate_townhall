require_relative 'lib/views/index.rb'
require_relative 'lib/views/done.rb'
require_relative 'lib/app/townhalls_mailer.rb'



arr = [{"ville" => "Grenoble", "email" => "nicolas.bertin0@gmail.com", "departement" => "Isère"},
{"ville" => "Meylan", "email" => "ludovic.bourgoin@gmail.com", "departement" => "Isère"}]

input = 1
while input.between?(1, 3) do

  input = Index.new.perform

  case input
  when 1
    Scrapper.new.perform
  when 2
    Mailer.new(arr).perform
  when 3
    Follower.new.perform
  end

  Done.new(input).perform
end
