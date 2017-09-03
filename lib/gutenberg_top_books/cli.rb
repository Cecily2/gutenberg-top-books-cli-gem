class GutenbergTopBooks::CLI

  def run
    # Get time period and item count preferences from user
    puts "Welcome to the Gutenberg Top Books CLI Gem!"
    time = choose_data_time
    @count = choose_title_count

    # Scrape data, add to list, and print a list of titles
    data = GutenbergTopBooks::Scraper.scrape_list(time, @count)
    list = GutenbergTopBooks::List.new(data)
    list.print_titles

    # Allow user to view download options by book number
    book_number = view_download_links

    # Add download links to book object
    book_object = list.get_book_by_number(book_number)
    book_download_links = GutenbergTopBooks::Scraper.scrape_download_links(book_object.link)
    book_object.add_download_urls(book_download_links)

    # Allow user to choose a format to download
    download_choice = choose_download_options
    open_in_browser(book_object, download_choice)

  end

  def choose_data_time
    puts "Which time period would you like to view the top books for?"
    puts "Yesterday  |  Last 7 Days   |  Last 30 Days"
    time = gets.strip
    if time == "1" || time.downcase == "yesterday"
      answer = 1
    elsif time.include?("7") || time.downcase.include?("seven")
      answer = 7
    elsif time.include?("30") || time.downcase.include?("thirty")
      answer = 30
    else
      error
      answer = choose_data_time
    end
    answer
  end

  def choose_title_count
    puts "How many titles would you like to see? Enter 1-100:"
    count = gets.strip
    answer = count.to_i
    if answer < 1 || answer > 100
      error
      answer = choose_title_count
    end
    answer
  end

  def view_download_links
    puts "Enter the number of a book to view download options:"
    num = gets.strip
    answer = num.to_i
    if answer < 1 || answer > @count
      error
      answer = view_download_links
    end
    answer
  end

  def choose_download_options
    puts "Enter a format to view in browser - HTML, ePub, or Kindle:"
    choice = gets.strip
    answer = choice.downcase
    unless answer.include?("html") || answer.include?("epub") || answer.include?("kindle")
      error
      answer = choose_download_options
    end
    answer
  end

  def open_in_browser(book, format)
    url = "http://" + book.send("#{format}")
    system('open', url)
  end

  def error
    puts "Invalid input! Try again."
  end

end
