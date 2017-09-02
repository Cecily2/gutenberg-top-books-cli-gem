class GutenbergTopBooks::Scraper

  def self.scrape_list(time, count)
    doc = Nokogiri::HTML(open("https://www.gutenberg.org/browse/scores/top/index.html", "Accept-Encoding" => ""))

    doc.css("h2#books-last#{time} + ol li")[0 .. count-1].collect do |book|
      link = book.css("a").attribute("href").value
      # Check if book has an author...
      if book.css("a").text.include?(" by ")
        book_info = book.css("a").text.split(" by ")
        title = book_info[0]
        author = book_info[1].split(" (")[0]
        { :title => title, :author => author, :link => link }
      else
        title = book.css("a").text.split(" (")[0]
        { :title => title, :link => link }
      end
    end
  end

  def self.scrape_download_links(url)
    doc = Nokogiri::HTML(open("https://www.gutenberg.org#{url}", "Accept-Encoding" => ""))
    html = doc.css('table a').detect{|a|a.text =~ /Read this book online/}.attr("href")
    epub = doc.css('table a').detect{|a|a.text =~ /EPUB/}.attr("href")
    kindle = doc.css('table a').detect{|a|a.text =~ /Kindle/}.attr("href")

    {:html => html, :epub => epub, :kindle => kindle}
  end

end
