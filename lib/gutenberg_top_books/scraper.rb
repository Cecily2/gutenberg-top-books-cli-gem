class GutenbergTopBooks::Scraper

  def self.scrape_list(time, count)
    doc = Nokogiri::HTML(open("https://www.gutenberg.org/browse/scores/top"))
    binding.pry
  end

  def self.scrape_download_links(url)
  end

end
