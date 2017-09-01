class GutenbergTopBooks::Book
  attr_accessor :name, :author, :html, :epub, :kindle

  def initialize(name, author)
    @name = name
    @author = author
  end

  def add_download_urls(attributes)
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
  end

end
