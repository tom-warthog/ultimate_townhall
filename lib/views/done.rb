class Done

  def initialize(input)
    @input = input
  end

  def display_results
    case @input
    when 1
    puts "Scrapping terminé!"
    when 2
    puts "Spam terminé!"
    when 3
    puts "Tu as bien follow les mairies!"
    when 4
    puts "A bientôt!"
    end
  end

  def perform
    display_results
  end
end
