require_relative 'store_data'

module List
  def all_books
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
    puts "\n"
    resume
  end

  def all_people
    fetch_data('users').each do |person|
      puts "[#{person["class"]}] Name: #{person["name"]}, ID: #{person["id"]}, Age: #{person["age"]}"
    end
    puts "\n"
    resume
  end

  def all_rental_by_id
    print 'ID of person: '
    user_id = gets.chomp

    puts 'Rentals:'
    @rentals.each do |rental|
      if rental.person.id.to_s == user_id
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end

    puts "\n"
    resume
  end
end
