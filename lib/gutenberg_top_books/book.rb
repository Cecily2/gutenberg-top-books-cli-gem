class GutenbergTopBooks::Book
  attr_accessor :name, :author, :link, :html, :epub, :kindle

  def initialize(name, author, link)
    @name = name
    @author = author
    @link = link
  end

  def add_download_urls(attributes)
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
  end

end
