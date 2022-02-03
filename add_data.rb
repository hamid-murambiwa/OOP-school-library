require './student'
require './teacher'

module Create
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
    update_people(student)

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
    puts 'Select one of the books of the list below: '
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }

    book_id = gets.chomp.to_i

    puts 'Select a person number (not id) from the list below'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s

    rental = Rental.new(date, @people[person_id], @books[book_id])
    @rentals << rental

    puts 'Rental created'
    sleep 1.2
  end
end
