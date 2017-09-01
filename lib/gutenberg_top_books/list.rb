class List

  def initialize(*list)
    @list = []
    add_to_list(list) unless list == nil
  end

  def add_to_list(list)
    # Accepts array of book hashes?
    list.each do |book|
      title = book[title]
      author = book[author]
      new_book = Book.new(title, author)
      @list << new_book
    end
  end

  def list
    @list
  end

# Receives info from scraper
# Processes it
# Creates books (OR tells the book class to do this)
# Creates list of those books (for CLI to print)

end
