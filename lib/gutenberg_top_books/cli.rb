class CLI

  def run

  end

  def choose_data_time
    puts "When would you like to view data for?"
    puts "Yesterday  |  Last 7 Days   |  30 Days"
    time = gets.strip
    if time.downcase == "yesterday"
      answer = "yesterday"
    elsif time.includes?("7") || time.downcase.includes?("seven")
      answer = "7"
    elsif time.includes?("30") || time.downcase.includes?("thirty")
      answer = "30"
    else
      puts "Invalid input"
    end
    answer
  end


end
