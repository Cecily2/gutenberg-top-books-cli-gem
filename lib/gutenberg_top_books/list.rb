class GutenbergTopBooks::List

  def initialize(list = nil)
    @list = []
    add_to_list(list) unless list == nil
  end

  def add_to_list(list)
    list.each do |book|
      title = book[:title]
      link = book[:link]
      if book[:author]
        author = book[:author]
        new_book = GutenbergTopBooks::Book.new(title, link, author)
      else
        new_book = GutenbergTopBooks::Book.new(title, link)
      end
      @list << new_book
    end
  end

  def print_titles
    @list.each.with_index(1) do |book, index|
      index > 9 ? space = " " : space = "  "
      puts "#{index}.#{space}#{book.title}"
      puts "    by #{book.author}" if book.author
      puts "--------------------"
    end
  end

  def get_book_by_number(num)
    @list[num - 1]
  end

end
