class GutenbergTopBooks::Scraper

  def self.scrape_list(time, count)
    doc = Nokogiri::HTML(open("https://www.gutenberg.org/browse/scores/top/index.html", "Accept-Encoding" => ""))
    # Look at correct list based on TIME argument
    # "7", "30", or "yesterday"


    correct_list = nil
    if count == 1
      correct_list = doc.css("h2#books-last1 + ol").first.children
    elsif count == 7
      correct_list = doc.css("h2#books-last7 + ol").first.children
    else
      correct_list = doc.css("h2#books-last30 + ol").first.children
    end

    books_array = []

    correct_list.css("li")[0 .. count-1].each do |book|
      book_info = book.css("a").text.split(" by ")
      title = book_info[0]
      author = book_info[1].split(" (")[0]
      link = book.css("a").attribute("href").value
      books_array << { :title => title, :author => author, :link => link }
    end
    books_array
    binding.pry
  end

  def self.scrape_download_links(url)
  end

end
