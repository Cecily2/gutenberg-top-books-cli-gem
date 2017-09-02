class GutenbergTopBooks::CLI

  def run
    # Get time period and item count preferences from user
    time = choose_data_time
    count = choose_title_count

    # Scrape data, add to list, and print a list of titles
    data = GutenbergTopBooks::Scraper.scrape_list(time, count)
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
    puts "When would you like to view data for?"
    puts "Yesterday  |  Last 7 Days   |  30 Days"
    time = gets.strip
    if time == "1" || time.downcase == "yesterday"
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

  def view_download_links
    puts "Enter the number of a book to view download options:"
    num = gets.strip
    num.to_i
  end

  def choose_download_options
    puts "View in browser: HTML, ePub, or Kindle?"
    choice = gets.strip
    choice.downcase
  end

  def open_in_browser(book, format)
    url = "http://" + book.send("#{format}")
    system('open', url)
  end

end
