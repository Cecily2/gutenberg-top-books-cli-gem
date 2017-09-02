class GutenbergTopBooks::Book
  attr_accessor :title, :author, :link, :html, :epub, :kindle

  def initialize(title, link, author = nil)
    @title = title
    @link = link
    @author = author unless author == nil
  end

  def add_download_urls(attributes)
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
  end

end
