class Rental
    initialize(date book, person)
    @date = date
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
    end

    attr_accessor :date
    attr_reader :book, :person
end