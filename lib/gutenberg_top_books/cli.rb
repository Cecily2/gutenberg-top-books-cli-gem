class GutenbergTopBooks::CLI

  def run
    time = choose_data_time
    count = choose_title_count
    data = GutenbergTopBooks::Scraper.scrape_list(time, count)
    list = GutenbergTopBooks::List.new(data)
    list.print_titles


  end

  def choose_data_time
    puts "When would you like to view data for?"
    puts "Yesterday  |  Last 7 Days   |  30 Days"
    time = gets.strip
    if time.downcase == "yesterday"
      answer = 1
    elsif time.include?("7") || time.downcase.include?("seven")
      answer = 7
    elsif time.include?("30") || time.downcase.include?("thirty")
      answer = 30
    else
      puts "Invalid input"
    end
    answer
  end

  def choose_title_count
    puts "How many titles would you like to see? (Enter 1-100)"
    count = gets.strip
    count.to_i
  end


end
