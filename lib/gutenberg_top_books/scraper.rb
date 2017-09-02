class GutenbergTopBooks::Scraper

  def self.scrape_list(time, count)
    books_array = []
    doc = Nokogiri::HTML(open("https://www.gutenberg.org/browse/scores/top/index.html", "Accept-Encoding" => ""))
    doc.css("h2#books-last#{time} + ol li")[0 .. count-1].each do |book|
      if book.css("a").text.include?(" by ")
        book_info = book.css("a").text.split(" by ")
        title = book_info[0]
        author = book_info[1].split(" (")[0]
      else
        title = book.css("a").text.split(" (")[0]
        author = "N/A"
      end
      link = book.css("a").attribute("href").value
      books_array << { :title => title, :author => author, :link => link }
    end
    books_array
  end

  def self.scrape_download_links(url)
    doc = Nokogiri::HTML(open("https://www.gutenberg.org#{url}", "Accept-Encoding" => ""))

    html = doc.css('table a').detect{|a|a.text =~ /Read this book online/}.attr("href")
    epub = doc.css('table a').detect{|a|a.text =~ /EPUB/}.attr("href")
    kindle = doc.css('table a').detect{|a|a.text =~ /Kindle/}.attr("href")

    download_links = {:html => html, :epub => epub, :kindle => kindle}
  end

end
