require_relative 'rental'
require_relative 'book'
require_relative 'classroom'
require_relative 'person'
require_relative 'student'
require_relative 'corrector'
require_relative 'teacher'
require_relative 'helper_methods'
require_relative 'add_data'
require_relative 'query_data'
require_relative 'store_data'

class App
  include Tools
  include Create
  include List
  include HandleData

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
      create_person
    when '2'
      create_book
    when '3'
      create_rental
    when '4'
      all_books
    when '5'
      all_people
    when '6'
      all_rental_by_id
    else
      puts 'That is not a valid option'
    end
  end

  def actions
    puts
    puts 'Choose an option by entering a number:'
    puts '1 - Create a user'
    puts '2 - Create a book'
    puts '3 - Create a rental'
    puts '4 - List all books'
    puts '5 - List all people'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def update_people(people)
    @people << people
    save_person('people', people)
  end

  # def update_books(book)
  #   @books << book
  #   save_book('books', book)
  # end

  # def update_rentals(rental)
  #   @rentals << rental
  #   save_rental('rentals', rental)
  # end

  attr_reader :people
  # , :books, :rentals
end

def main
  app = App.new
  app.run
end

main
