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

class App
  include Tools
  include Create
  include List

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
    when '7'
      exit
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
end

def main
  app = App.new
  app.run
end

main
