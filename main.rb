require_relative 'rental'
require_relative 'book'
require_relative 'classroom'
require_relative 'person'
require_relative 'student'
require_relative 'corrector'
require_relative 'teacher'

class App
  def initialize
    @books = []
    @rentals = []
    @people = []
    end

  def run
    puts 'Welcome to School Library App!'

    loop do
        actions

        option = gets.chomp

        break if option == '7'

        handle_action option
    end

    puts 'Thank you for using this app!'
    end

    private

  def handle_action(option)
    case option
    when '1'
        all_books
    when '2'
        all_people
    when '3'
        create_person
    when '4'
        create_book
    when '5'
        create_rental
    when '6'
        all_rental_by_id
    else
        puts 'That is not a valid option'
    end
   end

  def actions
    puts
    puts 'Choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def reply(name)
    sleep 1
    puts "\n#{name} created successfully!!!"
    sleep 1
    resume
  end

  def resume
    print "\nDo you wish to continue? [Y/N]: "
    input = gets.chomp

    if input.downcase == 'y' || input.downcase == 'yes' || input == ''
      clear
      run
    else
      exit
    end
  end

  def invalid_prompt
    clear
    puts 'Incorrect selection, please try again!'
    sleep 1
  end

  def clear
    print "\e[2J\e[f"
  end

  def exit
    clear
    nil
  end

  def create_person
    puts "\nPlease select a number to choose an option:"
    puts '1 - Create a student'
    puts '2 - Create a teacher'
    puts '0 - Exit'
    user = gets.chomp

    case user
    when '1'
      create_student
    when '2'
      create_teacher
    when '0'
      exit
    else
      invalid_prompt
      create_user
    end
  end

  def create_student
    print 'Name: '
    name = gets.chomp.capitalize

    print 'Age: '
    age = gets.chomp.to_i

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase

    student = Student.new(parent_permission, age, name)
    @people << student

    puts 'Student created'
    sleep 1.2
  end

  def create_teacher
    print 'Name: '
    name = gets.chomp.capitalize

    print 'Age: '
    age = gets.chomp.to_i

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name)
    @people << teacher

    puts 'Teacher created'
    sleep 1.2
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books.push(Book.new(title, author))
    reply('Book ')
  end

  def create_rental
    puts "Select a book from the following list by number:\n"

    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end

    book_index = gets.chomp

    puts "\nSelect a person from the following list by number (not id):"

    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    user_index = gets.chomp

    if book_index.to_i >= @books.length || user_index.to_i >= @people.length
      clear
      puts "The user/book selected does not exist.\n"
      resume
    end

    print "\nDate: "
    date = gets.chomp

    @rentals.push(Rental.new(@people[user_index.to_i], @books[book_index.to_i], date))
    reply('Rental')
  end

  def all_books
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
    puts "\n"
    resume
  end

  def all_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
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

def main
    app = App.new
    app.run
end

main