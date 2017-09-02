class GutenbergTopBooks::Book
  attr_accessor :title, :author, :link, :html, :epub, :kindle

  def initialize(title, author, link)
    @title = title
    @author = author
    @link = link
  end

  def add_download_urls(attributes)
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
  end

end
