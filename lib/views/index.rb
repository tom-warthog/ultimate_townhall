class Index

  def initialize
    puts "="*35
    puts "que veux tu faire ?"
    puts "1- scrapper les emails des mairies"
    puts "2- envoyer un spam aux mairies"
    puts "3- follow les mairies sur Twitter"
    puts "4- ragequit ce programme"
    puts "="*35
  end

  def perform
    input = gets.chomp.to_i
  end
end
