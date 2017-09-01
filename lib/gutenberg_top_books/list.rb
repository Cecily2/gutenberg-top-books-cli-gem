class GutenbergTopBooks::List

  def initialize(list = nil)
    @list = []
    add_to_list(list) unless list == nil
  end

  def add_to_list(list)
    list.each do |book|
      title = book[:title]
      author = book[:author]
      link = book[:link]
      new_book = GutenbergTopBooks::Book.new(title, author, link)
      @list << new_book
    end
  end

  def print_titles
    @list.each.with_index(1) do |book, index|
      index > 9 ? space = " " : space = "  "
      puts "#{index}.#{space}#{book.title}"
      puts "    by #{book.author}"
      puts "--------------------"
    end
  end

  def list
    @list
  end

end
